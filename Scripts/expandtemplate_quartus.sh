#!/bin/bash

cat $1 | while read a; do
	b=${a,,}
	if [ "${b: -4}" = ".rom" ]; then
		echo set_global_assignment -name VHDL_FILE ../../${a%.rom}_byte.vhd
	fi
	if [ "${b: -4}" = ".vhd" ]; then
		echo set_global_assignment -name VHDL_FILE ../../${a}
	fi
	if [ "${b: -4}" = ".qip" ]; then
		echo set_global_assignment -name QIP_FILE ../../${a}
	fi
	if [ "${b: -2}" = ".v" ]; then
		echo set_global_assignment -name VERILOG_FILE ../../${a}
	fi
	if [ "${b: -3}" = ".sv" ]; then
		echo set_global_assignment -name SYSTEMVERILOG_FILE ../../${a}
	fi
done

