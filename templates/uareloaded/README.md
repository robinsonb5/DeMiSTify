# xxxxx [DeMiSTified](https://github.com/robinsonb5/DeMiSTify)  - UnAMIGA Reloaded port

xx/xx/23 UnAmiga reloaded port DeMiSTified by @yyy from original MiST xxxxxxx https://github.com/mist-devel/xxxxxxxxxxx by @xxx   
xx/xx/23 UnAmiga reloaded port by @yyy from previously DeMiSTified core https://github.com/xxxx by @xxx   

[Read this guide about DeMySTifying a core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

### STATUS

* Working fine

### Compile the project in Quartus:

If the project has the DeMiSTify firmware already generated you only need to clone recursively the repository and then open the project with Quartus from the specific board folder:

```sh
git clone  --recursive https://github.com/[repo_name]/[core_name]
#check comments on top of /uareloaded/uareloaded_top.vhd in case additional actions are needed
#Load project in Quartus from /uareloaded/[core_name]_uareloaded.qpf
```

### Instructions to Full compile the project for a specific board:

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
make BOARD=uareloaded
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /uareloaded/[core_name]_uareloaded.qpf

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
