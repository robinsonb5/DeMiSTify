#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "config.h"

#include "configstring.h"
#include "keyboard.h"
#include "uart.h"
#include "spi.h"
#include "minfat.h"
#include "interrupts.h"
#include "ps2.h"
#include "user_io.h"
#include "osd.h"
#include "menu.h"
#include "font.h"
#include "cue_parser.h"
#include "pcecd.h"
#include "timer.h"
#include "diskimg.h"
#include "spi_sd.h"
#include "user_io.h"
#include "settings.h"

#undef DEBUG


char *configstring="Atari ST;;"
	"F3,BIN,ROM image;"
	"F,BIN,Another ROM image;"
	"S0U,ST ,Floppy A:;"
	"S,ST ,Floppy B:;"
	"S3,ST ,Floppy C:;"
	"F,BIN,Yet Another ROM image;"
	"T0,Reset (Hold for hard reset);"
static char *cfgptr;

int configstring_next()
{
	char result=0;
	if(cfgptr)
		result=*cfgptr++;
	if(!result)
		cfgptr=0;
	return(result);
}

void configstring_begin()
{
	cfgptr=configstring;
}


extern struct menu_entry menu[];
void parseconf(int selpage,struct menu_entry *menu,unsigned int first,unsigned int limit);

__weak int main(int argc,char **argv)
{
	int i;
	parseconf(0,menu,0,7);
	for(i=0;i<7;++i)
	{
		printf("%s, %d, (%d), %d\n",menu[i].label,menu[i].u.file.index,menu[i].u.file.cfgidx,menu[i].u.file.unit);
	}
	return(0);	
}

