create_clock -name {clk_50} -period 20.000 -waveform {0.000 10.000} { MAX10_CLK1_50 }
create_clock -name {spiclk}  -period 41.666 -waveform { 20.8 41.666 } [get_ports {SPI_SCLK_DABD}]

set mist 1

set hostclk { clk_50 }
set supportclk { clk_50 }

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

# Create a clock for i2s, audio-spi, i2c-hdmi
create_clock -name i2sclk -period 20.000 {audio_top:audio_i2s|tcount[4]}
create_clock -name audio-spi-clk-1m -period 2480.000  {AUDIO_SPI_CTL_RD:AUDIO_SPI_CTL_RD_inst|CLK_1M}
create_clock -name audio-spi-rom-ck -period 2480.000  {AUDIO_SPI_CTL_RD:AUDIO_SPI_CTL_RD_inst|ROM_CK}
#create_clock -name i2c-ctrl-clk -period 100000.000  {I2C_HDMI_Config:I2C_HDMI_Config_inst|mI2C_CTRL_CLK}


# Set pin definitions for downstream constraints
set RAM_CLK DRAM_CLK
set RAM_OUT {DRAM_DQ* DRAM_ADDR* DRAM_BA* DRAM_RAS_N DRAM_CAS_N DRAM_WE_N DRAM_*DQM DRAM_CS_N DRAM_CKE}
set RAM_IN {DRAM_D*}

set VGA_OUT {VGA_R[*] VGA_G[*] VGA_B[*] VGA_HS VGA_VS}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {LED[*] SIGMA_* PS2_* JOYX_SEL_O AUDIO* I2S_* HDMI_I2C* HDMI_LRCLK HDMI_MCLK HDMI_SCLK HDMI_I2S[*] UART_TXD SD_CS_N_O SD_MOSI_O SD_SCLK_O HDMI_TX*}
set FALSE_IN  {KEY[*] SW[*] PS2_* JOY1* AUDIO* HDMI_I2C* HDMI_LRCLK HDMI_MCLK HDMI_SCLK HDMI_I2S[*] EAR UART_RXD SD_MISO_I HDMI_TX_INT}
#the HDMI signals are probably fast enough to worth constraining properly at some point

set_input_delay -clock spiclk -min 0.5 { SPI_MOSI SPI_CS1 SPI_CS2 SPI_CS0_CLKBD }
set_input_delay -clock spiclk -max 0.5 { SPI_MOSI SPI_CS1 SPI_CS2 SPI_CS0_CLKBD }
set_output_delay -clock spiclk -min 0.5 { SPI_MISO_WSBD }
set_output_delay -clock spiclk -max 0.5 { SPI_MISO_WSBD }
set_false_path -to DRAM_CLK

set topmodule guest|
