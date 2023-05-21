# xxxxxxxxxxx [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - SoCkit port

xx/xx/23 SoCkit port DeMiSTified by @yyy from original MiST xxxxxxx https://github.com/mist-devel/xxxxxxxxxxx by @xxx   
xx/xx/23 SoCkit port by @yyy from previously DeMiSTified core https://github.com/xxxx by @xxx   

[Read this guide about DeMySTifying a core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

### STATUS

* Working fine

### **FEATURES**

* VGA video output (using only 666 but capable of 888)
* Audio I2S Line out (3.5 jack green connector) 

**Additional hardware required**

* Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) for:

  *  SDRAM Mister module 
    * Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
    * Tested with a dual memory module v1.3 with 3 pins

  * PS/2 Keyboard

  * DB9 Joystick 

  * ~~MIDI output and MIDI I2S mixing available though an external mt32-pi synthesizer ([MIDI2SBC](https://github.com/somhi/MIDI_I2S_SBC_Pmod_Edge_Interface))~~



### ~~Binaries~~

~~Fins .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/xxx/sockit_binaries~~  

### Compile the project in Quartus

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /sockit/sockit_top.vhd in case additional actions are needed
#Load project file in Quartus (/sockit/[core_name]_sockit.qpf)
```

### Instructions to compile the project for a specific board:

```sh
git clone --recursive https://github.com/[repo_name]/[core_name]
cd [core_name]
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (17 or greater) in Q18 line
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=sockit
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /sockit/[core_name]_sockit.qpf

### Pinout connections:

Check the qsf  project file at the sockit folder.

I'm currently using the Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) connected to the [Deca Retro cape](https://github.com/somhi/DECA_retro_cape_2) to SoCkit gateway.   

* J3 2x40 pin is connected to Deca Retro cape to use its connector peripherals: ps2 keyboard, db9 joystick, pmod3 for a Pmod microSD

* J2 2x40 pin is for connecting [SDRAM Mister modules](http://modernhackers.com/128mb-sdram-board-on-de10-standard-de1-soc-and-arrow-sockit-fpga-sdram-riser/) 

An specific addon for SoCkit might be developed in the future.

### Buttons

* The reset button KEY4 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

### OSD Controls

* F12 show/hide OSD 

* Long F12 toggles VGA/RGB mode

  

