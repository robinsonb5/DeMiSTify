#include "minfat.h"
#include "romimg.h"
#include "diskimg.h"
#include "ide.h"
#include "settings.h"
#include "spi.h"
#include "user_io.h"
#include "arcfile.h"
#include "configstring.h"

unsigned char romtype=0;
fileTYPE file;

#define SPIFPGA(a,b) EnableFpga(); *spiptr=(a); *spiptr=(b); DisableFpga();
int LoadROM(const char *fn)
{
	register volatile int *spiptr=&HW_SPI(HW_SPI_DATA);
	char *direntry;
	int i;
	if((direntry = (char *)FileOpen(&file,fn)))
	{
		int sendsize;
		int idx;
		int imgsize=file.size;

		idx=configstring_setindex(fn);

#ifdef CONFIG_ARCFILE
		/* Load Arc file, then load the associated ROM */
		if(idx==CONFIGSTRING_INDEX_ARC)
		{
			int default_dip;
			if((default_dip=arcfile_open(fn)))
			{
				spi_uio_cmd8(UIO_SET_MOD, arcstate.mod);
				romtype=0; /* ROMs loaded alongside .arc files must have index 0 */
				LoadROM(arcstate.name);
			}
			return(1);
		}
#endif

		EnableFpga();
		*spiptr=SPI_FPGA_FILE_INFO;
		for(i=0;i<32;++i)
			*spiptr=*direntry++;
		DisableFpga();

		SPIFPGA(SPI_FPGA_FILE_TX,1);

		while(imgsize)
		{
			char *buf=sector_buffer;
			int result;

			sendsize=512;
			imgsize-=512;
			if(imgsize<0)
			{
				sendsize=imgsize+512;
				imgsize=0;
			}

			if(configstring_direct_upload())
				result=FileReadSector(&file,0);
			else
			{
				result=FileReadSector(&file,sector_buffer);
				EnableFpga();
				*spiptr=SPI_FPGA_FILE_TX_DAT;
				do
				{
					*spiptr=*buf++;
				} while(--sendsize);
				DisableFpga();
			}
			if(!result)
				return(0);

			FileNextSector(&file,1);
		}

		SPIFPGA(SPI_FPGA_FILE_TX,0);

		return(1);
	}
	else
		return(0);
}

void IDE_and_DISKIMG_you_must_override_loadimg();

__weak int loadimage(char *filename,int unit)
{
	#ifdef CONFIG_IDE
	#ifdef CONFIG_DISKIMG
	IDE_and_DISKIMG_you_must_override_loadimg();
	#endif
	#endif
	switch(unit)
	{
		case 0:
			return(LoadROM(filename));
			break;
#ifdef CONFIG_IDE
		case '0':
		case '1':
		case '2':
		case '3':
			OpenHardfile(filename,unit-'0');
			break;
#endif
#ifdef CONFIG_DISKIMG
#ifndef CONFIG_IDE
		case '0':
		case '1':
		case '2':
		case '3':
			diskimg_mount(0,unit-'0');				
			return(diskimg_mount(filename,unit-'0'));				
			break;
#endif		
#endif
#ifdef CONFIG_CD
		case 'C':
//				printf("Opening %s\n",filename ? filename : "(null)");
			return(setcuefile(filename));
			break;
#endif
#ifdef CONFIG_SETTINGS
		case 'S':
			return(loadsettings(filename));
			break;
		case 'T':
			return(savesettings(filename));
			break;
#endif
	}
}

