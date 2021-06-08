OVERRIDES=
DEMISTIFYPATH=
# Sizes of the two ROM parts - 8k + 4k = 12k by default
ROMSIZE1=8192
ROMSIZE2=4096


all: firmware

$(DEMISTIFYPATH)/EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd:
	cd $(DEMISTIFYPATH) \
	git submodule init \ 
	git submodule update

$(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832: $(DEMISTIFYPATH)/EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd
	make -C $(DEMISTIFYPATH)/EightThirtyTwo

$(DEMISTIFYPATH)/EightThirtyTwo/lib832/lib832.a: $(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832
	make -C EightThirtyTwo/lib832

.phony: firmware
firmware: $(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832 $(DEMISTIFYPATH)/EightThirtyTwo/lib832/lib832.a $(DEMISTIFYPATH)/firmware/controller_ROM_byte.vhd

$(DEMISTIFYPATH)/firmware/controller_ROM_byte.vhd:
	make -C $(DEMISTIFYPATH)/firmware OVERRIDES=$(OVERRIDES) ROMSIZE1=$(ROMSIZE1) ROMSIZE2=$(ROMSIZE2)

