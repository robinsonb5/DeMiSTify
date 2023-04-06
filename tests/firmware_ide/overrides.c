#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "config.h"

#include "statusword.h"
#include "minfat.h"
#include "diskimg.h"
#include "user_io.h"
#include "settings.h"
#include "ide.h"

int LoadROM(const char *fn);
extern unsigned char romtype;
extern fileTYPE file;

int loadimage(const char *filename,int unit)
{
	int result=0;
	int u=unit-'0';

	switch(unit)
	{
		/* ROM images */
		case 0: /* RISCOS ROM */
		case 3: /* CMOS RAM */
			if(filename && filename[0])
			{
				statusword|=2;
				sendstatus();
				result=LoadROM(filename);
			}
			break;
		/* Floppy images */
		case '0':
		case '1':
			diskimg_mount(0,u);
			diskimg_mount(filename,u);
			result=diskimg[u].file.size;
			break;
		/* Hard disk images */
		case '2':
		case '3':
			OpenHardfile(filename,u-2);
			break;
		/* Configuration files */
		case 'R': /* Load CMOS RAM */
			romtype=3;
			result=loadimage(filename,3);
			break;
		case 'S': /* Save config */
			romtype=3;
			if(FileOpen(&file,filename))
			{
/*				saveram(filename); */
				FileWriteSector(&file,(char *)&sector_buffer);
			}
			break;
	}
	statusword&=~2;
	sendstatus();
	return(result);
}

