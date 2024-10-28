/*
-- Minimalist MiST-compatibile controller firmware
-- Copyright (c) 2021 by Alastair M. Robinson

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/


#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "config.h"

#include "configstring.h"
#include "uart.h"
#include "spi.h"
#include "minfat.h"
#include "interrupts.h"
#include "ps2.h"
#include "mouse.h"
#include "user_io.h"
#include "osd.h"
#include "menu.h"
#include "font.h"
#include "cue_parser.h"
#include "pcecd.h"
#include "spi_sd.h"
#include "ide.h"
#include "diskimg.h"
#include "romimg.h"
#include "statusword.h"
#include "settings.h"
#include "arcfile.h"

#define Breadcrumb(x) HW_UART(REG_UART)=x;

#define LINELENGTH 32

static char unit;
int menupage;

#ifdef CONFIG_SETTINGS
char std_label_exit[]="             Exit            \x81";
char std_label_back[]="\x80            Back";
#else
char std_label_exit[]="\x80 Exit";
char std_label_back[]="\x80 Back";
#endif

int menuindex;
int moremenu;
int romindex; /* First file to be displayed */
int listroms();
void selectrom(int row);
// static void scrollroms(int row);
static void scrollmenu(int row);
void buildmenu(int set);
static void submenu(int row);
void parseconf(int selpage,struct menu_entry *menu,unsigned int first,unsigned int limit);

static char romfilenames[7][30];

struct menu_entry menu[]=
{
	{MENU_ACTION(&submenu),romfilenames[0],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[1],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[2],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[3],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[4],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[5],0,0,0},
	{MENU_ACTION(&submenu),romfilenames[6],0,0,0},
	{MENU_ACTION(&submenu),0,0,0,0},
	{MENU_ACTION(scrollmenu),0,0,0,0}
};


DIRENTRY *nthfile(unsigned int n)
{
	unsigned int i,j=0;
	DIRENTRY *p;
	for(i=0;j<=n;++i)
	{
		p=NextDirEntry(i==0,configstring_matchextension);
		++j;
		if(!p)
			j=n;
	}
	return(p);
}

extern char cd_buffer[2352];

void spi32le(int x)
{
	SPI(x&255);
	SPI((x>>8)&255);
	SPI((x>>16)&255);
	SPI((x>>24)&255);
} 

#ifdef CONFIG_CD
int setcuefile(const char *filename)
{
	int cue_valid=0;
	if(!cue_open(filename))
	{
		int i=1;
		do {
			if(cue_parse(i)==0)
				cue_valid=1;
		} while(++i<=toc.last);
	}
	// send mounted image size first then notify about mounting
	EnableIO();
	SPI(UIO_SET_SDINFO);
	// use LE version, so following BYTE(s) may be used for size extension in the future.
	spi32le(cue_valid ? toc.file.size : 0);
	spi32le(cue_valid ? toc.file.size : 0);
	spi32le(0); // reserved for future expansion
	spi32le(0); // reserved for future expansion
	// notify core of possible sd image change
	DisableIO();
	spi_uio_cmd8(UIO_SET_SDSTAT, 1);
	return(cue_valid);
}
#endif


#ifdef CONFIG_WITHOUT_FILESYSTEM

/* Stub functions to allow building without filesystem (for cores with embedded ROM.) */
static void fileselector(int row){}
void selectrom(int row) {}
int listroms() { return 0; }
static void scrollroms(int row) {}

#else

char filename[12];
void selectrom(int row)
{
	if(!romfilenames[row][0])	// Did the user select an empty row?
		return;
	DIRENTRY *p=nthfile(menuindex+row);
//	printf("File %s\n",p->Name);
	if(p)
	{
		strncpy(filename,p->Name,11);	// Store a temporary copy of the filename, since loading it by name
										// will overwrite the sector buffer which currently contains it!
		menu[row].label="Loading...";
		Menu_Draw(row);
		menu[row].label=romfilenames[row];
		loadimage(filename,unit);
	}
	Menu_Draw(row);
	Menu_ShowHide(0);
	menupage=0;
	buildmenu(1);
}


