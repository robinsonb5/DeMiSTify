set_global_assignment -name SDC_FILE  ${boardpath}deca/constraints.sdc
set_global_assignment -name VERILOG_FILE rtl_deca/audio/AUDIO_SPI_CTL_RD.v
set_global_assignment -name VERILOG_FILE rtl_deca/audio/SPI_RAM.v
set_global_assignment -name VHDL_FILE rtl_deca/audio/i2s_transmitter.vhd
set_global_assignment -name VERILOG_FILE rtl_deca/hdmi/I2C_Controller.v
set_global_assignment -name VERILOG_FILE rtl_deca/hdmi/I2C_HDMI_Config.v
#set_global_assignment -name QIP_FILE rtl_deca/pll/pll2.qip
