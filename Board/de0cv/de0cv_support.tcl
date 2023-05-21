set_global_assignment -name SDC_FILE ${boardpath}/de0cv/constraints.sdc
set_global_assignment -name VHDL_FILE ${boardpath}/de0cv/audio/audio_i2s.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/de0cv/tools/clock_frec_counter.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/de0cv/tools/seven_seg_driver.vhd

set_global_assignment -name VERILOG_MACRO "SDRAM_WINBOND=0"
set_global_assignment -name VERILOG_MACRO "SDRAM_ROWBITS=13"
set_global_assignment -name VERILOG_MACRO "SDRAM_COLBITS=10"
set_global_assignment -name VERILOG_MACRO "SDRAM_CL=3"
set_global_assignment -name VERILOG_MACRO "SDRAM_tCKminCL2=10000"
set_global_assignment -name VERILOG_MACRO "SDRAM_tRC=66000"
set_global_assignment -name VERILOG_MACRO "SDRAM_tWR=2"
set_global_assignment -name VERILOG_MACRO "SDRAM_tRP=18000"
set_global_assignment -name VERILOG_MACRO "SDRAM_RISKCONTENTION=0"

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_de0cv=1"
