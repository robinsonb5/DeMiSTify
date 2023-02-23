# xxxxxxxxxxx [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - Deca port

22/09/21 DECA port DeMiSTified by @somhi from original MiST xxxxx core https://github.com/mist-devel/xxxxxxx.   

27/11/21 DECA port by @somhi from original Demistified xxxxx core https://github.com/robinsonb5/xxxxx by Alastair M. Robinson.

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

~~THIS PORT REQUIRES A SDRAM MODULE WITH SEPARATED DQMH/L SIGNALS (old MiSTer memory modules with 3 extra pins).~~

Compatible with [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2).

### STATUS

* Working fine
* ~~HDMI video outputs special resolution so will not work on all monitors.~~ 

### **FEATURES**

* ~~HDMI video output (special resolution will not work on all LCD monitors)~~
* VGA 444 video output 
* Audio I2S Line out (3.5 jack green connector) ~~and HDMI audio output~~
* ~~MIDI output and MIDI I2S mixing available though an external mt32-pi synthesizer ([MIDI2SBC](https://github.com/somhi/MIDI_I2S_SBC_Pmod_Edge_Interface))~~
* Joystick available through DB9 or USB3 connector in DECA Retro Cape 2
  * This core was tested with a Megadrive 6 button gamepad (a permanent high level is applied on pin 7 of DB9, so only buttons B and C work)


**Additional hardware required**

- [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2) addon

- SDRAM module
  
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins
  
  

~~**Optional USB keyboard input**~~

~~Experimental support for USB low speed keyboards  (old & cheap). A mini USB to USB A female adaptor is needed  to be connected into the USB connector next to HDMI. <u>If not working try disconnecting power and/or program again the board.</u>~~ 

~~To generate bitstream with USB support edit the  /deca/deca_top.vhd and change the defined variable DECA_KEYB to 2 at the top of the file.~~

### Binaries

Fins .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/DECAfpga/DECA_binaries

### Compile the project in Quartus

Project already has the DeMiSTify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/DECAfpga/[core_name]
#check comments on top of /deca/deca_top.vhd in case additional actions are needed
#Load project file in Quartus (/deca/[core_name]_deca.qpf)
```

### Instructions to compile the project for a specific board

```sh
git clone https://github.com/DECAfpga/[core_name]
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

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/[core_name]_deca.qpf

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

### Pinout connections

![pinout_deca](../DeMiSTify/Board/deca/pinout_deca.png)

~~Mouse is not required to use this core~~

~~MIDI is not used in this core~~

**Others:**

* Button KEY0 is a reset button

