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

#include "uart.h"
#include "spi.h"
#include "minfat.h"
#include "interrupts.h"
#include "keyboard.h"
#include "ps2.h"
#include "userio.h"
#include "osd.h"
#include "menu.h"
#include "font.h"

#define Breadcrumb(x) HW_UART(REG_UART)=x;

#define UPLOADBASE 0xFFFFFFF8
#define UPLOAD_ENA 0
#define UPLOAD_DAT 4
#define HW_UPLOAD(x) *(volatile unsigned int *)(UPLOADBASE+x)

int statusword; /* Support 32-bit status word initially - need to be 64-bit in the long run */
#define LINELENGTH 32
int menupage;
int romtype;

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
	int c=conf_next();
//	printf("Getdigit %c\n",c);
	if(c>='0' && c<='9')
		c-='0';
	if(c>='A' && c<='F')
		c-='A'-10;
	return(c);	
}


int matchextension(const char *ext)
{
	int done=0;
	int i=0;
	int c=1;
	int c1,c2,c3;

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(SPI_CONF_READ); // Read conf string command
	
//	printf("Matching %s with romtype %d\n",ext,romtype);

	if(c=conf_nextfield())
	{
		c1=conf_next();
		if(c1==';' || romtype )
		{
			done=1;
			while(c)
			{
				if(c!=';')
					conf_nextfield();
				c=conf_next();
			//		printf("c: %c\n",c);
				if(c=='F')
				{
					conf_next();
					c1=conf_next();
					c=0;
					done=0;
				}
			}
		}
	}

	// c1 will already have been read
	while(!done)
	{
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
		c1=conf_next();
	}
	SPI_DISABLE(HW_SPI_CONF);
//	printf("Second match result %d\n",i);
	return(i);
}


/* Upload data to FPGA */

fileTYPE file;

