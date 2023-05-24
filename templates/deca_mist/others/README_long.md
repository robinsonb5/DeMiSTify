# xxxxxxxxxxx - Deca MiST port

xx/xx/23 Deca MiST port by @xxxx from original MiSTer core  https://github.com/mister-devel/xxxxxx



### MiST firmware

Official MiST firmware speed is 24 MHz. To have better compatibility with MiSTdon a [16 MHz firmware](https://github.com/somhi/MiSTdon) version might be needed. 

Note: in case the  SPI bus is noisy while using SS4, it may help adding -DSD_NO_DIRECT_MODE to the Makefile to disable the SS4/SPI_DO method of SD card transfer. 

### STATUS

* Working fine

* ~~HDMI video outputs special resolution so will not work on all monitors.~~ 

### **FEATURES**

* ~~HDMI video output (special resolution will not work on all LCD monitors)~~
* VGA 444 video output 
* Audio I2S Line out (3.5 jack green connector) ~~and HDMI audio output~~
* ~~MIDI output and MIDI I2S mixing available though an external mt32-pi synthesizer ([MIDI2SBC](https://github.com/somhi/MIDI_I2S_SBC_Pmod_Edge_Interface))~~
* User input through MiSTdon's MAX3421E USB (keyboard, mouse, joystick)

**Additional hardware required**

- [MiST addon](https://github.com/somhi/MiSTdon) with AT91SAM7S256, USB Host Shield, SD card modules
- [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2) addon. Otherwise, see pinout below to connect everything through GPIOs.
- SDRAM module
  - Tested with 32 MB SDRAM board for MiSTer (extra slim) XS_2.2
  - Tested with a dual memory module v1.3 with 3 pins

### Compile the project in Quartus:

Clone the repository recursively and open the project with Quartus:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /deca_mist/deca_mist_top.vhd in case additional actions are needed
#Load project file in Quartus (/deca_mist/PCXT_deca_mist.qpf)
```

### OSD Controls

* F12 show/hide OSD 

### Pinout connections

![pinout_deca](https://github.com/DECAfpga/DECA_board/raw/main/Deca_pinout/DECA-vector-Cores-v1.2/pinout_deca.png)

~~Mouse is not required to use this core~~

~~MIDI is not used in this core~~

For 444 video DAC use all VGA pins. For 333 video DAC connect MSB from addon to MSB of location assignment (e.g. connect pin VGAR2 from Waveshare addon to VGA_R[3] Deca pin).



