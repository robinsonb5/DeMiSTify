
# Clock constraints

create_clock -name "clk8" -period 125.000ns [get_ports {clk8}] -waveform {0.000 62.500}


# Automatically constrain PLL and other generated clocks
derive_pll_clocks -create_base_clocks

# create_generated_clock -name spi_clk -source [get_nets {inst|altpll_component|auto_generated|wire_pll1_clk[1]}] -divide_by 2 [get_nets {inst3|sck}]

create_generated_clock -name sdram_clk_pin -source [get_pins {mypll|altpll_component|auto_generated|pll1|clk[0]}] [get_ports {sdram_clk}]
create_generated_clock -name sysclk_fast -source [get_pins {mypll|altpll_component|auto_generated|pll1|clk[1]}]


#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty;

#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -clock sdram_clk_pin -max [expr 5.8] [get_ports *sd_data*]
set_input_delay -clock sdram_clk_pin -min [expr 3.2] [get_ports *sd_data*]

set_input_delay -clock sysclk_fast -max 1.0 [get_ports mux_q*]
set_input_delay -clock sysclk_fast -min 0.5 [get_ports mux_q*]
set_input_delay -clock sysclk_fast -min 0.5 [get_ports spi_miso]
set_input_delay -clock sysclk_fast -max 1.0 [get_ports spi_miso]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -clock sdram_clk_pin -max [expr 1.5 ] [get_ports *sd_*]
set_output_delay -clock sdram_clk_pin -min [expr -0.8 ] [get_ports *sd_*]

set_output_delay -clock sysclk_fast -max 1.0 [get_ports mux*]
set_output_delay -clock sysclk_fast -min 0.5 [get_ports mux*]

# Multicycles

set_multicycle_path -from [get_clocks {sdram_clk_pin}] -to [get_clocks {mypll|altpll_component|auto_generated|pll1|clk[1]}] -setup -end 2
set_multicycle_path -from [get_clocks {sdram_clk_pin}] -to [get_clocks {mypll|altpll_component|auto_generated|pll1|clk[1]}] -setup -end 2

#set_multicycle_path -from {sd_data[*]} -to {TG68Test:mytg68test|sdram:mysdram|vga_data[*]} -setup -end 2
#set_multicycle_path -from {sd_data[*]} -to {TG68Test:mytg68test|sdram:mysdram|sdata_reg[*]} -setup -end 2

#set_multicycle_path -from {*alu_d1[*]*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
#set_multicycle_path -from {*alu_d2[*]*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
#set_multicycle_path -from {*alu_d1[*]*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2
#set_multicycle_path -from {*alu_d2[*]*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2
#set_multicycle_path -from {*flag_sgn*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
#set_multicycle_path -from {*flag_sgn*} -to {*eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2

#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from {freeze_n} -to {*}
set_false_path -from {phi2_n*} -to {*}
set_false_path -to {red*} -from {*}
set_false_path -to {grn*} -from {*}
set_false_path -to {blu*} -from {*}
set_false_path -to {nHSync} -from {*}
set_false_path -to {nVSync} -from {*}
set_false_path -to {sdram_clk} -from {*}
set_false_path -to {sigma*} -from {*}
