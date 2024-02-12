# Pin & Location Assignments
# ==========================

set_location_assignment PIN_T2 -to CLOCK_50

set_location_assignment PIN_E4 -to LED

#NEPTUNO VIDEO#
set_location_assignment PIN_F1 -to VGA_R[5]
set_location_assignment PIN_D2 -to VGA_R[4]
set_location_assignment PIN_E1 -to VGA_R[3]
set_location_assignment PIN_C2 -to VGA_R[2]
set_location_assignment PIN_C1 -to VGA_R[1]
set_location_assignment PIN_B1 -to VGA_R[0]
set_location_assignment PIN_P2 -to VGA_G[5]
set_location_assignment PIN_N2 -to VGA_G[4]
set_location_assignment PIN_M2 -to VGA_G[3]
set_location_assignment PIN_J2 -to VGA_G[2]
set_location_assignment PIN_H2 -to VGA_G[1]
set_location_assignment PIN_F2 -to VGA_G[0]
set_location_assignment PIN_R1 -to VGA_B[5]
set_location_assignment PIN_P1 -to VGA_B[4]
set_location_assignment PIN_N1 -to VGA_B[3]
set_location_assignment PIN_M1 -to VGA_B[2]
set_location_assignment PIN_J1 -to VGA_B[1]
set_location_assignment PIN_H1 -to VGA_B[0]
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

#NEPTUNO JOYSTICKS#
set_location_assignment PIN_AA18 -to JOYP7_O
set_location_assignment PIN_A20 -to JOY_CLK
set_location_assignment PIN_B19 -to JOY_DATA
set_location_assignment PIN_B20 -to JOY_LOAD

#NEPTUNO AUDIO#
set_location_assignment PIN_A3 -to AUDIO_L
set_location_assignment PIN_B4 -to AUDIO_R
set_location_assignment PIN_AA13 -to AUDIO_IN

## I2S audio
set_location_assignment PIN_M20  -to I2S_BCK
set_location_assignment PIN_AA15 -to I2S_DATA 
set_location_assignment PIN_AB14 -to I2S_LRCK
## Neptuno I2C
set_location_assignment PIN_R22 -to I2C_SCL
set_location_assignment PIN_V21 -to I2C_SDA 

#NEPTUNO SD/MMC#
set_location_assignment PIN_D22 -to SD_CS
set_location_assignment PIN_E21 -to SD_MISO
set_location_assignment PIN_D21 -to SD_MOSI
set_location_assignment PIN_E22 -to SD_SCK
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to SD_MISO

#NEPTUNO SDRAM#
set_location_assignment PIN_V2 -to SDRAM_A[0]
set_location_assignment PIN_V1 -to SDRAM_A[1]
set_location_assignment PIN_U2 -to SDRAM_A[2]
set_location_assignment PIN_U1 -to SDRAM_A[3]
set_location_assignment PIN_V3 -to SDRAM_A[4]
set_location_assignment PIN_V4 -to SDRAM_A[5]
set_location_assignment PIN_Y2 -to SDRAM_A[6]
set_location_assignment PIN_AA1 -to SDRAM_A[7]
set_location_assignment PIN_Y3 -to SDRAM_A[8]
set_location_assignment PIN_V5 -to SDRAM_A[9]
set_location_assignment PIN_W1 -to SDRAM_A[10]
set_location_assignment PIN_Y4 -to SDRAM_A[11]
set_location_assignment PIN_V6 -to SDRAM_A[12]
set_location_assignment PIN_W2 -to SDRAM_BA[1]
set_location_assignment PIN_Y1 -to SDRAM_BA[0]
set_location_assignment PIN_V11 -to SDRAM_DQ[15]
set_location_assignment PIN_W10 -to SDRAM_DQ[14]
set_location_assignment PIN_Y10 -to SDRAM_DQ[13]
set_location_assignment PIN_V10 -to SDRAM_DQ[12]
set_location_assignment PIN_V9 -to SDRAM_DQ[11]
set_location_assignment PIN_Y8 -to SDRAM_DQ[10]
set_location_assignment PIN_W8 -to SDRAM_DQ[9]
set_location_assignment PIN_Y7 -to SDRAM_DQ[8]
set_location_assignment PIN_AB5 -to SDRAM_DQ[7]
set_location_assignment PIN_AA7 -to SDRAM_DQ[6]
set_location_assignment PIN_AB7 -to SDRAM_DQ[5]
set_location_assignment PIN_AA8 -to SDRAM_DQ[4]
set_location_assignment PIN_AB8 -to SDRAM_DQ[3]
set_location_assignment PIN_AA9 -to SDRAM_DQ[2]
set_location_assignment PIN_AB9 -to SDRAM_DQ[1]
set_location_assignment PIN_AA10 -to SDRAM_DQ[0]
set_location_assignment PIN_AA5 -to SDRAM_DQML
set_location_assignment PIN_W7 -to SDRAM_DQMH
set_location_assignment PIN_AB4 -to SDRAM_nWE
set_location_assignment PIN_AB3 -to SDRAM_nRAS
set_location_assignment PIN_AA4 -to SDRAM_nCAS
set_location_assignment PIN_W6 -to SDRAM_CKE
set_location_assignment PIN_Y6 -to SDRAM_CLK
set_location_assignment PIN_AA3 -to SDRAM_nCS
