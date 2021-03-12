OVERRIDES=
DEMISTIFYPATH=

all: firmware

$(DEMISTIFYPATH)/EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd:
	cd $(DEMISTIFYPATH) \
	git submodule init \ 
	git submodule update

$(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832: $(DEMISTIFYPATH)/EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd
	make -C $(DEMISTIFYPATH)/EightThirtyTwo

$(DEMISTIFYPATH)/EightThirtyTwo/lib832/lib832.a: $(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832
	make -C EightThirtyTwo/lib832

firmware: $(DEMISTIFYPATH)/EightThirtyTwo/vbcc/bin/vbcc832 $(DEMISTIFYPATH)/EightThirtyTwo/lib832/lib832.a $(DEMISTIFYPATH)/firmware/controller_ROM_byte.vhd

$(DEMISTIFYPATH)/firmware/controller_ROM_byte.vhd:
	make -C $(DEMISTIFYPATH)/firmware OVERRIDES=$(OVERRIDES)

