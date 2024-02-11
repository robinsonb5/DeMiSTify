set_global_assignment -name SDC_FILE ${boardpath}/neptuno_legacy/constraints.sdc
# Audio and Jostick support
set_global_assignment -name VHDL_FILE ${boardpath}/neptuno_legacy/audio_i2s.vhd
set_global_assignment -name VERILOG_FILE ${boardpath}/neptuno_legacy/joydecoder.v

set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_NEPTUNO=1"
