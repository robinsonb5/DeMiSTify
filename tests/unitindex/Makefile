832PATH=../../EightThirtyTwo

CC = gcc
GHDL = ghdl
TIME = 5ms

all: run

.phoney:	run
run: controller_rom_byte.vhd tb.vhd init
	$(GHDL) -a controller_rom_byte.vhd
	$(GHDL) -a tb.vhd
	$(GHDL) -e tb
	$(GHDL) -r tb --ieee-asserts=disable-at-0 --stop-time=$(TIME)
	
controller_rom_byte.vhd: config.h overrides.c
	make -f ../../firmware/Makefile DEMISTIFYPATH=../../ ROMSIZE1=8192 ROMSIZE2=4096

clean:
	make -f ../../firmware/Makefile DEMISTIFYPATH=../../ clean

.pnoney: init
init:
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_aligner.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_aligner_le.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_fetchloadstore.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_decode.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_shifter.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_alu.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_hazard.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_debug.vhd
	$(GHDL) -a $(GHDLFLAGS) $(832PATH)/RTL/eightthirtytwo_cpu.vhd


