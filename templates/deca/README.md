# xxxxxxxxxxx [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - Deca port

xx/xx/23 DECA port DeMiSTified by @yyy from original MiST xxxxxxx https://github.com/mist-devel/xxxxxxxxxxx by @xxx   
xx/xx/23 DECA port by @yyy from previously DeMiSTified core https://github.com/xxxx by @xxx   

[Read this guide about DeMySTifying a core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

### STATUS

* Working fine
* ~~HDMI video outputs special resolution so will not work on all monitors.~~ 

### **FEATURES**

* ~~HDMI video output (special resolution will not work on all LCD monitors)~~
* VGA 444 video output 
* Audio I2S Line out (3.5 jack green connector) ~~and HDMI audio output~~
* ~~MIDI output and MIDI I2S mixing available though an external mt32-pi synthesizer ([MIDI2SBC](https://github.com/somhi/MIDI_I2S_SBC_Pmod_Edge_Interface))~~
* Joystick (through DB9 or USB3 connector in DECA Retro Cape 2)
  * Tested with a Megadrive 6 button gamepad ~~(a permanent high level is applied on pin 7 of DB9, so only buttons B and C work)~~


**Additional hardware required**

- [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2) addon. Otherwise, see pinout below to connect everything through GPIOs.

- SDRAM module
  
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins
  

~~**Optional USB keyboard input**~~

~~Experimental support for USB low speed keyboards  (old & cheap). A mini USB to USB A female adaptor is needed  to be connected into the USB connector next to HDMI. <u>If not working try disconnecting power and/or program again the board.</u>~~ 

~~To generate bitstream with USB support edit the  /deca/deca_top.vhd and change the defined variable DECA_KEYB to 2 at the top of the file.~~

### Binaries

Fins .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/DECAfpga/DECA_binaries

### Compile the project in Quartus

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /deca/deca_top.vhd in case additional actions are needed
#Load project file in Quartus (/deca/[core_name]_deca.qpf)
```

### Instructions to compile the project for a specific board

```sh
git clone https://github.com/[repo_name]/[core_name]
cd [core_name]
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=deca
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command lineDeMiSTifyied](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/[core_name]_deca.qpf

### Buttons

* The user button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

* The user button KEY1 opens the OSD

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

### Pinout connections

![pinout_deca](../DeMiSTify/Board/deca/pinout_deca.png)

~~Mouse is not used in this core~~

~~MIDI is not used in this core~~

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).
