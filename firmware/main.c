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

#include "uart.h"
#include "spi.h"
#include "minfat.h"
#include "interrupts.h"
#include "keyboard.h"
#include "ps2.h"
#include "user_io.h"
#include "osd.h"
#include "menu.h"
#include "font.h"
#include "cue_parser.h"
#include "pcecd.h"

#define Breadcrumb(x) HW_UART(REG_UART)=x;

#define DIRECTUPLOAD 0x10

unsigned int statusword; /* Support 32-bit status word initially - need to be 64-bit in the long run */
#define LINELENGTH 32
unsigned char menupage;
unsigned char coretype;
unsigned char romtype=0;
unsigned char cfgidx=0;
unsigned char unit=0;

#define conf_next() SPI(0xff)

int conf_nextfield()
{
	int c;
	do
		c=conf_next();
	while(c && c!=';');
	return(c);
}

/* Copy a maximum of limit bytes to the output string, stopping when a comma is reached. */
/* If the copy flag is zero, don't copy, just consume bytes from the input */

int copytocomma(char *buf, int limit,int copy)
{
	int count=0;
	int c;
	c=conf_next();
	while(c && c!=',' && c!=';')
	{
		if(count<limit && copy)
			*buf++=c;
		if(c)
			++count;
		c=conf_next();
	}
	if(copy)
		*buf++=0;
	return(c==';' ? -count : count);
}


int getdigit()
{
	unsigned int c=conf_next();
//	printf("Getdigit %c\n",c);
	if(c>='0' && c<='9')
		c-='0';
	if(c>='A' && c<='Z')
		c-='A'-10;
	return(c);	
}


int matchextension(const char *ext)
{
	int done=0;
	unsigned int i=0;
	int c=1;
	int c1,c2,c3;

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	coretype=SPI(SPI_CONF_READ); // Read conf string command

/*  The first config entry has the corename, a semicolon, then optional match extensions.
    Subsequent configs have a type, a comma, then the extensions.
    We can find the correct entry by stepping over semicolons.  */

//	putchar('0'+cfgidx);

//	printf("Config index %d\n",cfgidx);

	for(i=0;i<=cfgidx;++i)
		conf_nextfield();

/*	Having found the correct entry, we need to step over the descriptor if there is one. */

	if(cfgidx) /* No descriptor for the first entry. */
	{
		do
		{
			c=conf_next();
//			putchar(c);
		} while(c && c!=',');
	}

	i=0;
//	putchar('\n');
	while(!done)
	{
		c1=conf_next();
		c2=conf_next();
		c3=conf_next();
//		printf("%d, %d, %d, %d, %d, %d\n",c1,c2,c3,ext[8],ext[9],ext[10]);
		++i;
		if(c1==ext[8] && c2==ext[9] && c3==ext[10])
			done=1;
		else if(c1==',' || c1==';')
		{
			i=0;
			done=1;
		}
	}
	SPI_DISABLE(HW_SPI_CONF);
//	printf("Second match result %d\n",i);
	return(i);
}


/* Upload data to FPGA */

fileTYPE file;

void VerifyROM()
{
	unsigned int imgsize=file.size;
	unsigned int sendsize;
	SPI_ENABLE(HW_SPI_FPGA)
	SPI(SPI_FPGA_FILE_TX);
	SPI(0x03);	/* Verify */
	SPI_DISABLE(HW_SPI_FPGA);

	SPI_ENABLE_FAST_INT(HW_SPI_SNIFF);
	while(imgsize)
	{
		if(imgsize>=512)
		{
			sendsize=512;
			imgsize-=512;
		}
		else
		{
			sendsize=imgsize;
			imgsize=0;
		}
		while(sendsize--)
		{
			SPI(0x00);
		}
		SPI(0x00); /* CRC bytes */
		SPI(0x00);
	}
	SPI_DISABLE(HW_SPI_SNIFF);

	SPI_ENABLE(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_TX);
	SPI(0x00);
	SPI_DISABLE(HW_SPI_FPGA);
}


__weak int rom_minsize=1;


static void sendsector(const char *buf,int sendsize)
{
	register volatile int *spiptr=&HW_SPI(HW_SPI_DATA);
	int s=sendsize;
	SPI_ENABLE_FAST_INT(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_TX_DAT);
	do
	{
		*spiptr=*buf++;
	} while(--s);
	SPI_DISABLE(HW_SPI_FPGA);
}

