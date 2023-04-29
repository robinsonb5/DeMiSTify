#ifndef KEYBOARD_H
#define KEYBOARD_H

/* Set 1 scancodes */

#define KEY_SET1_EXT 0xe0
#define KEY_SET1_KEYUP 0x80 // Or'ed with scancode, not a separate byte

#define KEY_SET1_F1 0x3b
#define KEY_SET1_F2 0x3c
#define KEY_SET1_F3 0x3d
#define KEY_SET1_F4 0x3e 
#define KEY_SET1_F5 0x3f
#define KEY_SET1_F6 0x40 
#define KEY_SET1_F7 0x41
#define KEY_SET1_F8 0x42 
#define KEY_SET1_F9 0x43
#define KEY_SET1_F10 0x44
#define KEY_SET1_F11 0x57
#define KEY_SET1_F12 0x58

#define KEY_SET1_NKENTER 0x9C

#define KEY_SET1_ESC 0x01

#define KEY_SET1_1 0x02
#define KEY_SET1_2 0x03
#define KEY_SET1_3 0x04
#define KEY_SET1_4 0x05
#define KEY_SET1_5 0x06
#define KEY_SET1_6 0x07
#define KEY_SET1_7 0x08
#define KEY_SET1_8 0x09
#define KEY_SET1_9 0x0a
#define KEY_SET1_0 0x0b
#define KEY_SET1_MINUS 0x0c
#define KEY_SET1_EQUALS 0x0d
#define KEY_SET1_BACKSPACE 0x0e

#define KEY_SET1_TAB 0x0f
#define KEY_SET1_Q 0x10
#define KEY_SET1_W 0x11
#define KEY_SET1_E 0x12
#define KEY_SET1_R 0x13
#define KEY_SET1_T 0x14
#define KEY_SET1_Y 0x15
#define KEY_SET1_U 0x16
#define KEY_SET1_I 0x17
#define KEY_SET1_O 0x18
#define KEY_SET1_P 0x19
#define KEY_SET1_LEFTBRACE 0x1a
#define KEY_SET1_RIGHTBRACE 0x1b
#define KEY_SET1_ENTER 0x1c

#define KEY_SET1_LCTRL 0x1d
#define KEY_SET1_A 0x1e
#define KEY_SET1_S 0x1f
#define KEY_SET1_D 0x20
#define KEY_SET1_F 0x21
#define KEY_SET1_G 0x22
#define KEY_SET1_H 0x23
#define KEY_SET1_J 0x24
#define KEY_SET1_K 0x25
#define KEY_SET1_L 0x26
#define KEY_SET1_SEMICOLON 0x27
#define KEY_SET1_APOSTROPHE 0x28
#define KEY_SET1_TICK 0x29
#define KEY_SET1_LSHIFT 0x2a
#define KEY_SET1_HASH 0x2b // BACKSLASH on US keyboards

#define KEY_SET1_Z 0x2c
#define KEY_SET1_X 0x2d
#define KEY_SET1_C 0x2e
#define KEY_SET1_V 0x2f
#define KEY_SET1_B 0x30
#define KEY_SET1_N 0x31
#define KEY_SET1_M 0x32
#define KEY_SET1_COMMA 0x33
#define KEY_SET1_PERIOD 0x34
#define KEY_SET1_SLASH 0x35
#define KEY_SET1_RSHIFT 0x36

#define KEY_SET1_NKASTERISK 0x37
#define KEY_SET1_ALT	0x38
#define KEY_SET1_SPACE 0x39
#define KEY_SET1_CAPSLOCK 0x3a

#define KEY_SET1_BACKSLASH 0x42  // Not present on US keyboards

#define KEY_SET1_NUMLOCK 0x45
#define KEY_SET1_SCROLLLOCK 0x46
#define KEY_SET1_NK7 0x47
#define KEY_SET1_NK8 0x48
#define KEY_SET1_NK9 0x49
#define KEY_SET1_NKMINUS 0x4a
#define KEY_SET1_NK4 0x4b
#define KEY_SET1_NK5 0x4c
#define KEY_SET1_NK6 0x4d
#define KEY_SET1_NKPLUS 0x4e
#define KEY_SET1_NK1 0x4f
#define KEY_SET1_NK2 0x50
#define KEY_SET1_NK3 0x51
#define KEY_SET1_NK0 0x52
#define KEY_SET1_NKPERIOD 0x53
#define KEY_SET1_NKPOINT 0x53

#define KEY_SET1_RCTRL 0x9d

#define KEY_SET1_UPARROW 0xc8
#define KEY_SET1_PAGEUP 0xc9
#define KEY_SET1_LEFTARROW 0xcb
#define KEY_SET1_RIGHTARROW 0xcd
#define KEY_SET1_DOWNARROW 0xd0
#define KEY_SET1_PAGEDOWN 0xe1
#define KEY_SET1_NKSLASH 0xb5
#define KEY_SET1_ALTGR 0xb8