void selectsdcard(int row)
{
	loadimage(DISKIMG_SDCARD_NAME,unit);
	Menu_ShowHide(0);
	menupage=0;
	buildmenu(1);
}


void selectdir(int row)
{
	DIRENTRY *p=nthfile(menuindex+row);
	if(p)
		ChangeDirectory(p);
	menuindex=0;
	buildmenu(1);
}


int listroms()
{
	DIRENTRY *p=(DIRENTRY *)sector_buffer; // Just so it's not NULL
	unsigned int i,j;
	j=0;
	for(i=0;(j<menuindex) && p;++i)
	{
		p=NextDirEntry(i==0,configstring_matchextension);
		++j;
	}

	for(j=0;(j<7) && p;++i)
	{
		p=NextDirEntry(i==0,configstring_matchextension);
		if(p)
		{
			// FIXME declare a global long file name buffer.
			if(p->Attributes&ATTR_DIRECTORY)
			{
				menu[j].action=MENU_ACTION(&selectdir);
				menu[j].u.file.index=-1;
				romfilenames[j][0]=FONT_ARROW_RIGHT; // Right arrow
				romfilenames[j][1]=' ';
				if(longfilename[0])
					strncpy(romfilenames[j++]+2,longfilename,27);
				else
				{
					romfilenames[j][13]=0;
					strncpy(romfilenames[j++]+2,p->Name,11);
				}
			}
			else
			{
				menu[j].action=MENU_ACTION(&selectrom);
				if(longfilename[0])
					strncpy(romfilenames[j++],longfilename,29);
				else
				{
					romfilenames[j][11]=0;
					strncpy(romfilenames[j++],p->Name,11);
				}
			}
		}
#ifdef CONFIG_DISKIMG_SDCARD
		else if (unit >= '0' && unit < ('0'+CONFIG_DISKIMG_UNITS))
		{
			menu[j].action=MENU_ACTION(&selectsdcard);
			strcpy(romfilenames[j++],DISKIMG_SDCARD_NAME);		
		}
#endif
	}
	return(j);
}

static void fileselector(int row)
{
	romtype=menu[row].u.file.index;
	configstring_index=menu[row].u.file.cfgidx;
	unit=menu[row].u.file.unit;
	loadimage(NULL,unit); /* Dismount existing disk when entering the menu */
	menupage=MENUPAGE_FILE;
	buildmenu(1);
}

#endif

static void submenu(int row)
{
	menupage=menu[row].u.menu.page;
	menuindex=0;
//	putchar(row+'0');
	buildmenu(1);
}

static void MenuHide(int row)
{
	Menu_ShowHide(0);
}


static void menufoot(int sub)
{
	if(sub)
	{
		menu[7].u.menu.page=MENUPAGE_ROOT;
		menu[7].action=MENU_ACTION(&submenu);
		menu[7].label=std_label_back;
	}
	else
	{
		menu[7].label=std_label_exit;
		menu[7].action=MENU_ACTION(&MenuHide);
	}
}


void cycle(int row)
{
	int v;
	struct menu_entry *m=&menu[row];
	statusword_cycle(m->u.opt.shift,m->u.opt.val,m->u.opt.limit);
	buildmenu(0);
	Menu_Draw(row);
}


__weak void toggle(int row)
{
	cycle(row);
	cycle(row);
#ifdef CONFIG_AUTOCLOSE_OSD
	Menu_ShowHide(0);
#endif
}


static void scrollmenu(int row)
{
	switch(row)
	{
		case ROW_RIGHT:
#ifdef CONFIG_SETTINGS	/* If settings are disabled, fall through to ROW_LEFT: */
			menupage=MENUPAGE_SETTINGS;
			buildmenu(1);
			return;
			break;
#endif
		case ROW_LEFT:
			submenu(7);
			return;
			break;

		case ROW_LINEUP:
			if(menuindex)
				--menuindex;
			break;
		case ROW_LINEDOWN:
			if(moremenu)
				++menuindex;
			break;
		case ROW_PAGEUP:
			menuindex-=6;
			if(menuindex<0)
				menuindex=0;
			break;
		case ROW_PAGEDOWN:
			if(moremenu)
				menuindex+=6;
			break;
	}
	buildmenu(0);
	Menu_Draw(row);
}


