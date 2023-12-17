set_global_assignment -name SDC_FILE ${boardpath}/sidi/constraints.sdc

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_SIDI=1"
set_global_assignment -name VERILOG_MACRO "USE_AUDIO_IN=1"