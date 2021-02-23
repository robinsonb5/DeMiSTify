create_clock -name {MAX10_CLK1_50} -period 20.000 -waveform {0.000 10.000} { MAX10_CLK1_50 }

derive_pll_clocks -create_base_clocks

create_generated_clock -name sdram_clock -source [get_pins {U00|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name sysclk -source [get_pins {U00|altpll_component|auto_generated|pll1|clk[1]}] 

# SDRAM delays and multicycles

set_input_delay -clock { sdram_clock } -min 3.5 [get_ports *DRAM_DQ*]
set_input_delay -clock { sdram_clock } -max 6.5 [get_ports *DRAM_DQ*]

set_output_delay -clock { sdram_clock } -min -0.5 [get_ports DRAM_*]
set_output_delay -clock { sdram_clock } -max -1.5 [get_ports DRAM_*]

set_multicycle_path -from [get_clocks {sdram_clock}] -to [get_clocks {U00|altpll_component|auto_generated|pll1|clk[1]}] -setup -end 2


# I/O delays for non-critical ports

set_input_delay -clock { sysclk } .5 [get_ports {GPIO[*]}]
set_input_delay -clock { sysclk } .5 [get_ports {ARDUINO_IO[*]}]
set_input_delay -clock { sysclk } .5 [get_ports {KEY[*]}]

set_output_delay -clock { sysclk } .5 [get_ports {GPIO[*]}]
set_output_delay -clock { sysclk } .5 [get_ports {ARDUINO_IO[*]}]
set_output_delay -clock { sysclk } .5 [get_ports {VGA_*}]


# Multicycles for multiplier - is this valid?
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_sgn} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_d1[*]} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_d2[*]} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -setup -end 2
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_sgn} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_d1[*]} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2
set_multicycle_path -from {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|alu_d2[*]} -to {VirtualToplevel:virtualtoplevel|eightthirtytwo_cpu:cpu|eightthirtytwo_alu:alu|mulresult[*]} -hold -end 2

# create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tdi
set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tms
set_output_delay -clock altera_reserved_tck 3 altera_reserved_tdo

