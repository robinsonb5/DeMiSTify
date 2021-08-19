# Pin & Location Assignments
# ==========================

set_location_assignment PIN_T2 -to clock_50_i

set_location_assignment PIN_V2 -to DRAM_ADDR[0]
set_location_assignment PIN_V1 -to DRAM_ADDR[1]
set_location_assignment PIN_U2 -to DRAM_ADDR[2]
set_location_assignment PIN_U1 -to DRAM_ADDR[3]
set_location_assignment PIN_V3 -to DRAM_ADDR[4]
set_location_assignment PIN_V4 -to DRAM_ADDR[5]
set_location_assignment PIN_Y2 -to DRAM_ADDR[6]
set_location_assignment PIN_AA1 -to DRAM_ADDR[7]
set_location_assignment PIN_Y3 -to DRAM_ADDR[8]
set_location_assignment PIN_V5 -to DRAM_ADDR[9]
set_location_assignment PIN_W1 -to DRAM_ADDR[10]
set_location_assignment PIN_Y4 -to DRAM_ADDR[11]
set_location_assignment PIN_V6 -to DRAM_ADDR[12]
set_location_assignment PIN_W2 -to DRAM_BA[1]
set_location_assignment PIN_Y1 -to DRAM_BA[0]
set_location_assignment PIN_AA4 -to DRAM_CAS_N
set_location_assignment PIN_W6 -to DRAM_CKE
set_location_assignment PIN_Y6 -to DRAM_CLK
set_location_assignment PIN_AA3 -to DRAM_CS_N
set_location_assignment PIN_V11 -to DRAM_DQ[15]
set_location_assignment PIN_W10 -to DRAM_DQ[14]
set_location_assignment PIN_Y10 -to DRAM_DQ[13]
set_location_assignment PIN_V10 -to DRAM_DQ[12]
set_location_assignment PIN_V9 -to DRAM_DQ[11]
set_location_assignment PIN_Y8 -to DRAM_DQ[10]
set_location_assignment PIN_W8 -to DRAM_DQ[9]
set_location_assignment PIN_Y7 -to DRAM_DQ[8]
set_location_assignment PIN_AB5 -to DRAM_DQ[7]
set_location_assignment PIN_AA7 -to DRAM_DQ[6]
set_location_assignment PIN_AB7 -to DRAM_DQ[5]
set_location_assignment PIN_AA8 -to DRAM_DQ[4]
set_location_assignment PIN_AB8 -to DRAM_DQ[3]
set_location_assignment PIN_AA9 -to DRAM_DQ[2]
set_location_assignment PIN_AB9 -to DRAM_DQ[1]
set_location_assignment PIN_AA10 -to DRAM_DQ[0]
set_location_assignment PIN_AA5 -to DRAM_LDQM
set_location_assignment PIN_AB3 -to DRAM_RAS_N
set_location_assignment PIN_W7 -to DRAM_UDQM
set_location_assignment PIN_AB4 -to DRAM_WE_N

#NEPTUNO SRAM#
set_location_assignment PIN_U21 -to SRAM_A[19]
set_location_assignment PIN_A17 -to SRAM_A[18]
set_location_assignment PIN_B18 -to SRAM_A[17]
set_location_assignment PIN_A18 -to SRAM_A[16]
set_location_assignment PIN_A19 -to SRAM_A[15]
set_location_assignment PIN_A5 -to SRAM_A[14]
set_location_assignment PIN_A15 -to SRAM_A[13]
set_location_assignment PIN_B6 -to SRAM_A[12]
set_location_assignment PIN_A14 -to SRAM_A[11]
set_location_assignment PIN_A8 -to SRAM_A[10]
set_location_assignment PIN_B13 -to SRAM_A[9]
set_location_assignment PIN_B10 -to SRAM_A[8]
set_location_assignment PIN_B14 -to SRAM_A[7]
set_location_assignment PIN_B15 -to SRAM_A[6]
set_location_assignment PIN_B9 -to SRAM_A[5]
set_location_assignment PIN_A7 -to SRAM_A[4]
set_location_assignment PIN_A6 -to SRAM_A[3]
set_location_assignment PIN_B5 -to SRAM_A[2]
set_location_assignment PIN_C3 -to SRAM_A[1]
set_location_assignment PIN_A4 -to SRAM_A[0]