#define KEY_SET1_INS 0xd2
#define KEY_SET1_HOME 0xc7
#define KEY_SET1_END 0xcf
#define KEY_SET1_PRTSCRN 0xb7 // Can't properly encode this
#define KEY_SET1_BREAK 0xc5 // Can't properly encode this
#define KEY_SET1_DELETE 0xd3


/* Set 2 scancodes */

#define KEY_EXT 0xe0
#define KEY_KEYUP 0xf0

#define KEY_F1  0x5
#define KEY_F2 	0x6
#define KEY_F3 	0x4
#define KEY_F4 	0x0C 
#define KEY_F5 	0x3
#define KEY_F6 	0x0B 
#define KEY_F7 	0x83
#define KEY_F8 	0x0A 
#define KEY_F9 	0x1
#define KEY_F10 0x9
#define KEY_F11 0x78
#define KEY_F12 0x7

#define KEY_NKENTER 0xDA

#define KEY_CAPSLOCK 0x58
#define KEY_NUMLOCK 0x77
#define KEY_SCROLLLOCK 0x7e
#define KEY_LEFTARROW 0xeb
#define KEY_RIGHTARROW 0xf4
#define KEY_UPARROW 0xf5
#define KEY_DOWNARROW 0xf2
#define KEY_ENTER 0x5a
#define KEY_PAGEUP 0xfd
#define KEY_PAGEDOWN 0xfa
#define KEY_SPACE 0x29
#define KEY_ESC 0x76

#define KEY_K 0x42
#define KEY_L 0x4B
#define KEY_SEMICOLON 0x4C
#define KEY_APOSTROPHE 0x52
#define KEY_Z 0x1A
#define KEY_X 0x22
#define KEY_C 0x21
#define KEY_V 0x2A
#define KEY_B 0x32
#define KEY_N 0x31
#define KEY_M 0x3A

#define KEY_A 0x1c
#define KEY_D 0x23
#define KEY_W 0x1d
#define KEY_S 0x1b
#define KEY_LSHIFT 0x12
#define KEY_RSHIFT 0x59
#define KEY_LCTRL 0x14
#define KEY_RCTRL 0x94
#define KEY_ALT	0x11
#define KEY_ALTGR 0x91
#define KEY_LGUI 0x9f
#define KEY_RGUI 0xa7
#define KEY_MENU 0xaf

#define KEY_COMMA 0x41
#define KEY_PERIOD 0x49
#define KEY_SLASH 0x4a

#define KEY_1 0x16
#define KEY_2 0x1e
#define KEY_3 0x26
#define KEY_4 0x25
#define KEY_5 0x2E
#define KEY_6 0x36
#define KEY_7 0x3D
#define KEY_8 0x3E
#define KEY_9 0x46
#define KEY_INS 0xf0
#define KEY_END 0xe9
#define KEY_0 0x45
#define KEY_HOME 0xec

#define KEY_R 0x2D
#define KEY_T 0x2C
#define KEY_NUMLOCK 0x77
#define KEY_Y 0x35
#define KEY_U 0x3C
#define KEY_NKASTERISK 0x7C
#define KEY_I 0x43
#define KEY_MINUS 0x7B
#define KEY_O 0x44
#define KEY_NK7 0x6C
#define KEY_P 0x4D
#define KEY_NK8 0x75
#define KEY_LEFTBRACE 0x54
#define KEY_NK9 0x7D
#define KEY_RIGHTBRACE 0x5B
#define KEY_NKPLUS 0x79
#define KEY_HASH 0x5D // BACKSLASH on US keyboards
#define KEY_NK4 0x6B

#define KEY_NK6 0x74
#define KEY_NK1 0x69
#define KEY_NK2 0x72
#define KEY_NK3 0x7A
#define KEY_NK0 0x70
#define KEY_NKPERIOD 0x71

#define KEY_E 0x24
#define KEY_F 0x2B
#define KEY_G 0x34
#define KEY_H 0x33
#define KEY_J 0x3B
#define KEY_Q 0x15

#define KEY_BACKSPACE 0x66
#define KEY_NK5 0x73
#define KEY_NKSLASH 0xCA
#define KEY_EQUALS 0x55
#define KEY_NKPOINT 0x71
#define KEY_NKMINUS 0x84

#define KEY_TICK 0x0E
#define KEY_DELETE 0xf1
#define KEY_BACKSLASH 0x61  // Not present on US keyboards
#define KEY_TAB 0x0D

#define KEY_PRTSCRN 0xfc // By rights should be 0xe0 0x12 0xe0 0x7c, so 0x92 0x7c, but the BBC core only checks for 0xe0 0x7c.

#define KEY_BREAK 0xf7 // By rights should be E11477E1F014E077 - with no release code.

void SendKey(int key, int ext, int keyup); /* Overridable for custom key enqueuing */
int UpdateKeys(int blockkeys);
int HandlePS2RawCodes(int blockkeys);
void ClearKeyboard();

int TestKey(int rawcode);

// Each keytable entry has two bits: bit 0 - currently pressed, bit 1 - pressed since last test
extern unsigned int keytable[16];

#endif

