# [DeMiSTified](https://github.com/robinsonb5/DeMiSTify) Deca port

### Binaries

Find .sof and .svf binary bitstreams for this core at the corresponding category at https://github.com/DECAfpga/DECA_binaries

### Compile the project in Quartus

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /deca/deca_top.sv[vhd] in case additional actions are needed
#Load project file in Quartus (/deca/[core_name]_deca.qpf)
```

### Instructions to compile the project for a specific board

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
make BOARD=deca
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /deca/[core_name]_deca.qpf

### Buttons

* The user button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

* The user button KEY1 opens the OSD

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode

### Pinout connections

![pinout_deca](https://github.com/DECAfpga/DECA_board/raw/main/Deca_pinout/DECA-vector-Cores-v1.2/pinout_deca.png)

