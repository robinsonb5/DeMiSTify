create_clock -name {clk_50} -period 20.000 -waveform {0.000 10.000} {CLOCK_50}
create_generated_clock -name spiclk -source [get_ports {CLOCK_50}] -divide_by 16 [get_registers {substitute_mcu:controller|spi_controller:spi|sck}]

set hostclk { clk_50 }
set supportclk { clk_50 }

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

# Set pin definitions for downstream constraints
set RAM_CLK {SDRAM_CLK}
set RAM_OUT {SDRAM_DQ* SDRAM_A* SDRAM_BA* SDRAM_n* SDRAM_DQM* SDRAM_CKE}
set RAM_IN  {SDRAM_DQ[*]}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED* UART_TX PS2_* AUDIO_* I2S_* JOY_CLK JOY_LOAD JOY_SEL SD_SCK SD_CS SD_MOSI}
set FALSE_IN  {UART_RX PS2_* AUDIO_IN JOY_DATA SD_MISO}

set topmodule guest|
