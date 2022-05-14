# Arrow SoCKit development kit by Terasic based on Intel® Cyclone V SoC FPGA board

Website: https://github.com/SoCFPGA-learning/SoCKit

Family: Cyclone V

Device: 5CSXFC6D6F31C6

Total logic (ALMs): 41910 (aprox. 110 kLE)

Total memory (BRAM): 707.8 kB  (5,662,720 bits)  

Total PLLs: 15



### F P G A   D e v i c e

Cyclone V SoC 5CSXFC6D6F31 Device
Dual-core ARM Cortex-A9 (HPS)
110K Programmable Logic Elements
5,140 Kbits embedded memory
6 Fractional PLLs
2 Hard Memory Controllers
3.125G Transceivers
SoCKit User Manual

### C o n f i g u r a t i o n   a n d   D e b u g

Quad Serial Configuration device – EPCQ256 on FPGA
On-Board USB Blaster II (mini USB type B connector)

### M e m o r y   D e v i c e

1GB (2x256MBx16) DDR3 SDRAM on FPGA
1GB (2x256MBx16) DDR3 SDRAM on HPS
64MB QSPI Flash on HPS
Micro SD Card Socket on HPS

### C o m m u n i c a t i o n

USB 2.0 OTG (ULPI interface with mini USB type AB connector)
USB to UART (mini USB type B connector)
10/100/1000 Ethernet

### C o n n e c t o r s

One HSMC (8-channel Transceivers, Configurable I/O standards 1.5/1.8/2.5/3.3V)
One LTC connector (One Serial Peripheral Interface (SPI) Master ,one I2C and one GPIO
interface )

### D i s p l a y

24-bit VGA DAC
128x64 dots LCD Module with Backlight

### A u d i o

24-bit CODEC, Line-in, line-out, and microphone-in jacks

### S w i t c h e s , B u t t o n s   a n d   L E D s

8 User Keys (FPGA x4 ; HPS x 4)
8 User Switches (FPGA x4 ; HPS x 4)
8 User LEDs (FPGA x4 ; HPS x 4)
2 HPS Reset Buttons (HPS_RSET_n and HPS_WARM_RST_n)

### S e n s o r s

G-Sensor on HPS
Temperature Sensor on FPGA

### P o w e r

12V DC input





### Pinout connections:

Work in progress. Check the qsf  project file at the sockit folder.

I'm currently using the Terasic HSMC to GPIO [Daughter Board](https://www.digikey.es/es/products/detail/P0033/P0033-ND/2003485) connected to the [Deca Retro cape](https://github.com/somhi/DECA_retro_cape_2) to SoCkit gateway.   

* J3 2x40 pin is connected to Deca Retro cape to use its connector peripherals: ps2 keyboard, db9 joystick, pmod3 for a Pmod microSD

* J2 2x40 pin is for connecting [SDRAM Mister modules](http://modernhackers.com/128mb-sdram-board-on-de10-standard-de1-soc-and-arrow-sockit-fpga-sdram-riser/) 

An specific addon for SoCkit might be developed in the future.
