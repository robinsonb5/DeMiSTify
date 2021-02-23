set_global_assignment -name VHDL_FILE ${projectpath}/toplevels/chameleon64_top.vhd
set_global_assignment -name QIP_FILE ${boardpath}/chameleon-modules/chameleonv1.qip
set_global_assignment -name SDC_FILE ${boardpath}/chameleon64/constraints.sdc
set_global_assignment -name VHDL_FILE ${boardpath}/chameleon64/gen_reset.vhd

