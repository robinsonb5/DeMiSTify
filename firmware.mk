all: firmware

EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd:
	git submodule init
	git submodule update

EightThirtyTwo/vbcc/bin/vbcc832: EightThirtyTwo/RTL/eightthirtytwo_cpu.vhd
	make -C EightThirtyTwo

EightThirtyTwo/lib832/lib832.a: EightThirtyTwo/vbcc/bin/vbcc832
	make -C EightThirtyTwo/lib832

firmware: EightThirtyTwo/vbcc/bin/vbcc832 EightThirtyTwo/lib832/lib832.a
	for PROJECT in ${PROJECTS}; do \
		make -C $$PROJECT/Firmware/; \
	done

