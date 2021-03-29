/*
-- Menu handling
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

#include <stdio.h>

#include "font.h"
#include "userio.h"
#include "osd.h"
#include "menu.h"
#include "keyboard.h"
#include "spi.h"

#include "gamepadkeys.h"

#define OSD_ROWS OSDNLINE
#define OSD_COLS (OSDLINELEN/8)

#define menurows OSD_ROWS

static struct menu_entry *menu;
static int menu_visible=0;
int menu_toggle_bits;

static int currentrow;
static struct hotkey *hotkeys;

void Menu_Draw(int currentrow)
{
	int i;
	struct menu_entry *m=menu;
	for(i=0;i<OSD_ROWS;++i)
	{
		OsdWriteStart(i,i==currentrow,0);
		OsdPutChar(' ');
		OsdPuts(m->label);
		OsdWriteEnd();
		m++;
	}
}


void Menu_Set(struct menu_entry *head)
{
	menu=head;
//	Menu_Draw(currentrow);
	currentrow=menurows-1;
	Menu_Draw(currentrow);
}


void Menu_SetHotKeys(struct hotkey *head)
{
	hotkeys=head;
}

void Menu_ShowHide(int visible)
{
	OsdShowHide(visible);
	menu_visible=visible;
}


/* Analogue joystick support - left with weak linkage so it can be overriden */

__weak int analoguesensitivity=0x10;
__weak void Menu_JoystickToAnalogue(int *ana,int joy)
{
	int a=*ana;
	int min=-0x7f00,max=0x7f00;
	if(joy&2)
	{
		max=-analoguesensitivity<<8;
		a-=analoguesensitivity;
	}
	else if(joy&1)
	{
		min=analoguesensitivity<<8;
		a+=analoguesensitivity;
	}
	else
		a=(a*15)>>4;
	if(a<min)
		a=min;
	if(a>max)
		a=max;
	*ana=a;
#if 0
	int target=0;
	if(joy&2)
		target=-0x7fff;
	if(joy&1)
		target=0x7fff;
	*ana=(*ana*0x3ff+target)>>10;
#endif
}


__weak void Menu_Joystick(int port,int joymap)
{
	user_io_digital_joystick_ext(port, joymap);
}


/* Key -> gamepad mapping.  Weak linkage to allow overrides.
   FIXME - needs to be wider to allow for extra buttons. */

__weak unsigned char joy_keymap[]=
{
	KEY_CAPSLOCK,
	KEY_LSHIFT,
	KEY_ALT,
	KEY_LCTRL,
	KEY_W,
	KEY_S,
	KEY_A,
	KEY_D,
	KEY_ENTER,
	KEY_RSHIFT,
	KEY_ALTGR,
	KEY_RCTRL,
	KEY_UPARROW,
	KEY_DOWNARROW,
	KEY_LEFTARROW,
	KEY_RIGHTARROW,
};

void SetScandouble(int sd)
{
	SPI(0xff);
	SPI_ENABLE(HW_SPI_CONF);
	SPI(UIO_BUT_SW); // Set "DIP switch" for scandoubler
	SPI(sd<<4);
	SPI_DISABLE(HW_SPI_CONF);
}


int scandouble=0;
int prevbuttons=0;
unsigned int joy_timestamp=0;
#define JOY_REPEATDELAY 160
#define SCANDOUBLE_TIMEOUT 1000
void Menu_Run()
{
	int i;
	int upd=0;
	int buttons=HW_JOY(REG_JOY_EXTRA);
	int menu_timestamp;
	struct menu_entry *m=menu;
	struct hotkey *hk=hotkeys;
	int joy=HW_JOY(REG_JOY);

	if((TestKey(KEY_F12)&2) || ((buttons & ~prevbuttons) & JOY_BUTTON_MENU))
	{
		menu_timestamp=HW_TIMER(REG_MILLISECONDS);
		while(TestKey(KEY_F12) || (buttons & JOY_BUTTON_MENU))
		{
			buttons=HW_JOY(REG_JOY_EXTRA);
			HandlePS2RawCodes();
			if((HW_TIMER(REG_MILLISECONDS)-menu_timestamp)>SCANDOUBLE_TIMEOUT)
			{
				SetScandouble(scandouble^=1);
				menu_timestamp=HW_TIMER(REG_MILLISECONDS);
			}
		}
		OsdShowHide(menu_visible^=1);
//		printf("Menu visible %d\n",menu_visible);
		upd=1;
	}
	prevbuttons=buttons;

	if(!menu_visible)	// Swallow any keystrokes that occur while the OSD is hidden...
	{
		int joybit=0x8000;
		unsigned char *key=joy_keymap;
		while(joybit)
		{
			if(TestKey(*key++))
				joy|=joybit;
			joybit>>=1;
		}
		Menu_Joystick(0,joy&0xff);
		Menu_Joystick(1,joy>>8);

		TestKey(KEY_PAGEUP);
		TestKey(KEY_PAGEDOWN);

		return;
	}

	joy=(joy&0xff)|(joy>>8); // Merge ports;

	if(joy)
	{
		unsigned int ms=HW_TIMER(REG_MILLISECONDS);
		if((ms-joy_timestamp)<JOY_REPEATDELAY)
			joy=0;
		else
			joy_timestamp=ms;
	}
	else
		joy_timestamp=0;

	if((joy&0x08)||(TestKey(KEY_UPARROW)&2))
	{
		if(currentrow)
			--currentrow;
		else if((m+menurows)->action)
			MENU_ACTION_CALLBACK((m+menurows)->action)(ROW_LINEUP);
		upd=1;
	}

	if((joy&0x04)||(TestKey(KEY_DOWNARROW)&2))
	{
		if(currentrow<(menurows-1))
			++currentrow;
		else if((m+menurows)->action)
			MENU_ACTION_CALLBACK((m+menurows)->action)(ROW_LINEDOWN);
		upd=1;
	}

	if(TestKey(KEY_PAGEUP)&2)
	{
		if(currentrow)
			currentrow=0;
		else if((m+menurows)->action)
			MENU_ACTION_CALLBACK((m+menurows)->action)(ROW_PAGEUP);
		upd=1;
	}

	if(TestKey(KEY_PAGEDOWN)&2)
	{
		if(currentrow<(menurows-1))
			currentrow=menurows-1;
		else if((m+menurows)->action)
			MENU_ACTION_CALLBACK((m+menurows)->action)(ROW_PAGEDOWN);
		upd=1;
	}

	// Find the currently highlighted menu item
	if((joy&0xf0) || (TestKey(KEY_ENTER)&2))
	{
		MENU_ACTION_CALLBACK((m+currentrow)->action)(currentrow);
	}

	while(hk && hk->key)
	{
		if(TestKey(hk->key)&1)	// Currently pressed?
			hk->callback(currentrow);
		++hk;
	}

	if(upd)
		Menu_Draw(currentrow);
}

