#ifndef MENU_H
#define MENU_H

#define TIMERBASE 0xffffffc8
#define HW_TIMER(x) *(volatile unsigned int *)(TIMERBASE+x)
#define REG_MILLISECONDS 0

#define JOYBASE 0xffffffe8
#define HW_JOY(x) *(volatile unsigned int *)(JOYBASE+x)
#define REG_JOY 0
#define REG_JOY_EXTRA 4

#define JOY_BUTTON_MENU 1

#define ROW_LINEUP -1
#define ROW_LINEDOWN -2
#define ROW_PAGEUP -3
#define ROW_PAGEDOWN -4

typedef long menu_action;
#define MENU_ACTION(x) ((long)(x))
#define MENU_ACTION_TOGGLE(x) x
#define MENU_ACTION_CYCLE(x) x
#define MENU_ACTION_CALLBACK(x) ((void (*)(int row))x)
#define MENU_ACTION_SUBMENU(x) ((struct menu_entry *)(x))

/* Big endian */
/*
#define MENU_CYCLE_VALUE(x) (*(char *)(&(x->action)))
#define MENU_CYCLE_COUNT(x) (*((char *)(&x->action)+3))

#define MENU_SLIDER_VALUE(x) (*(char *)(&(x->action)))
#define MENU_SLIDER_MAX(x) (*((char *)(&x->action)+3))
*/

/* Little endian versions */
#define MENU_CYCLE_VALUE(x) (*((char *)(&x->action)+3))
#define MENU_CYCLE_COUNT(x) (*(char *)(&x->action))

#define MENU_SLIDER_VALUE(x) (*((char *)(&x->action)+3))
#define MENU_SLIDER_MAX(x) (*(char *)(&x->action)


struct menu_entry
{
	menu_action action;	
	char *label;
	char val;
	char limit;
	char shift;
};

struct hotkey
{
	int key;
	void (*callback)(int row);
};


void Menu_ShowHide(int visible);
void Menu_Draw();
void Menu_Set(struct menu_entry *head);
void Menu_SetHotKeys(struct hotkey *head);
void Menu_Run();

extern int menu_toggle_bits;
#define MENU_TOGGLE_VALUES menu_toggle_bits

extern int joya,joyb;

#endif
