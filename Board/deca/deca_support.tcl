set_global_assignment -name SDC_FILE  ${boardpath}/deca/constraints.sdc
# DECA audio support
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/SPI_RAM.v
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/AUDIO_SPI_CTL_RD.v
set_global_assignment -name VHDL_FILE    ${boardpath}/deca/i2s_transmitter.vhd