void dipswitches(int row)
{
	menupage=MENUPAGE_DIPSWITCHES;
	buildmenu(0);
	Menu_Draw(row);
}


static char menufiletitle[]="Load *.";
static void menufileline(unsigned int line, const char *title,int idx, int configidx, int unit)
{
	strcpy(menu[line].label,title);
	menu[line].action=MENU_ACTION(&fileselector);
	menu[line].u.file.index=idx;
	menu[line].u.file.cfgidx=configidx;
	menu[line].u.file.unit=unit;
}


void parseconf(int selpage,struct menu_entry *menu,unsigned int first,unsigned int limit)
{
	int c;
	unsigned int maxpage=0;
	unsigned int line=0;
	char *title;
	unsigned int skip=first;
	unsigned int fileindex=1;
	unsigned int configidx=1;
	moremenu=1;

	if(menupage==MENUPAGE_FILE)
	{
#ifndef CONFIG_WITHOUT_FILESELECTOR
		line=listroms();
#endif
	}
#ifdef CONFIG_SETTINGS
	else if(menupage==MENUPAGE_SETTINGS)
	{
		strcpy(menu[line].label,"Load Settings \x81");
		menu[line].action=MENU_ACTION(&fileselector);
		menu[line].u.file.cfgidx=CONFIGSTRING_INDEX_CFG;
		menu[line].u.file.unit='S';
		++line;
		strcpy(menu[line].label,"Save Settings \x81");
		menu[line].action=MENU_ACTION(&fileselector);
		menu[line].u.file.cfgidx=CONFIGSTRING_INDEX_CFG;
		menu[line].u.file.unit='T';
		++line;
	}
#endif
	else
	{
		configstring_begin();

		configstring_nextfield(); /* Skip over core name */
		c=configstring_next();
#ifdef CONFIG_ARCFILE_SELECTOR
		if(1)
#else
		if(c!=';')
#endif
		{
#ifndef CONFIG_WITHOUT_FILESELECTOR
			if(!selpage) /* Add the load item only for the first menu page */
			{
				menufileline(line,menufiletitle,fileindex,0,0);
#ifdef CONFIG_ARCFILE
				if(c!=';')
				{
#endif
					menu[line].label[7]=c;
					configstring_copytocomma(&menu[line].label[8],LINELENGTH-8,1);
#ifdef CONFIG_ARCFILE
				}
#endif
				if(line>=skip)
					++line;
				else
					--skip;
			}
			else
#endif
				configstring_nextfield();
			++fileindex; /* Need to bump the file index whichever page we're on. */
		}
		while(c && line<limit)
		{
			unsigned int parent;
			unsigned int page=0;
			c=configstring_next();

#ifdef CONFIG_ARCFILE
			if(selpage==MENUPAGE_DIPSWITCHES)
				page=selpage;
				
			/* Simplified page handling for Arcade cores */
			while(c=='P')
			{
				c=configstring_next(); /* Skip over the digit */
				c=configstring_next();
				if(c==',')	/* New page - skip over it to flatten options into the toplevel and DIP switch menus */
				{
					c=configstring_nextfield();
				}
				if(c=='P')
					++configidx; /* Keep track of which line from the config string we're reading - for pattern matching. */
			}
#else
			/* Page handling - P either declares a new page, or prefixes an option within a page */
			while(c=='P')
			{
				parent=page;
				page=configstring_getdigit();

				c=configstring_next();
				if(c==',')	/* New page, create a menu item */
				{
					title=menu[line].label;
					menu[line].u.menu.page=page;
					menu[line].action=MENU_ACTION(&submenu);
					c=configstring_next();
					while(c && c!=';')
					{
						*title++=c;
						c=configstring_next();
					}
					*title++=' ';
					*title++=FONT_ARROW_RIGHT;
					*title++=0;
					/* Are we in the menu root? */
					if(selpage==parent)
					{
						if(line>=skip)
							++line;
						else
							--skip;
					}
					c=configstring_next();
				}
				if(c=='P')
					++configidx; /* Keep track of which line from the config string we're reading - for pattern matching. */
			}
#endif

			if(page==selpage)
			{
				int diskunit='0';
				int idx=fileindex;
				int low,high;
				unsigned int opt=0;
				unsigned int val;
				int nextline=0;

				switch(c)
				{
					case ';':
						break;
#ifdef CONFIG_ARCFILE
					case 'D': /* DIP Switches */
						strcpy(menu[line].label,"DIP Switches");
						menu[line].action=MENU_ACTION(&dipswitches);
						c=configstring_nextfield();
						nextline=1;
						break;
#endif
#ifndef CONFIG_WITHOUT_FILESELECTOR
					/* Disk and ROM image selection.  Both 'F' and 'S' entries take a single digit paramter.
					   for 'F' entries, the parameter is the upload index, and diskunit must be set to 0.
					   For 'S' entries, the parameter is copied to diskunit, and remains in ASCII form. */
					case 'F':
						/* diskunit will default to 0 rather than '0' for 'F' entries. */						
						diskunit=0;
					case 'S':
						++fileindex; /* FIXME - Should this increment for all items, not just F and S items? */
						c=configstring_next();
						if(c!=',')
						{
							/* Unit no will be ASCII '0', '1', etc - or 'C' for CD images */
							if(diskunit)
								diskunit=c; /* Disk unit number remains in ASCII form, with 0 used to indicate ROM images rather than disk images */
							else
								idx=c-'0'; /* Upload index is converted from ASCII to integer */
						}
						while(c!=',')
							c=configstring_next();

						/* If an index slot was specified it will be in diskunit - otherwise diskunit will be '0' for 'S' entries, and 0 for 'F' entries */
						menufileline(line,menufiletitle,idx,configidx,diskunit);
						low=configstring_copytocomma(menu[line].label,10,0); /* Step over the filetypes */
						if(low>0)
						{
							low=-configstring_copytocomma(menu[line].label,LINELENGTH-2,1);
							if(low>0 && low<(LINELENGTH-3))
							{
								menu[line].label[low]=' ';
								menu[line].label[low+1]=FONT_ARROW_RIGHT;
								menu[line].label[low+2]=0;
							}
						}
						nextline=1;
						break;
#endif
					case 'O':
					case 'T':
						/* Parse option */
						low=configstring_getdigit();
						high=configstring_getdigit();

						if(high==',')
							high=low;
						else
							configstring_next();

						menu[line].u.opt.shift=low;
						menu[line].u.opt.val=(1<<(1+high-low))-1;
						#ifdef CONFIG_STATUSWORD_64BIT
						val=statusword_get(low,menu[line].u.opt.val);
						#else
						val=(statusword>>low)&menu[line].u.opt.val;
						#endif
						title=menu[line].label;
						if((c=configstring_copytocomma(title,LINELENGTH,selpage==page))>0)
						{
							title+=c;
							strncpy(title,": ",LINELENGTH-c);
							title+=2;
							do
							{
								++opt;
							} while(configstring_copytocomma(title,LINELENGTH-(c+2),opt==(val+1))>0);
						}

						if(opt)
						{
							menu[line].u.opt.limit=opt;
							menu[line].action=MENU_ACTION(&cycle);
						}
						else
						{
							menu[line].u.opt.limit=2;
							menu[line].action=MENU_ACTION(&toggle);
						}
						nextline=1;
						break;
					default:
						c=configstring_nextfield();
						break;
				}
				if(nextline)
				{
					if(line>=skip)
						++line;
					else
						--skip;
				}				
			}
			else
			{
				if(c=='F')
					++fileindex;
				c=configstring_nextfield();
			}
			++configidx; /* Keep track of which line from the config string we're reading - for pattern matching. */
		}
		configstring_end();
	}
	for(;line<7;++line)
	{
		moremenu=0;
		*menu[line].label=0;
		menu[line].action=0;
	}
}

