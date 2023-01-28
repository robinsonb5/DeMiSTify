
#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50}  -period 20 [get_ports CLOCK_50]
create_clock -name {CLOCK2_50} -period 20 [get_ports CLOCK2_50]
create_clock -name {CLOCK3_50} -period 20 [get_ports CLOCK3_50]
create_clock -name {CLOCK4_50} -period 20 [get_ports CLOCK4_50]
create_generated_clock -name spiclk -source [get_ports {CLOCK_50}] -divide_by 16 [get_registers {substitute_mcu:controller|spi_controller:spi|sck}]

set hostclk { CLOCK_50 }
set supportclk { CLOCK_50 }

set cyclonev 1

derive_pll_clocks -create_base_clocks
derive_clock_uncertainty


# Create a clock for i2s, audio-spi, i2c-hdmi
create_clock -name i2sclk -period 20.000 {audio_top:audio_i2s|tcount[4]}


#**************************************************************
# Set Input Delay
#**************************************************************

#set_input_delay -clock [get_clocks {U90|pll_de0cv_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -max 6.4 [get_ports pMemDat[*]]
#set_input_delay -clock [get_clocks {U90|pll_de0cv_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -min 3.2 [get_ports pMemDat[*]]
#set_output_delay -clock [get_clocks {U90|pll_de0cv_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -max  1.5 [get_ports {pMemDat[*] pMemAdr[*] pMemLdq pMemUdq pMemWe_n pMemCas_n pMemRas_n pMemCs_n}]
#set_output_delay -clock [get_clocks {U90|pll_de0cv_inst|altera_pll_i|general[1].gpll~PLL_OUTPUT_COUNTER|divclk}] -min -0.8 [get_ports {pMemDat[*] pMemAdr[*] pMemLdq pMemUdq pMemWe_n pMemCas_n pMemRas_n pMemCs_n}]

#derive_pll_clocks -create_base_clocks

# Set pin definitions for downstream constraints
set RAM_CLK pMemClk
set RAM_OUT {pMemDat[*] pMemAdr[*] pMemBa[*] pMemRas_n pMemCas_n pMemWe_n pMem*dq pMemCs_n pMemCke}
set RAM_IN {pMemDat[*]}

set VGA_OUT {pDac_VR[*] pDac_VG[*] pDac_VB[*] pVideoHS_n pVideoVS_n}

# non timing-critical pins would be in the "FALSE_IN/OUT" collection (IN inputs, OUT outputs)
set FALSE_OUT {pLed[*] pPs2* p7SegLed*[*] I2S_*}
set FALSE_IN  {pDip[*] pSW[*] pPs2*}
#the HDMI signals are probably fast enough to worth constraining properly at some point

# JTAG constraints for debug interface (if enabled)
#create_clock -name {altera_reserved_tck} -period 40 {altera_reserved_tck}
#set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tdi
#set_input_delay -clock altera_reserved_tck -clock_fall 3 altera_reserved_tms
#set_output_delay -clock altera_reserved_tck 3 altera_reserved_tdo

set topmodule guest|
#set mulresult "Mult0~mult_*_pl"
#set mulresult "Mult0~_*_pl"
set mulresult "Mult0~mult_*_pl[0]"
set DerivedPLLClk "pll_inst|altera_pll_i|general"