void VerifyROM()
{
	int imgsize=file.size;
	int sendsize;
	SPI_ENABLE(HW_SPI_FPGA)
	SPI(SPI_FPGA_FILE_TX);
	SPI(0x03);	/* Verify */
	SPI_DISABLE(HW_SPI_FPGA);

	SPI_ENABLE_FAST(HW_SPI_SNIFF);
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

int LoadROM(const char *fn)
{
	if(FileOpen(&file,fn))
	{
		int imgsize=file.size;
		int sendsize;
		int extindex=matchextension(fn); /* Figure out which extension matches, and thus which index we need to use */
//		printf("Opened file, loading %s, (idx %d)...\n",fn+8,extindex);

		SPI_ENABLE(HW_SPI_FPGA);
		SPI(SPI_FPGA_FILE_INDEX);
		SPI((romtype+1)|((extindex-1)<<6)); /* Set ROM index */
		SPI_DISABLE(HW_SPI_FPGA);

		SPI(0xFF);

		SPI_ENABLE(HW_SPI_FPGA);
		SPI(SPI_FPGA_FILE_TX);
		SPI(0x01); /* Upload */
		SPI_DISABLE(HW_SPI_FPGA);

		while(imgsize)
		{
			char *buf=sector_buffer;
//			if(!FileRead(&file,0))//sector_buffer))
			if(!FileRead(&file,sector_buffer))
				return(0);

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

			SPI_ENABLE(HW_SPI_FPGA|HW_SPI_FAST);
			SPI(SPI_FPGA_FILE_TX_DAT);
			while(sendsize--)
			{
				SPI(*buf++);
			}
			SPI_DISABLE(HW_SPI_FPGA);

			FileNextSector(&file);
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
	int i,t;
	for(i=0;i<1024;++i)
		t=HW_SPI(HW_SPI_CS);
}

int menuindex;
int moremenu;
int romindex;
static void listroms();
void selectrom(int row);
static void scrollroms(int row);
void buildmenu(int offset);
static void submenu(int row);

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


static DIRENTRY *nthfile(int n)
{
	int i,j=0;
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


void selectrom(int row)
{
	DIRENTRY *p=nthfile(romindex+row);
//	printf("File %s\n",p->Name);
	if(p)
	{
		strncpy(longfilename,p->Name,11); // Make use of the long filename buffer to store a temporary copy of the filename,
		menu[row].label="Loading...";
		Menu_Draw(row);
		menu[row].label=romfilenames[row];
		LoadROM(longfilename);	// since loading it by name will overwrite the sector buffer which currently contains it!
	}
	Menu_Draw(row);
	Menu_Hide();
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
	int i,j;
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
				menu[j].val=-1;
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
		romfilenames[j][0]=0;
	}
	menu[7].val=0;
	menu[7].action=MENU_ACTION(&submenu);
	menu[7].label="\x80 Back";
	menu[8].action=MENU_ACTION(&scrollroms);
	Menu_Draw(row);
}

static void fileselect(int row)
{
	romtype=row;
	listroms(row);
}


static void reset(int row)
{
	Menu_Hide();
	// FIXME reset here
}


static void SaveSettings(int row)
{
	Menu_Hide();
	// FIXME reset here
}

static void MenuHide(int row)
{
	Menu_Hide();
}

static void showrommenu(int row)
{
	romindex=0;
	listroms(row);
	Menu_Set(menu);
}


static void submenu(int row)
{
	menupage=menu[row].val;
	putchar(row+'0');
	buildmenu(0);
}


static void cycle(int row)
{
	int v;
	struct menu_entry *m=&menu[row];
	v=(statusword>>m->shift);	// Extract value from existing statusword
	v&=m->val;					// and mask...
	++v;
	if(v>=m->limit)
		v=0;
	statusword&=~(m->val<<m->shift); // Mask off old bits from status word
	statusword|=v<<m->shift;		// and insert new value

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(UIO_SET_STATUS2); // Read conf string command
	SPI(statusword);
	SPI(statusword>>8);
	SPI(statusword>>16);
	SPI(statusword>>24);
	SPI_DISABLE(HW_SPI_CONF);

	parseconf(menupage,menu,0,7);
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
	parseconf(menupage,menu,0,7);
	Menu_Draw(row);
}


int parseconf(int selpage,struct menu_entry *menu,int first,int limit)
{
	int c;
	int page=0;
	int maxpage=0;
	int line=0;
	char *title;
	int skip=menuindex;
	moremenu=1;

	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(SPI_CONF_READ); // Read conf string command

	conf_nextfield(); /* Skip over core name */
	c=conf_next();
	if(c!=';')
	{
		strcpy(menu[line].label,"Load *. ");
		menu[line].action=MENU_ACTION(&fileselect);
		menu[line].label[7]=c;
		copytocomma(&menu[line].label[8],LINELENGTH-8,1);
		if(line>=skip)
			++line;
		else
			--skip;
	}
	while(c && line<limit)
	{
		c=conf_next();
		switch(c)
		{
			case 'F':
				if(!selpage)
				{
					conf_next();
					copytocomma(menu[line].label,10,0);
					copytocomma(menu[line].label,LINELENGTH-2,1);
					menu[line].action=MENU_ACTION(&fileselect);
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
						menu[line].val=page;
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
					int low,high=0;
					int opt=0;
					int val;

					/* Parse option */
					low=getdigit();
					high=getdigit();

					if(high==',')
						high=low;
					else
						conf_next();

					menu[line].shift=low;
					menu[line].val=(1<<(1+high-low))-1;
					val=(statusword>>low)&menu[line].val;
//					printf("Statusword %x, shifting by %d: %x\n",statusword,low,menu[line].val);

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
						menu[line].limit=opt;
						menu[line].action=MENU_ACTION(&cycle);
					}
					else
					{
						menu[line].limit=2;
						menu[line].action=MENU_ACTION(&toggle);
					}

					if(line>=skip)
						++line;
					else
						--skip;
				}
				else
					c=conf_nextfield();
				break;
			default:
				c=conf_nextfield();
				break;
		}
	}
	for(;line<7;++line)
	{
		moremenu=0;
		*menu[line].label=0;
		menu[line].action=0;
	}
	if(selpage)
	{
		menu[7].val=0;
		menu[7].action=MENU_ACTION(&submenu);
		menu[7].label="\x80 Back";
	}
	else
	{
		menu[7].label="\x80 Exit";
		menu[7].action=MENU_ACTION(&Menu_Hide);
	}
	menu[8].action=MENU_ACTION(&scrollmenu);

	SPI_DISABLE(HW_SPI_CONF);
	return(maxpage);
}


void buildmenu(int offset)
{
	parseconf(menupage,menu,0,7);
	Menu_Set(menu);
}


__weak const char *bootrom_name="BOOT    ROM";

char filename[16];
int main(int argc,char **argv)
{
	int havesd;
	int i,c;
	int osd=0;

	PS2Init();

	filename[0]=0;

	SPI(0xff);
	puts("SD Init..");
	if(havesd=spi_init() && FindDrive())
		puts("OK");

	LoadROM(bootrom_name);

	menuindex=0;
	menupage=0;
	buildmenu(0);
//	Menu_Hide();
	EnableInterrupts();

	while(1)
	{
		HandlePS2RawCodes();

		Menu_Run();
	}

	return(0);
}

