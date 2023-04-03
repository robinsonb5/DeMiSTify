#============================================================
# CLOCK
#============================================================
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK2_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK3_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK4_50

set_location_assignment PIN_M9 -to CLOCK_50
set_location_assignment PIN_H13 -to CLOCK2_50
set_location_assignment PIN_E10 -to CLOCK3_50
set_location_assignment PIN_V15 -to CLOCK4_50

#set_global_assignment -name FMAX_REQUIREMENT "21.48 MHz" -section_id pClk21m
#set_global_assignment -name INCLUDE_EXTERNAL_PIN_DELAYS_IN_FMAX_CALCULATIONS OFF -section_id pClk21m

# --------------------------------
# SDRAM 
#  IS42S16320F-7TL
#   64MB 16bitx32M 8k-row
#   143MHz(CL3)
#   133MHz(CL2)
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemAdr[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemBa[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemBa[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemCas_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemCke
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemClk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemCs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemDat[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemLdq
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemRas_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemUdq
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pMemWe_n

set_location_assignment PIN_W8 -to pMemAdr[0]
set_location_assignment PIN_T8 -to pMemAdr[1]
set_location_assignment PIN_U11 -to pMemAdr[2]
set_location_assignment PIN_Y10 -to pMemAdr[3]
set_location_assignment PIN_N6 -to pMemAdr[4]
set_location_assignment PIN_AB10 -to pMemAdr[5]
set_location_assignment PIN_P12 -to pMemAdr[6]
set_location_assignment PIN_P7 -to pMemAdr[7]
set_location_assignment PIN_P8 -to pMemAdr[8]
set_location_assignment PIN_R5 -to pMemAdr[9]
set_location_assignment PIN_U8 -to pMemAdr[10]
set_location_assignment PIN_P6 -to pMemAdr[11]
set_location_assignment PIN_R7 -to pMemAdr[12]
set_location_assignment PIN_T7 -to pMemBa[0]
set_location_assignment PIN_AB7 -to pMemBa[1]
set_location_assignment PIN_V6 -to pMemCas_n
set_location_assignment PIN_R6 -to pMemCke
set_location_assignment PIN_AB11 -to pMemClk
set_location_assignment PIN_U6 -to pMemCs_n
set_location_assignment PIN_Y9 -to pMemDat[0]
set_location_assignment PIN_T10 -to pMemDat[1]
set_location_assignment PIN_R9 -to pMemDat[2]
set_location_assignment PIN_Y11 -to pMemDat[3]
set_location_assignment PIN_R10 -to pMemDat[4]
set_location_assignment PIN_R11 -to pMemDat[5]
set_location_assignment PIN_R12 -to pMemDat[6]
set_location_assignment PIN_AA12 -to pMemDat[7]
set_location_assignment PIN_AA9 -to pMemDat[8]
set_location_assignment PIN_AB8 -to pMemDat[9]
set_location_assignment PIN_AA8 -to pMemDat[10]
set_location_assignment PIN_AA7 -to pMemDat[11]
set_location_assignment PIN_V10 -to pMemDat[12]
set_location_assignment PIN_V9 -to pMemDat[13]
set_location_assignment PIN_U10 -to pMemDat[14]
set_location_assignment PIN_T9 -to pMemDat[15]
set_location_assignment PIN_U12 -to pMemLdq
set_location_assignment PIN_AB6 -to pMemRas_n
set_location_assignment PIN_N8 -to pMemUdq
set_location_assignment PIN_AB5 -to pMemWe_n

# --------------------------------
# GPIO-0
#  40pin(36I/O)
# --------------------------------

#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[0]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[1]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[2]
#set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[35]

#set_location_assignment PIN_N16 -to GPIO_0[0]
#set_location_assignment PIN_B16 -to GPIO_0[1]
#set_location_assignment PIN_M16 -to GPIO_0[2]
#set_location_assignment PIN_C16 -to GPIO_0[3]
set_location_assignment PIN_D17 -to GPIO_0[4]
set_location_assignment PIN_K20 -to GPIO_0[5]
set_location_assignment PIN_K21 -to GPIO_0[6]
set_location_assignment PIN_K22 -to GPIO_0[7]
set_location_assignment PIN_M20 -to GPIO_0[8]
set_location_assignment PIN_M21 -to GPIO_0[9]
set_location_assignment PIN_N21 -to GPIO_0[10]
set_location_assignment PIN_R22 -to GPIO_0[11]
set_location_assignment PIN_R21 -to GPIO_0[12]
set_location_assignment PIN_T22 -to GPIO_0[13]
set_location_assignment PIN_N20 -to GPIO_0[14]
set_location_assignment PIN_N19 -to GPIO_0[15]
set_location_assignment PIN_M22 -to GPIO_0[16]
set_location_assignment PIN_P19 -to GPIO_0[17]
set_location_assignment PIN_L22 -to GPIO_0[18]
set_location_assignment PIN_P17 -to GPIO_0[19]
set_location_assignment PIN_P16 -to GPIO_0[20]
set_location_assignment PIN_M18 -to GPIO_0[21]
set_location_assignment PIN_L18 -to GPIO_0[22]
set_location_assignment PIN_L17 -to GPIO_0[23]
set_location_assignment PIN_L19 -to GPIO_0[24]
set_location_assignment PIN_K17 -to GPIO_0[25]
set_location_assignment PIN_K19 -to GPIO_0[26]
set_location_assignment PIN_P18 -to GPIO_0[27]
set_location_assignment PIN_R15 -to GPIO_0[28]
set_location_assignment PIN_R17 -to GPIO_0[29]
set_location_assignment PIN_R16 -to GPIO_0[30]
set_location_assignment PIN_T20 -to GPIO_0[31]
set_location_assignment PIN_T19 -to GPIO_0[32]
set_location_assignment PIN_T18 -to GPIO_0[33]
set_location_assignment PIN_T17 -to GPIO_0[34]
set_location_assignment PIN_T15 -to GPIO_0[35]

set_location_assignment PIN_N16 -to I2S_MCK
set_location_assignment PIN_B16 -to I2S_SCK
set_location_assignment PIN_M16 -to I2S_LR
set_location_assignment PIN_C16 -to I2S_D

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2S_MCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2S_SCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2S_LR
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to I2S_D



# --------------------------------
# GPIO-1
#  40pin(36I/O)
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[35]

set_location_assignment PIN_H16 -to GPIO_1[0]
set_location_assignment PIN_A12 -to GPIO_1[1]
set_location_assignment PIN_H15 -to GPIO_1[2]
set_location_assignment PIN_B12 -to GPIO_1[3]
set_location_assignment PIN_A13 -to GPIO_1[4]
set_location_assignment PIN_B13 -to GPIO_1[5]
set_location_assignment PIN_C13 -to GPIO_1[6]
set_location_assignment PIN_D13 -to GPIO_1[7]
set_location_assignment PIN_G18 -to GPIO_1[8]
set_location_assignment PIN_G17 -to GPIO_1[9]
set_location_assignment PIN_H18 -to GPIO_1[10]
set_location_assignment PIN_J18 -to GPIO_1[11]
set_location_assignment PIN_J19 -to GPIO_1[12]
set_location_assignment PIN_G11 -to GPIO_1[13]
set_location_assignment PIN_H10 -to GPIO_1[14]
set_location_assignment PIN_J11 -to GPIO_1[15]
set_location_assignment PIN_H14 -to GPIO_1[16]
set_location_assignment PIN_A15 -to GPIO_1[17]
set_location_assignment PIN_J13 -to GPIO_1[18]
set_location_assignment PIN_L8 -to GPIO_1[19]
set_location_assignment PIN_A14 -to GPIO_1[20]
set_location_assignment PIN_B15 -to GPIO_1[21]
set_location_assignment PIN_C15 -to GPIO_1[22]
set_location_assignment PIN_E14 -to GPIO_1[23]
set_location_assignment PIN_E15 -to GPIO_1[24]
set_location_assignment PIN_E16 -to GPIO_1[25]
set_location_assignment PIN_F14 -to GPIO_1[26]
set_location_assignment PIN_F15 -to GPIO_1[27]
set_location_assignment PIN_F13 -to GPIO_1[28]
set_location_assignment PIN_F12 -to GPIO_1[29]
set_location_assignment PIN_G16 -to GPIO_1[30]
set_location_assignment PIN_G15 -to GPIO_1[31]
set_location_assignment PIN_G13 -to GPIO_1[32]
set_location_assignment PIN_G12 -to GPIO_1[33]
set_location_assignment PIN_J17 -to GPIO_1[34]
set_location_assignment PIN_K16 -to GPIO_1[35]


# --------------------------------
# 7segLED x6
# --------------------------------
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed2[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed3[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed4[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to p7SegLed5[6]
set_location_assignment PIN_U21 -to p7SegLed0[0]
set_location_assignment PIN_V21 -to p7SegLed0[1]
set_location_assignment PIN_W22 -to p7SegLed0[2]
set_location_assignment PIN_W21 -to p7SegLed0[3]
set_location_assignment PIN_Y22 -to p7SegLed0[4]
set_location_assignment PIN_Y21 -to p7SegLed0[5]
set_location_assignment PIN_AA22 -to p7SegLed0[6]
set_location_assignment PIN_AA20 -to p7SegLed1[0]
set_location_assignment PIN_AB20 -to p7SegLed1[1]
set_location_assignment PIN_AA19 -to p7SegLed1[2]
set_location_assignment PIN_AA18 -to p7SegLed1[3]
set_location_assignment PIN_AB18 -to p7SegLed1[4]
set_location_assignment PIN_AA17 -to p7SegLed1[5]
set_location_assignment PIN_U22 -to p7SegLed1[6]
set_location_assignment PIN_Y19 -to p7SegLed2[0]
set_location_assignment PIN_AB17 -to p7SegLed2[1]
set_location_assignment PIN_AA10 -to p7SegLed2[2]
set_location_assignment PIN_Y14 -to p7SegLed2[3]
set_location_assignment PIN_V14 -to p7SegLed2[4]
set_location_assignment PIN_AB22 -to p7SegLed2[5]
set_location_assignment PIN_AB21 -to p7SegLed2[6]
set_location_assignment PIN_Y16 -to p7SegLed3[0]
set_location_assignment PIN_W16 -to p7SegLed3[1]
set_location_assignment PIN_Y17 -to p7SegLed3[2]
set_location_assignment PIN_V16 -to p7SegLed3[3]
set_location_assignment PIN_U17 -to p7SegLed3[4]
set_location_assignment PIN_V18 -to p7SegLed3[5]
set_location_assignment PIN_V19 -to p7SegLed3[6]
set_location_assignment PIN_U20 -to p7SegLed4[0]
set_location_assignment PIN_Y20 -to p7SegLed4[1]
set_location_assignment PIN_V20 -to p7SegLed4[2]
set_location_assignment PIN_U16 -to p7SegLed4[3]
set_location_assignment PIN_U15 -to p7SegLed4[4]
set_location_assignment PIN_Y15 -to p7SegLed4[5]
set_location_assignment PIN_P9 -to p7SegLed4[6]
set_location_assignment PIN_N9 -to p7SegLed5[0]
set_location_assignment PIN_M8 -to p7SegLed5[1]
set_location_assignment PIN_T14 -to p7SegLed5[2]
set_location_assignment PIN_P14 -to p7SegLed5[3]
set_location_assignment PIN_C1 -to p7SegLed5[4]
set_location_assignment PIN_C2 -to p7SegLed5[5]
set_location_assignment PIN_W19 -to p7SegLed5[6]


# --------------------------------
# push switch x4
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSW[3]

set_location_assignment PIN_U7 -to pSW[0]
set_location_assignment PIN_W9 -to pSW[1]
set_location_assignment PIN_M7 -to pSW[2]
set_location_assignment PIN_M6 -to pSW[3]

# --------------------------------
# LED x10
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pLed[9]

set_location_assignment PIN_AA2 -to pLed[0]
set_location_assignment PIN_AA1 -to pLed[1]
set_location_assignment PIN_W2 -to pLed[2]
set_location_assignment PIN_Y3 -to pLed[3]
set_location_assignment PIN_N2 -to pLed[4]
set_location_assignment PIN_N1 -to pLed[5]
set_location_assignment PIN_U2 -to pLed[6]
set_location_assignment PIN_U1 -to pLed[7]
set_location_assignment PIN_L2 -to pLed[8]
set_location_assignment PIN_L1 -to pLed[9]

# --------------------------------
# PS2
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pPs2Clk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pPs2mClk
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pPs2Dat
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pPs2mDat

set_location_assignment PIN_D3 -to pPs2Clk
set_location_assignment PIN_E2 -to pPs2mClk
set_location_assignment PIN_G2 -to pPs2Dat
set_location_assignment PIN_G1 -to pPs2mDat

set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pPs2Clk
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pPs2Clk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pPs2Dat
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pPs2Dat
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pPs2mClk
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pPs2mClk
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pPs2mDat
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pPs2mDat

# --------------------------------
# RESET
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY4_RESET_N
set_location_assignment PIN_P22 -to KEY4_RESET_N

# --------------------------------
# microSD
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Ck
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Cm
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Dt[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Dt[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Dt[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pSd_Dt[3]

set_location_assignment PIN_H11 -to pSd_Ck
set_location_assignment PIN_B11 -to pSd_Cm
set_location_assignment PIN_K9 -to pSd_Dt[0]
set_location_assignment PIN_D12 -to pSd_Dt[1]
set_location_assignment PIN_E12 -to pSd_Dt[2]
set_location_assignment PIN_C11 -to pSd_Dt[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Ck
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Ck
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Cm
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Cm
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Dt[0]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Dt[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Dt[1]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Dt[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Dt[2]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Dt[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 4MA -to pSd_Dt[3]
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pSd_Dt[3]

# --------------------------------
# slide switch x10
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDip[9]

set_location_assignment PIN_U13 -to pDip[0]
set_location_assignment PIN_V13 -to pDip[1]
set_location_assignment PIN_T13 -to pDip[2]
set_location_assignment PIN_T12 -to pDip[3]
set_location_assignment PIN_AA15 -to pDip[4]
set_location_assignment PIN_AB15 -to pDip[5]
set_location_assignment PIN_AA14 -to pDip[6]
set_location_assignment PIN_AA13 -to pDip[7]
set_location_assignment PIN_AB13 -to pDip[8]
set_location_assignment PIN_AB12 -to pDip[9]

# --------------------------------
# VGA
# --------------------------------

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VB[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VB[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VB[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VB[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VG[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VG[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VG[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VG[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pVideoHS_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pDac_VR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to pVideoVS_n

set_location_assignment PIN_B6 -to pDac_VB[0]
set_location_assignment PIN_B7 -to pDac_VB[1]
set_location_assignment PIN_A8 -to pDac_VB[2]
set_location_assignment PIN_A7 -to pDac_VB[3]
set_location_assignment PIN_L7 -to pDac_VG[0]
set_location_assignment PIN_K7 -to pDac_VG[1]
set_location_assignment PIN_J7 -to pDac_VG[2]
set_location_assignment PIN_J8 -to pDac_VG[3]
set_location_assignment PIN_H8 -to pVideoHS_n
set_location_assignment PIN_A9 -to pDac_VR[0]
set_location_assignment PIN_B10 -to pDac_VR[1]
set_location_assignment PIN_C9 -to pDac_VR[2]
set_location_assignment PIN_A5 -to pDac_VR[3]
set_location_assignment PIN_G8 -to pVideoVS_n

set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VB[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VB[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VB[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VB[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VG[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VG[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VG[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VG[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pVideoHS_n
set_instance_assignment -name SLOW_SLEW_RATE OFF -to pVideoHS_n
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pVideoHS_n

set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VR[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VR[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VR[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pDac_VR[3]

set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to pVideoVS_n
set_instance_assignment -name SLOW_SLEW_RATE OFF -to pVideoVS_n
set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to pVideoVS_n








