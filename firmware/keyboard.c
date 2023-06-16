/*
-- PS/2 Keyboard handling code
-- Copyright (c) 2020 by Alastair M. Robinson

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

#include "config.h"
#include "keyboard.h"
#include "ps2.h"
#include "user_io.h"
#include "spi.h"
#include "interrupts.h"

// Only need 2 bits per key in the keytable,
// so we'll use 32-bit ints to store the key statuses
// since that's more convienent for the ZPU.
// Keycode (0-255)>>4 -> Index
// Shift each 2-bit tuple by (keycode & 15)*2.
unsigned int keytable[16]={0};


static char arcade_coinstart_keys[]={0x16,0x1e,0x26,0x25,0x2e,0x36,0x3d,0x3e}; /* PS/2 codes for keys 1 through 8 */

extern int menu_buttons;

__weak void SendArcadeKeys()
{
	static unsigned int prev=0x000;
	unsigned int d=menu_buttons ^ prev;
	unsigned int s=prev;
	unsigned int i;
	DisableInterrupts();
	for(i=0;i<8;++i)
	{
		if(d&0x10) /* Coin / start buttons are in bits 11 downto 4 of menu_buttons. */
			SendKey(arcade_coinstart_keys[i],0,s&0x10);
		d>>=1;
		s>>=1;
	}
	EnableInterrupts();
	prev=menu_buttons;
}


static int isarcadekey(int key)
{
	int i;
	for(i=0;i<8;++i) {
		if(arcade_coinstart_keys[i]==key)
			return(1);
	}
	return(0);
}


__weak void SendKey(int key, int extkey, int keyup)
{
#ifdef CONFIG_SENDKEYS_ARCADE
	if(!isarcadekey(key))
		return;
#endif
	EnableIO();
	SPI(UIO_KEYBOARD);
	if(extkey)
		SPI(0xe0);
	if(keyup)
		SPI(0xf0);
	SPI(key);
	EnableIO(); /* Ensure select doesn't release too soon. */
	DisableIO();
}


int HandlePS2RawCodes(int blockkeys)
{
	int result=0;
	static int keyup=0;
	static int extkey=0;
	int updateleds=0;
	int key;

	while((key=PS2KeyboardRead())>-1)
	{
//		printf("%d\n",key);
		if(key==KEY_EXT)
		{
			extkey=1;
			break;
		}
#ifdef CONFIG_KEYBOARD_SET1
		if(key&KEY_SET1_KEYUP)
		{
			keyup=1;
			key&=~KEY_SET1_KEYUP;
		} /* Set 1, keyup is the MSB of the keycode */
#else
		else if(key==KEY_KEYUP)
			keyup=1;
		else /* Set 2, keyup is a distinct code */
#endif
		{
			int keyidx=extkey ? key | 0x80 : key;
			/* Send keys before updating the keytable - allows the core to avoid sending repeats by checking the current key status. */
#ifdef CONFIG_SENDKEYS
			if(!blockkeys)
				SendKey(key,extkey,keyup);
#endif
//			printf("%d,%d,%d\n",key,extkey,keyup);

			/* Update the keytable */
			if(keyup)
				keytable[keyidx>>4]&=~(1<<((keyidx&15)*2));  // Mask off the "currently pressed" bit.
			else
				keytable[keyidx>>4]|=3<<((keyidx&15)*2);	// Currently pressed and pressed since last test.
			extkey=0;
			keyup=0;
		}
	}
	return(result);
}


__weak int UpdateKeys(int blockkeys)
{
#ifdef CONFIG_SENDKEYS_ARCADE
	SendArcadeKeys();
#endif
	return(HandlePS2RawCodes(blockkeys));
}

void ClearKeyboard()
{
	int i;
	for(i=0;i<16;++i)
		keytable[i]=0;
}

int TestKey(int rawcode)
{
	int result;
	DisableInterrupts();	// Make sure a new character doesn't arrive halfway through the read
	result=3&(keytable[rawcode>>4]>>((rawcode&15)*2));
	keytable[rawcode>>4]&=~(2<<((rawcode&15)*2));	// Mask off the "pressed since last test" bit.
	EnableInterrupts();
	return(result);
}

