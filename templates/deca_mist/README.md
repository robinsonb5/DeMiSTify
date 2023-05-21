# Deca MiSTdon port

### MiST firmware

Official MiST firmware speed is 24 MHz. To have better compatibility with MiSTdon a [16 MHz firmware](https://github.com/somhi/MiSTdon) version might be needed. 

**Additional hardware required**

- [MiST addon](https://github.com/somhi/MiSTdon) with AT91SAM7S256, USB Host Shield, SD card modules
- [Deca Retro Cape 2](https://github.com/somhi/DECA_retro_cape_2) addon. Otherwise, see pinout below to connect everything through GPIOs.
- SDRAM module

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



