set_global_assignment -name VHDL_FILE ${boardpath}/chameleon64/chameleon64_top.vhd
set_global_assignment -name QIP_FILE ${boardpath}/chameleon-modules/chameleonv1.qip
set_global_assignment -name SDC_FILE ${boardpath}/chameleon64/constraints.sdc
set_global_assignment -name VHDL_FILE ${boardpath}/Board/chameleon64/gen_reset.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/RTL/Video/video_vga_dither.vhd
set_global_assignment -name VERILOG_FILE ${boardpath}/RTL/Sound/hybrid_pwm_sd.v

