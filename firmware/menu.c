#include <stdio.h>

#include "font.h"
#include "userio.h"
#include "osd.h"
#include "menu.h"
#include "keyboard.h"

#define OSD_ROWS OSDNLINE
#define OSD_COLS (OSDLINELEN/8)

static struct menu_entry *menu;
static int menu_visible=0;
int menu_toggle_bits;
static int menurows;
static int currentrow;
static struct hotkey *hotkeys;

#if 0

static void DrawSlider(struct menu_entry *m)
{
	int i;
	for(i=0;i<=MENU_SLIDER_MAX(m);++i) // One extra character to leave a space before the label
	{
		OSD_Putchar(i<MENU_SLIDER_VALUE(m) ? 0x07 : 0x20);
	}
}
#endif

void Menu_Draw(int currentrow)
{
	int i;
	char tmp[64];
	struct menu_entry *m=menu;
	menurows=0;
	printf("Highlight row %d\n",currentrow);
	while(m->type!=MENU_ENTRY_NULL)
	{
		int i;
		char **labels;
		OsdWriteStart(menurows,menurows==currentrow,0);
		OsdPutChar(' ');
		switch(m->type)
		{
#if 0
			case MENU_ENTRY_CYCLE:
				i=MENU_CYCLE_VALUE(m);	// Access the first byte
				labels=(char**)m->label;
				OsdPutChar(FONT_CYCLE);
				OsdPutChar(' ');
				OsdPuts(labels[i]);
				break;

			case MENU_ENTRY_SLIDER:
				DrawSlider(m);
				OsdPuts(m->label);
				break;
			case MENU_ENTRY_TOGGLE:
				if((menu_toggle_bits>>MENU_ACTION_TOGGLE(m->action))&1)
					OsdPutChar(FONT_CHECKMARK);
				else
					OsdPutChar(FONT_CROSS);
				OsdPutChar(' ');
				// Fall through
#endif
			default:
				OsdPuts(m->label);
				break;
		}
		OsdWriteEnd();
		++menurows;
		m++;
	}
	i=menurows;
	while(i<OSD_ROWS)
	{
		OsdWriteStart(menurows,0,0);
		OsdWriteEnd();
		++i;
	}
	printf("Menu has %d rows\n",menurows);
}


void Menu_Set(struct menu_entry *head)
{
	menu=head;
	Menu_Draw(currentrow);
	currentrow=menurows-1;
	Menu_Draw(currentrow);
}


void Menu_SetHotKeys(struct hotkey *head)
{
	hotkeys=head;
}

void Menu_Hide()
{
	OsdShowHide(0);
	menu_visible=0;
}


void do_joy()
{
	int joya=0;
	int joyb=0;

	if(TestKey(KEY_ENTER))
		joya|=JOY_BTN4;
	if(TestKey(KEY_RSHIFT))
		joya|=JOY_BTN3;
	if(TestKey(KEY_RCTRL))
		joya|=JOY_BTN1;
	if(TestKey(KEY_ALTGR))
		joya|=JOY_BTN2;
	if(TestKey(KEY_UPARROW))
		joya=JOY_UP;
	if(TestKey(KEY_DOWNARROW))
		joya|=JOY_DOWN;
	if(TestKey(KEY_LEFTARROW))
		joya|=JOY_LEFT;
	if(TestKey(KEY_RIGHTARROW))
		joya|=JOY_RIGHT;

	if(TestKey(KEY_CAPSLOCK))
		joyb|=JOY_BTN4;
	if(TestKey(KEY_LSHIFT))
		joyb|=JOY_BTN3;
	if(TestKey(KEY_LCTRL))
		joyb|=JOY_BTN1;
	if(TestKey(KEY_ALT))
		joyb|=JOY_BTN2;
	if(TestKey(KEY_W))
		joyb=JOY_UP;
	if(TestKey(KEY_S))
		joyb|=JOY_DOWN;
	if(TestKey(KEY_A))
		joyb|=JOY_LEFT;
	if(TestKey(KEY_D))
		joyb|=JOY_RIGHT;

	user_io_digital_joystick_ext(0, joya);
	user_io_digital_joystick_ext(1, joyb);
}


int Menu_Run()
{
	int i;
	int action=0;
	int upd=0;
	struct menu_entry *m=menu;
	struct hotkey *hk=hotkeys;

	if(TestKey(KEY_F12)&2)
	{
		OsdShowHide(menu_visible^=1);
		upd=1;
	}


	if(!menu_visible)	// Swallow any keystrokes that occur while the OSD is hidden...
	{
		do_joy();

		TestKey(KEY_PAGEUP);
		TestKey(KEY_PAGEDOWN);

		return(menu_visible);
	}

	if(TestKey(KEY_UPARROW)&2)
	{
		if(currentrow)
			--currentrow;
		else if((m+menurows)->action)
			MENU_ACTION_CALLBACK((m+menurows)->action)(ROW_LINEUP);
		upd=1;
	}

	if(TestKey(KEY_DOWNARROW)&2)
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
	i=currentrow;
	while(i>0)
	{
		++m;
		--i;
	}

//	OSD_SetX(2);
//	OSD_SetY(currentrow);
#if 0
	if(TestKey(KEY_LEFTARROW)&2) // Decrease slider value
	{
		switch(m->type)
		{
			case MENU_ENTRY_SLIDER:
				if((--MENU_SLIDER_VALUE(m))&0x80) // <0?
					MENU_SLIDER_VALUE(m)=0;
				DrawSlider(m);
				break;
			default:
				break;
		}
	}

	if(TestKey(KEY_RIGHTARROW)&2) // Increase slider value
	{
		switch(m->type)
		{
			case MENU_ENTRY_SLIDER:
				if((++MENU_SLIDER_VALUE(m))>MENU_SLIDER_MAX(m))
					MENU_SLIDER_VALUE(m)=MENU_SLIDER_MAX(m);
				DrawSlider(m);
				break;
			default:
				break;
		}
	}
#endif

	if(i=TestKey(KEY_ENTER)&2)
	{
		struct menu_entry *m=menu;
		printf("Enter detected %d - currentrow %d\n",i,currentrow);
		i=currentrow;
		while(i>0)
		{
			++m;
			--i;
		}
		switch(m->type)
		{
			case MENU_ENTRY_SUBMENU:
				Menu_Set(MENU_ACTION_SUBMENU(m->action));
				break;
			case MENU_ENTRY_CALLBACK:
				printf("Callback %x\n",m->action);
				MENU_ACTION_CALLBACK(m->action)(currentrow);
				break;
			case MENU_ENTRY_TOGGLE:
				i=1<<MENU_ACTION_TOGGLE(m->action);
				menu_toggle_bits^=i;
				upd=1;
				action=1;
				break;
			case MENU_ENTRY_CYCLE:
				i=MENU_CYCLE_VALUE(m)+1;
				if(i>=MENU_CYCLE_COUNT(m))
					i=0;
				MENU_CYCLE_VALUE(m)=i;
				upd=1;
				action=1;
				break;
			default:
				break;

		}
	}

	while(hk && hk->key)
	{
		if(TestKey(hk->key)&1)	// Currently pressed?
			hk->callback(currentrow);
		++hk;
	}
#if 0
	for(i=0;i<OSD_ROWS-1;++i)
	{
		OSD_SetX(0);
		OSD_SetY(i);
		OSD_Putchar(i==currentrow ? (i==menurows-1 ? FONT_ARROW_LEFT : FONT_ARROW_RIGHT) : 32);
	}
#endif
	if(upd)
		Menu_Draw(currentrow);
	return(action);
}

