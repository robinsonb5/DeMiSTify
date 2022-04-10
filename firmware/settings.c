#include "config.h"
#include "settings.h"
#include "minfat.h"
#include "statusword.h"
#include "menu.h"

/* If settings files are supported, we provide a default implementation of loading and saving configs,
   which can be replaced in overrides.c */

extern fileTYPE file;

#ifdef CONFIG_SETTINGS

__weak int configtocore(char *buf)
{
	unsigned int *b=(unsigned int *)buf;
	statusword=*b++;
	scandouble=*b++;
	SetScandouble(scandouble);
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
	if(filename && FileOpen(&file,filename))
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
	if(filename && FileOpen(&file,filename))
	{
		coretoconfig(sector_buffer);	
		if(FileWriteSector(&file,sector_buffer))
			return(1);
	}
	return(0);
}

#endif