void buildmenu(int set)
{
	if(set)
		menuindex=0;
	parseconf(menupage,menu,menuindex,7);
	menufoot(menupage);
	if(set)
		Menu_Set(menu);
}

/* Allow the Boot ROM filename to set in config.h instead of requiring an override.
   The override method will still work, however. */
#ifndef ROM_FILENAME
#define ROM_FILENAME "BOOT    ROM"
#endif
__weak const char *bootrom_name=ROM_FILENAME;


#ifdef CONFIG_WITHOUT_FILESYSTEM
__weak char *autoboot()
{
	return(0);
}
#else
__weak char *autoboot()
{
	char *result=0;
#ifdef CONFIG_SETTINGS
	loadsettings(CONFIG_SETTINGS_FILENAME);
#endif
	romtype=0;
#ifdef ROM_REQUIRED
	if(!LoadROM(bootrom_name))
		result="ROM loading failed";
#else
	LoadROM(bootrom_name);
#endif
	return(result);
}
#endif


__weak char *get_rtc()
{
	/* Upload current time via RTC. Use the sector buffer as temp storage. */
	register volatile int *spiptr=&HW_SPI(HW_SPI_DATA);
	char *ptr=sector_buffer;
	if(HAVE_RTC)
	{
		int t;
		EnableRTC();
		*spiptr=0x92;	/* Read, Subaddress 001, start reading at register 0000 */
		*spiptr=0xff; *ptr++=*spiptr; /* Seconds */
		*spiptr=0xff; *ptr++=*spiptr; /* Minutes */
		*spiptr=0xff; *ptr++=*spiptr; /* Hours */
		*spiptr=0xff; *ptr++=*spiptr; /* Day */
		*spiptr=0xff; t=*spiptr; /* Weekday */
		*spiptr=0xff; *ptr++=*spiptr; /* Month */
		*spiptr=0xff; *ptr++=*spiptr; /* Year */
		*ptr++=t;
		DisableRTC();
	}
	else
	{
		*ptr++=0;
		*ptr++=0;
		*ptr++=0;
		*ptr++=0x19;
		*ptr++=0x01;
		*ptr++=0x22;
		*ptr++=0x03;
	}
	*ptr++=0;
	return(sector_buffer);
}