int LoadROM(const char *fn)
{
	if(FileOpen(&file,fn))
	{
		int minsize=rom_minsize;
		int sendsize;
		int extindex=matchextension(fn); /* Figure out which extension matches, and thus which index we need to use */
//		printf("Coretype %d, ROM filename %s, Romtype %d, cfgidx %d, extidx %d\n",coretype,fn,romtype,cfgidx,extindex);
		if(!extindex)
			extindex=1;
		SPI_ENABLE(HW_SPI_FPGA);
		SPI(SPI_FPGA_FILE_INDEX);
		SPI(romtype|((extindex-1)<<6)); /* Set ROM index */
		SPI_DISABLE(HW_SPI_FPGA);

		if(coretype&DIRECTUPLOAD)	/* Send a dummy file info */
		{
			unsigned int i;
			SPI_ENABLE(HW_SPI_FPGA);
			SPI(SPI_FPGA_FILE_INFO);
			for(i=0;i<32;++i)
				SPI(0xff);
			SPI_DISABLE(HW_SPI_FPGA);
		}
		SPI(0xFF);

		SPI_ENABLE(HW_SPI_FPGA);
		SPI(SPI_FPGA_FILE_TX);
		SPI(0x01); /* Upload */
		SPI_DISABLE(HW_SPI_FPGA);

		while(minsize>0)
		{
			int imgsize=file.size;
			minsize-=imgsize;
//			printf("Sending %d bytes\n",imgsize);
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

				if(coretype&DIRECTUPLOAD)
					result=FileReadSector(&file,0);
				else
				{
					result=FileReadSector(&file,sector_buffer);
					sendsector(buf,sendsize);
				}
				if(!result)
					return(0);

				FileNextSector(&file,1);
			}
			if(minsize>0)
				FileFirstSector(&file); // Start from the beginning again.
		}

		SPI_ENABLE(HW_SPI_FPGA);
		SPI(SPI_FPGA_FILE_TX);
		SPI(0x00);
		SPI_DISABLE(HW_SPI_FPGA);
		return(1);
	}
	else
		return(0);
}


void spin()
{
	unsigned int i,t;
	for(i=0;i<1024;++i)
		t=HW_SPI(HW_SPI_CS);
}

int menuindex;
int moremenu;
int romindex; /* First file to be displayed */
static void listroms();
void selectrom(int row);
static void scrollroms(int row);
void buildmenu(int offset);
static void submenu(int row);
int parseconf(int selpage,struct menu_entry *menu,unsigned int first,unsigned int limit);

static char romfilenames[7][30];

static struct menu_entry menu[]=
{
	{MENU_ACTION(&selectrom),romfilenames[0],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[1],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[2],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[3],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[4],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[5],0,0,0},
	{MENU_ACTION(&selectrom),romfilenames[6],0,0,0},
	{MENU_ACTION(&submenu),0,0,0,0},
	{MENU_ACTION(scrollroms),0,0,0,0}
};


static DIRENTRY *nthfile(unsigned int n)
{
	unsigned int i,j=0;
	DIRENTRY *p;
	for(i=0;j<=n;++i)
	{
		p=NextDirEntry(i==0,matchextension);
		++j;
		if(!p)
			j=n;
	}
	return(p);
}

extern char cd_buffer[2352];

static char string[18];

void hexdump(unsigned char *p,unsigned int l)
{
	int i=0;
	unsigned char *p2=p;
	char *sp;
	string[16]=0;
	sp=string;
	while(l--)
	{
		unsigned int t,t2;
		t=*p2++;
		t2=t>>4;
		t2+='0'; if(t2>'9') t2+='@'-'9';
		putchar(t2);
		t2=t&0xf;
		t2+='0'; if(t2>'9') t2+='@'-'9';
		putchar(t2);

		if(t<32 || (t>127 && t<160))
			*sp++='.';
		else
			*sp++=t;
		++i;
		if((i&3)==0)
			putchar(' ');
		if((i&15)==0)
		{
			puts(string);
			putchar('\n');
			sp=string;
		}
	}
	if(i&15)
	{
		*sp++=0;
		puts(string);
		putchar('\n');
	}
}

void spi32le(int x)
{
	SPI(x&255);
	SPI((x>>8)&255);
	SPI((x>>16)&255);
	SPI((x>>24)&255);
} 

#ifdef CONFIG_CD
void setcuefile(const char *filename)
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
}
#endif

char filename[12];
void selectrom(int row)
{
	if(!romfilenames[row][0])	// Did the user select an empty row?
		return;
	DIRENTRY *p=nthfile(romindex+row);
//	printf("File %s\n",p->Name);
	if(p)
	{
		strncpy(filename,p->Name,11); // Make use of the long filename buffer to store a temporary copy of the filename,
									// since loading it by name will overwrite the sector buffer which currently contains it!
		menu[row].label="Loading...";
		Menu_Draw(row);
		menu[row].label=romfilenames[row];
		switch(unit)
		{
			case 0:
				LoadROM(filename);
				break;
#ifdef CONFIG_CD
			case 'C':
//				printf("Opening %s\n",filename);
				setcuefile(filename);
				break;
#endif
		}
	}
	Menu_Draw(row);
	Menu_ShowHide(0);
	menupage=0;
	buildmenu(0);
}


