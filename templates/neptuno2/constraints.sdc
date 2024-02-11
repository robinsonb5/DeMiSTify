#create_clock -name clock50_0 -period 20 [get_ports {CLOCK_50[0]}]
create_clock -name {clk_50} -period 20 [get_ports {CLOCK_50}]
create_clock -name spiclk  -period 41.666 -waveform { 20.8 41.666 } [get_ports {SPI_SCK}]

set mist 1

set hostclk    { clk_50 }
set supportclk { clk_50 }

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

# Set pin definitions for downstream constraints
set RAM_CLK {SDRAM_CLK}
set RAM_OUT {SDRAM_DQ* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_DQM* SDRAM_CKE}
set RAM_IN  {SDRAM_DQ[*]}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

set FALSE_OUT {AUDIO_L AUDIO_R I2S_* LED* UART_TX}
set FALSE_IN {UART_RX AUDIO_IN KEY*}

# Constraints for board-specific signals
set_input_delay  -clock spiclk -min 0.5 { SPI_DO CONF_DATA0 SPI_DI SPI_SS2 SPI_SS3 }
set_input_delay  -clock spiclk -max 0.5 { SPI_DO CONF_DATA0 SPI_DI SPI_SS2 SPI_SS3 }
set_output_delay -clock spiclk -min 0.5 { SPI_DO }
set_output_delay -clock spiclk -max 0.5 { SPI_DO }
#set_false_path -to SDRAM_CLK

set topmodule guest|
