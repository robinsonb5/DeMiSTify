#include "diskimg.h"

#include <string.h>
#include <stdio.h>
#include "user_io.h"
#include "spi.h"
#include "minfat.h"


struct diskimage
{
	fileTYPE file;
	int valid;
};

struct diskimage diskimg[4];


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

}


void diskimg_poll()
{
	int lba;
	unsigned int idx;
	int c;
	c=user_io_sd_get_status(&lba,&idx);
//	printf("diskimg: cmd: %d, lba: %d, idx: %d\n",c,lba,idx);

	if(idx>3)
		return;

	// valid sd commands start with "5x" (old API), or "6x" (new API)
	// to avoid problems with cores that don't implement this command
	if((c & 0xf0) == 0x50 || (c & 0xf0) == 0x60) {

		// check if core requests configuration
		if(c & 0x08) {
//			printf("core requests SD config\n");
			user_io_sd_set_config();
		}


		// Write to file/SD Card
		if((c & 0x03) == 0x02) {
			FileSeek(&diskimg[idx].file,lba<<9);
			spi_uio_cmd_cont(UIO_SECTOR_WR);
			spi_read(sector_buffer,512);
			DisableIO();
			FileWriteSector(&diskimg[idx].file,sector_buffer);
		}

		// Read from file/SD Card
		if((c & 0x03) == 0x01)
		{
			FileSeek(&diskimg[idx].file,lba<<9);

			// FIXME - DirectIO?
			FileReadSector(&diskimg[idx].file,sector_buffer);
			spi_uio_cmd_cont(UIO_SECTOR_RD);
			spi_write(sector_buffer,512);
			DisableIO();
		}
	}
}


void diskimg_unmount(unsigned char idx)
{
	if(idx<4)
		diskimg[idx].valid=0;
}

#define spi32le(x) SPI(x&255); SPI((x>>8)&255); SPI((x>>16)&255); SPI(x>>24); 

void diskimg_mount(const unsigned char *name, unsigned char idx) {
	int imgsize=0;

	if(idx>3)
		return;
	if (name)
	{
		if(FileOpen(&diskimg[idx].file,name))
		{
			diskimg[idx].valid=1;
			imgsize=diskimg[idx].file.size;
		}
	} else {
		diskimg_unmount(idx);
	}

	// send mounted image size first then notify about mounting
	EnableIO();
	SPI(UIO_SET_SDINFO);
	// use LE version, so following BYTE(s) may be used for size extension in the future.
	spi32le(imgsize);
	spi32le(0); // Upper 32 bits
	spi32le(0); // reserved for future expansion
	spi32le(0); // reserved for future expansion
	DisableIO();

	// notify core of possible sd image change
	spi_uio_cmd8(UIO_SET_SDSTAT, idx);
}

