#============================================================
# CLOCK
#============================================================

set_location_assignment PIN_M9 -to ADC_CLK_10
set_location_assignment PIN_M8 -to MAX10_CLK1_50
set_location_assignment PIN_P11 -to MAX10_CLK2_50

#============================================================
# SDRAM
#============================================================

set_location_assignment PIN_Y17 -to DRAM_ADDR[0]
set_location_assignment PIN_W14 -to DRAM_ADDR[1]
set_location_assignment PIN_U15 -to DRAM_ADDR[2]
set_location_assignment PIN_R13 -to DRAM_ADDR[3]
set_location_assignment PIN_Y13 -to DRAM_ADDR[4]
set_location_assignment PIN_AB11 -to DRAM_ADDR[5]
set_location_assignment PIN_AA11 -to DRAM_ADDR[6]
set_location_assignment PIN_AB12 -to DRAM_ADDR[7]
set_location_assignment PIN_AA12 -to DRAM_ADDR[8]
set_location_assignment PIN_AB13 -to DRAM_ADDR[9]
set_location_assignment PIN_V14 -to DRAM_ADDR[10]
set_location_assignment PIN_AA13 -to DRAM_ADDR[11]
set_location_assignment PIN_AB14 -to DRAM_ADDR[12]
set_location_assignment PIN_V11 -to DRAM_BA[0]
set_location_assignment PIN_V13 -to DRAM_BA[1]
set_location_assignment PIN_W12 -to DRAM_CAS_N
set_location_assignment PIN_AA16 -to DRAM_CKE
set_location_assignment PIN_AA14 -to DRAM_CLK
set_location_assignment PIN_V12 -to DRAM_CS_N
set_location_assignment PIN_AA20 -to DRAM_DQ[0]
set_location_assignment PIN_AA19 -to DRAM_DQ[1]
set_location_assignment PIN_AB21 -to DRAM_DQ[2]
set_location_assignment PIN_AB20 -to DRAM_DQ[3]
set_location_assignment PIN_AB19 -to DRAM_DQ[4]
set_location_assignment PIN_Y16 -to DRAM_DQ[5]
set_location_assignment PIN_V16 -to DRAM_DQ[6]
set_location_assignment PIN_AB18 -to DRAM_DQ[7]
set_location_assignment PIN_AA15 -to DRAM_DQ[8]
set_location_assignment PIN_Y14 -to DRAM_DQ[9]
set_location_assignment PIN_W15 -to DRAM_DQ[10]
set_location_assignment PIN_AB15 -to DRAM_DQ[11]
set_location_assignment PIN_W16 -to DRAM_DQ[12]
set_location_assignment PIN_AB16 -to DRAM_DQ[13]
set_location_assignment PIN_V15 -to DRAM_DQ[14]
set_location_assignment PIN_W17 -to DRAM_DQ[15]
set_location_assignment PIN_Y11 -to DRAM_LDQM
set_location_assignment PIN_W11 -to DRAM_RAS_N
set_location_assignment PIN_W13 -to DRAM_UDQM
set_location_assignment PIN_AB10 -to DRAM_WE_N

#============================================================

#============================================================

#============================================================
# KEY
#============================================================
set_location_assignment PIN_H21 -to KEY[0]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to KEY[0]
set_location_assignment PIN_H22 -to KEY[1]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to KEY[1]

#============================================================
# LED
#============================================================
set_location_assignment PIN_C7 -to LED[0]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[0]
set_location_assignment PIN_C8 -to LED[1]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[1]
set_location_assignment PIN_A6 -to LED[2]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[2]
set_location_assignment PIN_B7 -to LED[3]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[3]
set_location_assignment PIN_C4 -to LED[4]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[4]
set_location_assignment PIN_A5 -to LED[5]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[5]
set_location_assignment PIN_B4 -to LED[6]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[6]
set_location_assignment PIN_C5 -to LED[7]
set_instance_assignment -name IO_STANDARD "1.2 V" -to LED[7]


#============================================================
# VGA
#============================================================
set_location_assignment PIN_V10 -to VGA_B[0]
set_location_assignment PIN_AA6 -to VGA_B[1]
set_location_assignment PIN_AB6 -to VGA_B[2]
set_location_assignment PIN_AB7 -to VGA_G[0]
set_location_assignment PIN_R11 -to VGA_G[1]
set_location_assignment PIN_V7 -to VGA_G[2]
set_location_assignment PIN_W7 -to VGA_HS
set_location_assignment PIN_U7 -to VGA_R[0]
set_location_assignment PIN_Y7 -to VGA_R[1]
set_location_assignment PIN_AA7 -to VGA_R[2]
set_location_assignment PIN_W6 -to VGA_VS

# Teclado (GPIO1_D0/1) y ratón (GPIO1_D16/17)
set_location_assignment PIN_Y5 -to PS2_KEYBOARD_CLK
set_location_assignment PIN_Y6 -to PS2_KEYBOARD_DAT
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_KEYBOARD_CLK
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_KEYBOARD_DAT
set_instance_assignment -name IO_STANDARD "2.5 V" -to PS2_KEYBOARD_CLK
set_instance_assignment -name IO_STANDARD "2.5 V" -to PS2_KEYBOARD_DAT

set_location_assignment PIN_W9 -to PS2_MOUSE_CLK
set_location_assignment PIN_W5 -to PS2_MOUSE_DAT
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_MOUSE_CLK
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_MOUSE_DAT
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MOUSE_CLK
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_MOUSE_DAT


# Audio (GPIO1_D18/19)
set_location_assignment PIN_R9 -to SIGMA_L
set_location_assignment PIN_W4 -to SIGMA_R
set_location_assignment PIN_Y19 -to UART_TXD
set_location_assignment PIN_AA17 -to UART_RXD
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SIGMA_L
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SIGMA_R

#Botones y switchs
set_location_assignment PIN_J22 -to btn_n_i[4]
set_location_assignment PIN_J21 -to btn_n_i[3]
set_location_assignment PIN_H22 -to btn_n_i[2]
set_location_assignment PIN_H21 -to btn_n_i[1]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to btn_n_i[1]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to btn_n_i[2]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to btn_n_i[3]
set_instance_assignment -name IO_STANDARD "1.5 V SCHMITT TRIGGER" -to btn_n_i[4]

# MicroSD Card
set_location_assignment PIN_T20 -to sd_sclk_o
set_instance_assignment -name IO_STANDARD "1.5 V" -to sd_sclk_o
set_location_assignment PIN_T21 -to sd_mosi_o
set_instance_assignment -name IO_STANDARD "1.5 V" -to sd_mosi_o
set_location_assignment PIN_U22 -to SD_CMD_DIR
set_instance_assignment -name IO_STANDARD "1.5 V" -to SD_CMD_DIR
set_location_assignment PIN_T22 -to SD_D0_DIR
set_instance_assignment -name IO_STANDARD "1.5 V" -to SD_D0_DIR
set_location_assignment PIN_U21 -to SD_D123_DIR
set_instance_assignment -name IO_STANDARD "1.5 V" -to SD_D123_DIR
set_location_assignment PIN_R18 -to sd_miso_i
set_instance_assignment -name IO_STANDARD "1.5 V" -to sd_miso_i
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sd_miso_i
set_location_assignment PIN_R20 -to sd_cs_n_o
set_instance_assignment -name IO_STANDARD "1.5 V" -to sd_cs_n_o
set_location_assignment PIN_P13 -to SD_SEL
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SD_SEL




#set_location_assignment PIN_R3 -to CLK_I2C_SCL
#set_location_assignment PIN_P3 -to CLK_I2C_SDA


