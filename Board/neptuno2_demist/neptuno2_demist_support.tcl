#set_global_assignment -name SDC_FILE ${boardpath}/neptuno2_demist/constraints.sdc

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_NEPTUNO2_DEMIST=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"

set_global_assignment -name VERILOG_MACRO "VGA_8BIT=1"
#set_global_assignment -name VERILOG_MACRO "USE_HDMI=1"
#set_global_assignment -name VERILOG_MACRO "USE_CLOCK_50=1"
#set_global_assignment -name VERILOG_MACRO "NO_DIRECT_UPLOAD=1"
set_global_assignment -name VERILOG_MACRO "I2S_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "USE_AUDIO_IN=1"
#set_global_assignment -name VERILOG_MACRO "BIG_OSD=1"
