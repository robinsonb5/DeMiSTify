# xxxxxxxxxxx - Deca MiST port

22/09/21 DECA MiST port DeMiSTified by @somhi  from original MiST xxxxx core https://github.com/mist-devel/xxxxxxx.   

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
* User input through the MAX3421E USB (keyborad, mouse, joystick)

**Additional hardware required**

- MiST addon with AT91SAM7S256, USB Host Shield, SD card modules
- SDRAM module
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins

### Binaries

Fins .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/DECAfpga/DECA_binaries

### Compile the project in Quartus:

Project already has the DeMiSTify firmware already generated so if you have cloned recursively then you can open the project with Quartus:

```sh
git clone  --recursive https://github.com/DECAfpga/[core_name]
#check comments on top of /deca_mist/deca_mist_top.vhd in case additional actions are needed
#Load project file in Quartus (/deca_mist/PCXT_deca_mist.qpf)
```

### Instructions to compile the project for a specific board:

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
make BOARD=deca_mist
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca_mist/PCXT_deca_mist.qpf

### OSD Controls

* F12 show/hide OSD 

### Pinout connections

![pinout_deca](../DeMiSTify/Board/deca_mist/pinout_deca.png)

~~Mouse is not required to use this core~~

~~MIDI is not used in this core~~





