
create_clock -name "clk8" -period 125.000ns [get_ports {clk8}] -waveform {0.000 62.500}
derive_pll_clocks -create_base_clocks


set hostclk {clocks|altpll_component|auto_generated|pll1|clk[1]}
set supportclk {clocks|altpll_component|auto_generated|pll1|clk[0]}

create_generated_clock -name spiclk -source [get_pins ${hostclk}] -divide_by 4 [get_registers {substitute_mcu:controller|spi_controller:spi|sck}]


# Set pin definitions for downstream constraints

set RAM_CLK ram_clk
set RAM_OUT {ram_d* ram_a* ram_ba* ram_ras_n ram_cas_n ram_we_n ram_*dqm}
set RAM_IN {ram_d*}

set VGA_OUT {red* grn* blu* hsync_n vsync_n}

set FALSE_OUT {sigma_l sigma_r}

set_false_path -to [get_ports {RAM_CLK}]

# Constraints for board-specific signals

set_input_delay 0.5 -clock [get_clocks ${hostclk}] [get_ports { mux_q* spi_miso usart_cts}]

set_input_delay 0.5 -clock [get_clocks ${supportclk}] [get_ports {romlh_n ioef_n dotclock_n}]

set_output_delay 0.5 -clock [get_clocks ${hostclk}] [get_ports { mux_d* }]

set_output_delay 0.5 -clock [get_clocks ${supportclk}] [get_ports { mux_clk mux[*] }]


#**************************************************************
# Set Clock Uncertainty
#**************************************************************

derive_clock_uncertainty;

#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from {freeze_n} -to {*}
set_false_path -from {phi2_n*} -to {*}
