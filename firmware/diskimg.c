#include "diskimg.h"

#include <string.h>
#include <stdio.h>
#include "configstring.h"
#include "user_io.h"
#include "spi.h"
#include "spi_sd.h"
#include "minfat.h"
#include "uart.h"

struct diskimage diskimg[CONFIG_DISKIMG_UNITS];

// read 8+32 bit sd card status word from FPGA
int user_io_sd_get_status(uint32_t *lba, uint32_t *drive_index) {
	uint32_t s;
	uint8_t c; 

	*drive_index = 0;
	spi_uio_cmd_cont(UIO_GET_SDSTAT);
	c = SPI(0xff);
	if ((c & 0xf0) == 0x60) *drive_index = (SPI(0xff)) & 0x03;
	s = SPI(0xff);
	s = (s<<8) | (SPI(0xff));
	s = (s<<8) | (SPI(0xff));
	s = (s<<8) | (SPI(0xff));
	DisableIO();

	if(lba) *lba = s;

	return c;
}

void user_io_sd_set_config()
{
	unsigned char data[33];
	int capacity;

	if(diskimg[0].type.direct.marker==DISKIMG_SDCARD_MARKER) {
		capacity=sd_size;
	} else {
		capacity=diskimg[0].type.file.size>>9;
	}
	// synthetic CSD for non-MMC storage
	memset(data, sizeof(data), 0);
	data[16+0] = 0x40;
	data[16+1] = 0x0e;
	data[16+3] = 0x32;
	data[16+4] = 0x5b;
	data[16+5] = 0x59;
	data[16+6] = 0x90;
	data[16+7] = (capacity >> 26) & 0xff;
	data[16+8] = (capacity >> 18) & 0xff;
	data[16+9] = (capacity >> 10) & 0xff;
	data[16+10] = 0x5f;
	data[16+11] = 0xc0;
	data[32] = 1; // SDHC

	// and forward it to the FPGA
	spi_uio_cmd_cont(UIO_SET_SDCONF);
	spi_write(data, sizeof(data));
	DisableIO();
}


void diskimg_poll()
{
	int lba;
	unsigned int idx;
	int c;
	c=user_io_sd_get_status(&lba,&idx);
//	printf("diskimg: cmd: %d, lba: %d, idx: %d\n",c,lba,idx);

	if(idx>=CONFIG_DISKIMG_UNITS)
		return;

	// valid sd commands start with "5x" (old API), or "6x" (new API)
	// to avoid problems with cores that don't implement this command
	if((c & 0xf0) == 0x50 || (c & 0xf0) == 0x60) {

#ifdef CONFIG_DISKIMG_SDCARD_CSD
		// check if core requests configuration
		if(c & 0x08)
			user_io_sd_set_config();
#endif

		c&=0x03;
		if(c) {
#ifdef CONFIG_DISKIMG_SDCARD
			if(diskimg[idx].type.direct.marker!=DISKIMG_SDCARD_MARKER)
#endif
				FileSeek(&diskimg[idx].type.file,lba<<9);
		}

		// Write to file/SD Card
		if(c == 0x02) {
//			FileSeek(&diskimg[idx].type.file,lba<<9);
			spi_uio_cmd8(UIO_SD_ACK,idx);
			spi_uio_cmd_cont(UIO_SECTOR_WR);
			spi_read(sector_buffer,512);
			DisableIO();
#ifdef CONFIG_DISKIMG_SDCARD
			if(diskimg[idx].type.direct.marker==DISKIMG_SDCARD_MARKER)
				sd_write_sector(lba,sector_buffer);
			else
#endif
				FileWriteSector(&diskimg[idx].type.file,sector_buffer);
		}

		// Read from file/SD Card
		if(c == 0x01)
		{
			putchar('r');
//				FileSeek(&diskimg[idx].type.file,lba<<9);
#ifdef CONFIG_DISKIMG_SDCARD
			if(diskimg[idx].type.direct.marker==DISKIMG_SDCARD_MARKER)
				sd_read_sector(lba,sector_buffer);
			else
#endif
				// FIXME - DirectIO?
				FileReadSector(&diskimg[idx].type.file,sector_buffer);
			spi_uio_cmd8(UIO_SD_ACK,idx);
			spi_uio_cmd_cont(UIO_SECTOR_RD);
			spi_write(sector_buffer,512);
			DisableIO();
		}
	}
}


#define spi32le(x) SPI(x&255); SPI((x>>8)&255); SPI((x>>16)&255); SPI(x>>24); 

int diskimg_mount(const unsigned char *name, unsigned char idx) {
	unsigned int imgsize=0;
	unsigned int imgsizeupper=0;
	int i;
	if(idx>CONFIG_DISKIMG_UNITS)
		return(0);
		
#ifdef CONFIG_DISKIMG_SDCARD
	if(strcmp(name,DISKIMG_SDCARD_NAME)==0)
	{
		diskimg[idx].type.direct.marker=DISKIMG_SDCARD_MARKER;
		imgsizeupper=sd_size>>23;
		imgsize=sd_size<<9;
	}
	else
#endif		
	{
		configstring_setindex(name);
		FileOpen(&diskimg[idx].type.file,name);
		imgsize=diskimg[idx].type.file.size;	/* Will be zero if file opening failed */
	}
	// send mounted image size first then notify about mounting
	EnableIO();
	SPI(UIO_SET_SDINFO);
	// use LE version, so following BYTE(s) may be used for size extension in the future.
	spi32le(imgsize);
	spi32le(imgsizeupper); // Upper 32 bits
	spi32le(0); // reserved for future expansion
	spi32le(0); // reserved for future expansion
	DisableIO();

	// notify core of possible sd image change
	spi_uio_cmd8(UIO_SET_SDSTAT, idx);
	return(imgsize);
}