__weak void init()
{
	int havesd;
	int i,c;

	PS2Init();

	buildmenu(1);

#ifdef CONFIG_WITHOUT_FILESYSTEM
	havesd=0;
#else
	if(!(havesd=sd_init() && FindDrive()))
	{
		Menu_Message("SD failed.",0);
		
		while(1) {}
	}
#ifdef CONFIG_AUTOSCANDOUBLER
	AutoScandoubler();
#endif

	Menu_Message("Booting...",0);
	Menu_Message(autoboot(),0);
#endif

	EnableInterrupts();
}


__weak void mainloop()
{
#ifdef CONFIG_RTC
	int framecounter;
#endif
	while(1)
	{
#ifdef PS2_MOUSE
		HandlePS2Mouse(0);
#endif

#ifdef CONFIG_CD
		pcecd_poll();
#endif
		Menu_Run();

#ifdef CONFIG_IDE
		HandleHDD();
#endif

#ifdef CONFIG_CD
		pcecd_poll();
#endif

#ifdef CONFIG_DISKIMG
		diskimg_poll();
#endif

#ifdef CONFIG_RTC
		if((framecounter++&8191)==0)
			user_io_send_rtc(get_rtc());
#endif
	}
}

__weak int main(int argc,char **argv)
{
	menuindex=0;
	menupage=0;
	init();
	mainloop();
	return(0);
}

