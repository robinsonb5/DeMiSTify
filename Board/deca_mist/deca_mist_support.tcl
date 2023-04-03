set_global_assignment -name SDC_FILE  ${boardpath}/deca_mist/constraints.sdc
set_global_assignment -name VERILOG_FILE ${boardpath}/deca_mist/audio/AUDIO_SPI_CTL_RD.v
set_global_assignment -name VERILOG_FILE ${boardpath}/deca_mist/audio/SPI_RAM.v
set_global_assignment -name VHDL_FILE ${boardpath}/deca_mist/audio/audio_i2s.vhd
set_global_assignment -name VERILOG_FILE ${boardpath}/deca_mist/hdmi/I2C_Controller.v
set_global_assignment -name VERILOG_FILE ${boardpath}/deca_mist/hdmi/I2C_HDMI_Config.v

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_HDMI=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_DECA_MIST=1"

