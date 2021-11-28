set_global_assignment -name SDC_FILE  ${boardpath}/atlas_cyc/constraints.sdc

set_global_assignment -name QIP_FILE pll2/pll2.qip
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/audio/audio_i2s.vhd

# HDMI NTSC output (MSX)
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/serializer_generic.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/hdmidelay.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/hdmi_out_altera.vhd
set_global_assignment -name VERILOG_FILE ${boardpath}/atlas_cyc/hdmi2/hdmidataencoder.v
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/hdmi.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/encoder.vhd
set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi2/altddio_out1.vhd

# HDMI PAL output (Atari)
#set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi/scandoubler_hdmi.vhdl
#set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi/scandouble_ram_infer_9.vhdl
#set_global_assignment -name VERILOG_FILE ${boardpath}/atlas_cyc/hdmi/hdmidataencoder.v
#set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi/hdmi.vhd
#set_global_assignment -name VHDL_FILE ${boardpath}/atlas_cyc/hdmi/encoder.vhd
#set_global_assignment -name QIP_FILE  ${boardpath}/atlas_cyc/hdmi/altddio_out1.qip

# VERILOG_MACRO
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_PARALLEL_AUDIO=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_HDMI=1"
set_global_assignment -name VERILOG_MACRO "DEMISTIFY_ATLAS_CYC=1"

