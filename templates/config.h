/* Configuration file should be placed in the core's firmware directory.
   Each core will have different requirements of the firmware, and by avoiding
   the parts not needed the ROM size can be kept to a minimum */

#ifndef CONFIG_H
#define CONFIG_H


/************************

  GENERAL CONFIGURATION
  
************************/

/* Do we need access to the SD card filesystem? (Defined in the negative
   so that filesystem support is built by default) */

#undef CONFIG_WITHOUT_FILESYSTEM

/* Do we support the Real Time Clock (if available)? */
#undef CONFIG_RTC

/* Support for 64-bit status word.  Adds around 200 bytes to the firmware size. */
#undef CONFIG_STATUSWORD_64BIT

/* Automatically close OSD on toggle menu items (generally reset) */
#undef CONFIG_AUTOCLOSE_OSD

/* If this is defined, DeMiSTify will look for a file called "15KHZ.CFG", and if found,
disable the scandoubler. */
#define CONFIG_AUTOSCANDOUBLER


/************************

  DISK IMAGE HANDLING
  
************************/

/* Disk Image support - used for Save RAM on consoles as well as the
more obvious application of disk images on computer cores.  If not defined
here, the number of units defaults to 4. */
#undef CONFIG_DISKIMG
#undef CONFIG_DISKIMG_UNITS 2

/* Speed up file operations by "bookmarking" the file.
   (Undef to disable, or set to the number of desired bookmarks - a reasonable
   range would be between 4 and 16 */
#undef CONFIG_FILEBOOKMARKS 6


/* IDE emulation */
#define CONFIG_IDE
#define CONFIG_IDE_UNITS 2


/* CDROM support - used by the TurboGrafx core */
#undef CONFIG_CD


/* Is this an arcade core with .ARC file support? */
#define CONFIG_ARCFILE
/* If the core doesn't have its own ROM loading menu item, use this to add a selector for .ARC files. */
#undef CONFIG_ARCFILE_SELECTOR


/* Do we require an autoboot ROM, and thus should we notify the user if it's not found? */
#undef ROM_REQUIRED

/* ROM name will default to "BOOT    ROM" if not defined here... */ 
#undef ROM_FILENAME "CORE    ROM"

/* Do we support settings files */

#undef CONFIG_SETTINGS_FILENAME "CORE    CFG"
#undef CONFIG_SETTINGS


/************************

     INPUT HANDLING
  
************************/

/* Send key events via the mist_io block. If the core can support
   a PS/2 keyboard directly then that's probably a better option. */
#define CONFIG_SENDKEYS

/* Limit key transmission to those required to trigger coin / start buttons.
   Also causes bits 11 downto 4 of the extra buttons field to be treated as menu / start buttons.
   Only needed when the core uses the arcade_inputs module but you want to provide your
   own keyboard -> joystick mapping via CONFIG_JOYKEYS. 
   (Should be defined in addition to CONFIG_SENDKEYS) */
#undef CONFIG_SENDKEYS_ARCADE

/* If the core has initialised the keyboard to use scan set 1 the OSD will
   need to use set 1 as well. */
#undef CONFIG_KEYBOARD_SET1


/* PS/2 Mouse support */
#undef PS2_MOUSE
#undef PS2_MOUSE_WHEEL /* Attempt to initialise the mouse in 4-byte (wheel) mode */
#undef PS2_MOUSE_USERIO /* Do we need to send the mouse data to the core (not needed if the core can interpret PS/2 wires directly. */
#undef PS2_WRITE /* Needed to initialise the mouse and put it in wheel mode */


/* Keyboard-based Joystick emulation */
#undef CONFIG_JOYKEYS

/* Send joystick events using the "new" extended joystick protocol,
   which allows for more button.  Some cores still use the older protocol. */
#define CONFIG_EXTJOYSTICK

/* Choose how many bits are devoted to joystick signals.  Must match the
   demistify_joybits constant defined in demistify_config_pkg.vhd.  Defaults
   to 8 for compatiblity with existing cores.
   If you increase this, you *MUST* override the joy_keymap from menu.c in
   overrides.c */

#define CONFIG_JOYBITS 8


#endif

