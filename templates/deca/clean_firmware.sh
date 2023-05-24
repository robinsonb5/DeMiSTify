#clean firmware folder and leave just the needed files to sintesize the core
#
#Controller.map and controller.bin aren't needed (the mapfile tells you which functions are at which locations in memory, and if debugging is enabled then the .bin file can be uploaded over JTAG to allow updating the firmware without having to recompile the core.)
#find ../firmware/ -type f \( ! -iname "config.h" ! -iname "overrides.c" ! -iname "*.vhd" ! -iname "controller.*" \) -delete
find ../firmware/ -type f \( ! -iname "config.h" ! -iname "*.c" ! -iname "*.vhd" \) -delete

