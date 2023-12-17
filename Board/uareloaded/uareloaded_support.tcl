set_global_assignment -name SDC_FILE ${boardpath}/uareloaded/constraints.sdc

# Audio support files

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_UARELOADED=1"
set_global_assignment -name VERILOG_MACRO "NO_DIRECT_UPLOAD=1"
set_global_assignment -name VERILOG_MACRO "I2S_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "USE_AUDIO_IN=1"
set_global_assignment -name VERILOG_MACRO "VGA_8BIT=1"
set_global_assignment -name VERILOG_MACRO "USE_CLOCK_50=1"