set_location_assignment PIN_F21 -to SRAM_Q[15]
set_location_assignment PIN_J22 -to SRAM_Q[14]
set_location_assignment PIN_L21 -to SRAM_Q[13]
set_location_assignment PIN_M22 -to SRAM_Q[12]
set_location_assignment PIN_L22 -to SRAM_Q[11]
set_location_assignment PIN_H22 -to SRAM_Q[10]
set_location_assignment PIN_H21 -to SRAM_Q[9]
set_location_assignment PIN_F22 -to SRAM_Q[8]
set_location_assignment PIN_B17 -to SRAM_Q[7]
set_location_assignment PIN_A16 -to SRAM_Q[6]
set_location_assignment PIN_B16 -to SRAM_Q[5]
set_location_assignment PIN_C4 -to SRAM_Q[4]
set_location_assignment PIN_A9 -to SRAM_Q[3]
set_location_assignment PIN_B8 -to SRAM_Q[2]
set_location_assignment PIN_A13 -to SRAM_Q[1]
set_location_assignment PIN_B7 -to SRAM_Q[0]

set_location_assignment PIN_A10 -to SRAM_WE
set_location_assignment PIN_AA20 -to SRAM_OE
set_location_assignment PIN_R2 -to SRAM_UB
set_location_assignment PIN_AA16 -to SRAM_LB

#NEPTUNO VIDEO#
set_location_assignment PIN_F1 -to VGA_R[4]
set_location_assignment PIN_D2 -to VGA_R[3]
set_location_assignment PIN_E1 -to VGA_R[2]
set_location_assignment PIN_C2 -to VGA_R[1]
set_location_assignment PIN_C1 -to VGA_R[0]
#set_location_assignment PIN_B1 -to VGA_R[0]
set_location_assignment PIN_P2 -to VGA_G[4]
set_location_assignment PIN_N2 -to VGA_G[3]
set_location_assignment PIN_M2 -to VGA_G[2]
set_location_assignment PIN_J2 -to VGA_G[1]
set_location_assignment PIN_H2 -to VGA_G[0]
#set_location_assignment PIN_F2 -to VGA_G[0]
set_location_assignment PIN_R1 -to VGA_B[4]
set_location_assignment PIN_P1 -to VGA_B[3]
set_location_assignment PIN_N1 -to VGA_B[2]
set_location_assignment PIN_M1 -to VGA_B[1]
set_location_assignment PIN_J1 -to VGA_B[0]
#set_location_assignment PIN_H1 -to VGA_B[0]
set_location_assignment PIN_B3 -to VGA_HS
set_location_assignment PIN_B2 -to VGA_VS

#NEPTUNO TECLADO Y RATÓN#
set_location_assignment PIN_N19 -to PS2_KEYBOARD_CLK
set_location_assignment PIN_N20 -to PS2_KEYBOARD_DAT
set_location_assignment PIN_C21 -to PS2_MOUSE_CLK
set_location_assignment PIN_B21 -to PS2_MOUSE_DAT
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_KEYBOARD_CLK
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_KEYBOARD_DAT
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_MOUSE_CLK
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to PS2_MOUSE_DAT



#NEPTUNO#
set_location_assignment PIN_AA18 -to joy_p7_o
set_location_assignment PIN_A20 -to joy_clock_o
set_location_assignment PIN_B19 -to joy_Q_i
set_location_assignment PIN_B20 -to joy_load_o

#NEPTUNO#
set_location_assignment PIN_A3 -to SIGMA_L
set_location_assignment PIN_B4 -to SIGMA_R
#set_location_assignment PIN_N5 -to mic_o -- No asignado
set_location_assignment PIN_AA13 -to UART_RXD

#NEPTUNO SD/MMC#
set_location_assignment PIN_D22 -to sd_cs_n_o
set_location_assignment PIN_E21 -to sd_miso_i
set_location_assignment PIN_D21 -to sd_mosi_o
set_location_assignment PIN_E22 -to sd_sclk_o

#NEPTUNO CONEXION STM32#
set_location_assignment PIN_Y21 -to stm_rst_o
set_location_assignment PIN_J21 -to stm_tx_i
set_location_assignment PIN_K21 -to stm_rx_o
set_location_assignment PIN_N22 -to SPI_SS2
set_location_assignment PIN_N21 -to SPI_SCK
set_location_assignment PIN_M21 -to SPI_DO
set_location_assignment PIN_K22 -to SPI_DI
#set_location_assignment PIN_R6 -to SPI_nWAIT  -- No asignado

#NEPTUNO DAC#
#set_location_assignment PIN_M20 -to SCLK
#set_location_assignment PIN_AB14 -to LRCLK
#set_location_assignment PIN_AA15 -to SDIN

set_location_assignment PIN_E4 -to LED

set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to sd_miso_i