static void selectdir(int row)
{
	DIRENTRY *p=nthfile(romindex+row);
	if(p)
		ChangeDirectory(p);
	romindex=0;
	listroms(row);
}


static void scrollroms(int row)
{
	switch(row)
	{
		case ROW_LINEUP:
			if(romindex)
				--romindex;
			break;
		case ROW_PAGEUP:
			romindex-=6;
			if(romindex<0)
				romindex=0;
			break;
		case ROW_LINEDOWN:
			if(moremenu)
				++romindex;
			break;
		case ROW_PAGEDOWN:
			if(moremenu)
				romindex+=6;
			break;
	}
	listroms(row);
}


static void listroms(int row)
{
	DIRENTRY *p=(DIRENTRY *)sector_buffer; // Just so it's not NULL
	unsigned int i,j;
	j=0;
	moremenu=1;
	for(i=0;(j<romindex) && p;++i)
	{
		p=NextDirEntry(i==0,matchextension);
		++j;
	}

	for(j=0;(j<7) && p;++i)
	{
		p=NextDirEntry(i==0,matchextension);
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
	}
	for(;j<7;++j)
	{
		moremenu=0;
		menu[j].action=MENU_ACTION(&selectrom);
		romfilenames[j][0]=0;
	}
	menu[7].u.menu.page=0;
	menu[7].action=MENU_ACTION(&submenu);
	menu[7].label="\x80 Back";
	menu[8].action=MENU_ACTION(&scrollroms);
	Menu_Draw(row);
}

static void fileselector(int row)
{
	romtype=menu[row].u.file.index;
	cfgidx=menu[row].u.file.cfgidx;
	unit=menu[row].u.file.unit;
#ifdef CONFIG_CD
	if(unit=='C')
		setcuefile(NULL);		
#endif
	listroms(row);
}


static void reset(int row)
{
	Menu_ShowHide(0);
	// FIXME reset here
}


static void SaveSettings(int row)
{
	Menu_ShowHide(0);
	// FIXME reset here
}

static void MenuHide(int row)
{
	Menu_ShowHide(0);
}

static void showrommenu(int row)
{
	romindex=0;
	listroms(row);
	Menu_Set(menu);
}


static void submenu(int row)
{
	menupage=menu[row].u.menu.page;
	putchar(row+'0');
	buildmenu(0);
}


static void cycle(int row)
{
	int v;
	struct menu_entry *m=&menu[row];
	v=(statusword>>m->u.opt.shift);	// Extract value from existing statusword
	v&=m->u.opt.val;					// and mask...
	++v;
	if(v>=m->u.opt.limit)
		v=0;
	statusword&=~(m->u.opt.val<<m->u.opt.shift); // Mask off old bits from status word
	statusword|=v<<m->u.opt.shift;		// and insert new value

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(UIO_SET_STATUS2); // Read conf string command
	SPI(statusword);
	SPI(statusword>>8);
	SPI(statusword>>16);
	SPI(statusword>>24);
	SPI_DISABLE(HW_SPI_CONF);

	parseconf(menupage,menu,menuindex,7);
	Menu_Draw(row);
}


static void toggle(int row)
{
	cycle(row);
	cycle(row);
}


static void scrollmenu(int row)
{
	switch(row)
	{
		case ROW_LINEUP:
			if(menuindex)
				--menuindex;
			break;
		case ROW_LINEDOWN:
			if(moremenu)
				++menuindex;
			break;
	}
	parseconf(menupage,menu,menuindex,7);
	Menu_Draw(row);
}


