#include "config.h"
#include "settings.h"
#include "minfat.h"
#include "statusword.h"
#include "menu.h"
#include "user_io.h"
#include "romimg.h"
#include "spi.h"

#include <string.h>

/* If settings files are supported, we provide a default implementation of loading and saving configs,
   which can be replaced in overrides.c */

extern fileTYPE file; /* Import from main.c */

int scandouble=0;
__weak void ToggleScandoubler()
{
	scandouble^=1;
	SPI(0xff);
	EnableIO();
	SPI(UIO_BUT_SW); // Set "DIP switch" for scandoubler
	SPI(scandouble<<4);
	DisableIO();
}

void AutoScandoubler()
{
	if(FileOpen(&file,AUTOSCANDOUBLER_FILENAME))
		ToggleScandoubler();
}

#ifdef CONFIG_SETTINGS

__weak int configtocore(char *buf)
{
	unsigned int *b=(unsigned int *)buf;
	statusword=*b++;
	scandouble=1^(*b++); // Invert retrieved scandoubler setting since we invert it again when setting it. 
	ToggleScandoubler();
	sendstatus();
	return(1);
}

__weak void coretoconfig(char *buf)
{
	unsigned int *b=(unsigned int *)buf;
	*b++=statusword;
	*b++=scandouble;
}

__weak int loadsettings(const char *filename)
{
	if(FileOpen(&file,filename)) /* FileOpen will reject null filenames, so no need to test for that separately */
	{
		if(FileReadSector(&file,sector_buffer))
		{
			return(configtocore(sector_buffer));	
		}
	}
	return(0);
}

__weak int savesettings(const char *filename)
{
	if(FileOpen(&file,filename))
	{
		coretoconfig(sector_buffer);
		if(FileWriteSector(&file,sector_buffer))
			return(1);
	}
	return(0);
}

__weak int settings_loadblob(struct settings_blob *part,int unit)
{
	int result=0;
	uint32_t currentdir=CurrentDirectory();
	if(ValidateDirectory(part->dir))
		ChangeDirectoryByCluster(part->dir);

	result=loadimage(part->filename,unit);
	ChangeDirectoryByCluster(currentdir);
	return(result);	
}

__weak void settings_storeblob(struct settings_blob *blob,const char *filename)
{
	strncpy(blob->filename,filename,11);
	blob->filename[11]=0;
	blob->dir=CurrentDirectory();
}

#endif

