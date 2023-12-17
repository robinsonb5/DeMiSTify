set_global_assignment -name SDC_FILE ${boardpath}/poseidon-10CL055/constraints.sdc
# Audio and Jostick support

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_POSEIDON_10CL055=1"
set_global_assignment -name VERILOG_MACRO "I2S_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "USE_AUDIO_IN=1"
set_global_assignment -name VERILOG_MACRO "USE_CLOCK_50=1"
set_global_assignment -name VERILOG_MACRO "BIG_OSD=1"