int parseconf(int selpage,struct menu_entry *menu,unsigned int first,unsigned int limit)
{
	int c;
	unsigned int page=0;
	unsigned int maxpage=0;
	unsigned int line=0;
	char *title;
	unsigned int skip=first;
	unsigned int fileindex=1;
	unsigned int configidx=1;
	moremenu=1;

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(SPI_CONF_READ); /* Read conf string command */

	conf_nextfield(); /* Skip over core name */
	c=conf_next();
	if(c!=';')
	{
		if(!selpage) /* Add the load item only for the first menu page */
		{
			strcpy(menu[line].label,"Load *. ");
			menu[line].action=MENU_ACTION(&fileselector);
			menu[line].label[7]=c;
			menu[line].u.file.index=fileindex;
			++fileindex;
			menu[line].u.file.cfgidx=0;
			menu[line].u.file.unit=0;
			copytocomma(&menu[line].label[8],LINELENGTH-8,1);
			if(line>=skip)
				++line;
			else
				--skip;
		}
		else
			conf_nextfield();
	}
	while(c && line<limit)
	{
		int diskunit=0;
		c=conf_next();
		switch(c)
		{
			case 'S': // Disk image select
				diskunit=conf_next(); /* Unit no will be ASCII '0', '1', etc - or 'C' for CD images */
				while(c!=',')
					c=conf_next();
				// Fall through...
			case 'F':
				if(!selpage)
				{
					if(c!=',')
						conf_next();
					copytocomma(menu[line].label,10,0);
					copytocomma(menu[line].label,LINELENGTH-2,1);
					menu[line].action=MENU_ACTION(&fileselector);
					menu[line].u.file.index=fileindex;
					menu[line].u.file.cfgidx=configidx;
					menu[line].u.file.unit=diskunit;
					++fileindex;
					if(line>=skip)
						++line;
					else
						--skip;
				}
				else
					c=conf_nextfield();
				break;
			case 'P':
				page=getdigit();

				if(page>maxpage)
					maxpage=page;
				c=getdigit();
				if(c==',')
				{
					/* Is this a submenu declaration? */
					if(selpage==0)
					{
						title=menu[line].label;
						menu[line].u.menu.page=page;
						menu[line].action=MENU_ACTION(&submenu);
						c=conf_next();
						while(c && c!=';')
						{
							*title++=c;
							c=conf_next();
						}
						*title++=' ';
						*title++=FONT_ARROW_RIGHT;
						*title++=0;
						if(line>=skip)
							++line;
						else
							--skip;
					}
					else
						c=conf_nextfield();
					break;
				}
				// Fall through to O
			case 'O':
			case 'T':
				if (page==selpage)
				{
					/* Must be a submenu entry */
					unsigned int low,high=0;
					unsigned int opt=0;
					unsigned int val;

					/* Parse option */
					low=getdigit();
					high=getdigit();

					if(high==',')
						high=low;
					else
						conf_next();

					menu[line].u.opt.shift=low;
					menu[line].u.opt.val=(1<<(1+high-low))-1;
					val=(statusword>>low)&menu[line].u.opt.val;
//					printf("Statusword %x, shifting by %d: %x\n",statusword,low,menu[line].u.opt.val);

					title=menu[line].label;
//					printf("selpage %d, page %d\n",selpage,page);
					if((c=copytocomma(title,LINELENGTH,selpage==page))>0)
					{
						title+=c;
						strncpy(title,": ",menu[line].label+LINELENGTH-title);
						title+=2;
						do
						{
							++opt;
						} while(copytocomma(title,menu[line].label+LINELENGTH-title,opt==(val+1))>0);
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

					if(line>=skip)
						++line;
					else
						--skip;
				}
				else
					c=conf_nextfield();
				page=0;
				break;
			default:
				c=conf_nextfield();
				break;
		}
		++configidx; /* Keep track of which line from the config string we're reading - for pattern matching. */
	}
	for(;line<7;++line)
	{
		moremenu=0;
		*menu[line].label=0;
		menu[line].action=0;
	}
	if(selpage)
	{
		menu[7].u.menu.page=0;
		menu[7].action=MENU_ACTION(&submenu);
		menu[7].label="\x80 Back";
	}
	else
	{
		menu[7].label="\x80 Exit";
		menu[7].action=MENU_ACTION(&MenuHide);
	}
	menu[8].action=MENU_ACTION(&scrollmenu);

	SPI_DISABLE(HW_SPI_CONF);
	return(maxpage);
}


void buildmenu(int offset)
{
	parseconf(menupage,menu,menuindex,7);
	Menu_Set(menu);
}

__weak const char *bootrom_name="BOOT    ROM";

__weak char *autoboot()
{
	char *result=0;
	romtype=0;
	LoadROM(bootrom_name);
	return(result);
}

int main(int argc,char **argv)
{
	int havesd;
	int i,c;
	int osd=0;
	char *err;

	PS2Init();

	filename[0]=0;

	SPI(0xff);
	puts("SD Init..");
	if(havesd=spi_init() && FindDrive())
		puts("OK");

	menuindex=0;
	menupage=0;

	buildmenu(0);

	if(err=autoboot())
	{
		menu[7].label=err;
		Menu_Draw(7);
		Menu_ShowHide(1);
	}

	EnableInterrupts();

	while(1)
	{
		HandlePS2RawCodes();

#ifdef CONFIG_CD
		pcecd_poll();
#endif
		Menu_Run();

#ifdef CONFIG_CD
		pcecd_poll();
#endif
	}

	return(0);
}

