# xxxxx  [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) - Atlas CYC1000 port

xx/xx/23 Atlas CYC1000 port DeMiSTified by @yyy from original MiST xxxxxxx https://github.com/mist-devel/xxxxxxxxxxx by @xxx   
xx/xx/23 Atlas CYC1000 port by @yyy from previously DeMiSTified core https://github.com/xxxx by @xxx   

[Read this guide about DeMySTifying a core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

### STATUS

* VGA version only at the moment.
* ~~HDMI video outputs special resolution so will not work on all monitors.~~ 

### FEATURES

* ~~HDMI video output~~
* VGA 222 video output is available through an HDMI to VGA adapter
* HDMI audio output
* Audio Sigma-Delta output
* ~~Audio output (Midi, I2S)~~
* Joystick support
  * Tested with a Megadrive 6 button gamepad ~~(a permanent high level is applied on pin 7 of DB9, so only buttons B and C work)~~


**Additional hardware required**:

* PS/2 keyboard 
* ~~USB keyboard~~ 

### Compile the project in Quartus

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /atlas_cyc/deca_top.vhd in case additional actions are needed
#Load project file in Quartus (/atlas_cyc/[core_name]_atlas_cyc.qpf)
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
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc, ...). If not specified it will compile for all targets.
cd ..
make BOARD=atlas_cyc
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /atlas_cyc/[core_name]_atlas_cyc.qpf

### Buttons

* The user button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

