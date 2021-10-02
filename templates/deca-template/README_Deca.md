# xxxxxx DeMiSTified

22/09/21 DECA port DeMiSTified by somhic from original MiST xxxxxx core https://github.com/mist-devel/.   

Special thanks to Alastair M. Robinson creator of [DeMiSTify](https://github.com/robinsonb5/DeMiSTify) for helping me. 

[DeMiSTify guide used](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

##### Versions:

v0.1 VGA version only. I2S audio line out working



### Instructions to compile the project for a specific board:

```sh
git clone https://github.com/DECAfpga/gameboy
cd gameboy
#Do a first make (will finish in error). It will download missing submodules 
make
#when asked just accept default settings with Enter key
#Create file site.mk in DeMiSTify folder 
cd DeMiSTify
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q19)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded). If not specified it will compile for all targets.
cd ..
make BOARD=deca
```

### Pinout connections:

![pinout_deca](pinout_deca.png)



### Follows original README.md content:



