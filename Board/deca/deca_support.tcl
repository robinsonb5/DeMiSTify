set_global_assignment -name SDC_FILE  ${boardpath}/deca/constraints.sdc
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/audio/AUDIO_SPI_CTL_RD.v
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/audio/SPI_RAM.v
#set_global_assignment -name VHDL_FILE ${boardpath}/deca/audio/i2s_transmitter.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/deca/audio/audio_i2s.vhd
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/hdmi/I2C_Controller.v
set_global_assignment -name VERILOG_FILE ${boardpath}/deca/hdmi/I2C_HDMI_Config.v
#set_global_assignment -name QIP_FILE ${boardpath}/deca/pll/pll2.qip
#
​set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"


