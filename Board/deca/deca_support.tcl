set_global_assignment -name SDC_FILE  ${boardpath}/deca/constraints.sdc
set_global_assignment -name VERILOG_FILE audio/SPI_RAM.v
set_global_assignment -name VERILOG_FILE audio/AUDIO_SPI_CTL_RD.v
set_global_assignment -name VHDL_FILE audio/i2s_transmitter.vhd

