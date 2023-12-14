# ========CLOCK============  
set_location_assignment PIN_B14 -to CLOCK_50

# ========VIDEO===========  
set_location_assignment PIN_AF21 -to VGA_R[5]
set_location_assignment PIN_AF23 -to VGA_R[4]
set_location_assignment PIN_AE23 -to VGA_R[3]
set_location_assignment PIN_AF20 -to VGA_R[2]
set_location_assignment PIN_AF19 -to VGA_R[1]
set_location_assignment PIN_AC19 -to VGA_R[0]
set_location_assignment PIN_AF22 -to VGA_B[5]
set_location_assignment PIN_AF25 -to VGA_B[4]
set_location_assignment PIN_AF24 -to VGA_B[3]
set_location_assignment PIN_AE22 -to VGA_B[2]
set_location_assignment PIN_AD19 -to VGA_B[1]
set_location_assignment PIN_AE18 -to VGA_B[0]
set_location_assignment PIN_AE21 -to VGA_G[5]
set_location_assignment PIN_AD21 -to VGA_G[4]
set_location_assignment PIN_AC21 -to VGA_G[3]
set_location_assignment PIN_AD20 -to VGA_G[2]
set_location_assignment PIN_AE19 -to VGA_G[1]
set_location_assignment PIN_AF18 -to VGA_G[0]
set_location_assignment PIN_AC18 -to VGA_VS
set_location_assignment PIN_AD18 -to VGA_HS


# ==========MCU=============  
set_location_assignment PIN_D6 -to CONF_DATA0
set_location_assignment PIN_B22 -to SPI_DI
set_location_assignment PIN_B23 -to SPI_DO
set_location_assignment PIN_C21 -to SPI_SCK
set_location_assignment PIN_C10 -to SPI_SS2
set_location_assignment PIN_B9 -to SPI_SS3
set_location_assignment PIN_B21 -to SPI_SS4


# ==========DRAM=============
set_location_assignment PIN_L25 -to SDRAM_A[0]
set_location_assignment PIN_L26 -to SDRAM_A[1]
set_location_assignment PIN_M25 -to SDRAM_A[2]
set_location_assignment PIN_M26 -to SDRAM_A[3]
set_location_assignment PIN_N22 -to SDRAM_A[4]
set_location_assignment PIN_N23 -to SDRAM_A[5]
set_location_assignment PIN_N24 -to SDRAM_A[6]
set_location_assignment PIN_M22 -to SDRAM_A[7]
set_location_assignment PIN_M24 -to SDRAM_A[8]
set_location_assignment PIN_L23 -to SDRAM_A[9]
set_location_assignment PIN_K26 -to SDRAM_A[10]
set_location_assignment PIN_L24 -to SDRAM_A[11]
set_location_assignment PIN_K23 -to SDRAM_A[12]
set_location_assignment PIN_B25 -to SDRAM_DQ[0]
set_location_assignment PIN_B26 -to SDRAM_DQ[1]
set_location_assignment PIN_C25 -to SDRAM_DQ[2]
set_location_assignment PIN_C26 -to SDRAM_DQ[3]
set_location_assignment PIN_D25 -to SDRAM_DQ[4]
set_location_assignment PIN_D26 -to SDRAM_DQ[5]
set_location_assignment PIN_E25 -to SDRAM_DQ[6]
set_location_assignment PIN_E26 -to SDRAM_DQ[7]
set_location_assignment PIN_H23 -to SDRAM_DQ[8]
set_location_assignment PIN_G24 -to SDRAM_DQ[9]
set_location_assignment PIN_G22 -to SDRAM_DQ[10]
set_location_assignment PIN_F24 -to SDRAM_DQ[11]
set_location_assignment PIN_F23 -to SDRAM_DQ[12]
set_location_assignment PIN_E24 -to SDRAM_DQ[13]
set_location_assignment PIN_D24 -to SDRAM_DQ[14]
set_location_assignment PIN_C24 -to SDRAM_DQ[15]
set_location_assignment PIN_J25 -to SDRAM_BA[0]
set_location_assignment PIN_J26 -to SDRAM_BA[1]
set_location_assignment PIN_H24 -to SDRAM_DQMH
set_location_assignment PIN_F26 -to SDRAM_DQML
set_location_assignment PIN_H25 -to SDRAM_nRAS
set_location_assignment PIN_G26 -to SDRAM_nCAS
set_location_assignment PIN_G25 -to SDRAM_nWE
set_location_assignment PIN_H26 -to SDRAM_nCS
set_location_assignment PIN_K24 -to SDRAM_CKE
set_location_assignment PIN_J23 -to SDRAM_CLK
# ==========AUDIO============  
set_location_assignment PIN_AD17 -to I2S_LRCK
set_location_assignment PIN_AF17 -to I2S_BCK
set_location_assignment PIN_AE17 -to I2S_DATA
set_location_assignment PIN_AC17 -to AUDIO_IN

# =========EXPANSION PORT=============
set_location_assignment PIN_AF16 -to EXP_PIN_1
set_location_assignment PIN_AD16 -to EXP_PIN_2
set_location_assignment PIN_AD15 -to EXP_PIN_3
set_location_assignment PIN_AD15 -to EXP_PIN_4
set_location_assignment PIN_AD14 -to EXP_PIN_5
set_location_assignment PIN_AF12 -to EXP_PIN_6
set_location_assignment PIN_AD10 -to EXP_PIN_7
set_location_assignment PIN_AF9 -to EXP_PIN_8
set_location_assignment PIN_AF8 -to EXP_PIN_9
set_location_assignment PIN_AF6 -to EXP_PIN_10
set_location_assignment PIN_AE6 -to EXP_PIN_11
set_location_assignment PIN_AD6 -to EXP_PIN_12
set_location_assignment PIN_AF5 -to EXP_PIN_13
set_location_assignment PIN_AE3 -to EXP_PIN_14
set_location_assignment PIN_AD4 -to EXP_PIN_15
set_location_assignment PIN_AC4 -to EXP_PIN_16
set_location_assignment PIN_AD3 -to EXP_PIN_17
set_location_assignment PIN_AF4 -to EXP_PIN_18
set_location_assignment PIN_AD5 -to EXP_PIN_19
set_location_assignment PIN_AE7 -to EXP_PIN_20
set_location_assignment PIN_AF7 -to EXP_PIN_21
set_location_assignment PIN_AE9 -to EXP_PIN_22
set_location_assignment PIN_AC10 -to EXP_PIN_23
set_location_assignment PIN_AF11 -to EXP_PIN_24
set_location_assignment PIN_AC14 -to EXP_PIN_25
set_location_assignment PIN_AC15 -to EXP_PIN_26
set_location_assignment PIN_AE14 -to EXP_PIN_27
set_location_assignment PIN_AC16 -to EXP_PIN_28
set_location_assignment PIN_AF15 -to EXP_PIN_29
set_location_assignment PIN_A22 -to EXP_PIN_30
set_location_assignment PIN_C19 -to EXP_PIN_31
set_location_assignment PIN_B19 -to EXP_PIN_32
set_location_assignment PIN_A21 -to EXP_PIN_37
set_location_assignment PIN_A20 -to EXP_PIN_38
set_location_assignment PIN_A19 -to EXP_PIN_39
set_location_assignment PIN_A18 -to EXP_PIN_40
set_location_assignment PIN_C17 -to EXP_PIN_41
set_location_assignment PIN_B18 -to EXP_PIN_42
set_location_assignment PIN_C16 -to EXP_PIN_43
set_location_assignment PIN_B17 -to EXP_PIN_44
set_location_assignment PIN_A17 -to EXP_PIN_45
set_location_assignment PIN_A16 -to EXP_PIN_46
set_location_assignment PIN_B15 -to EXP_PIN_47
set_location_assignment PIN_A15 -to EXP_PIN_48
set_location_assignment PIN_C15 -to EXP_PIN_49
set_location_assignment PIN_B13 -to EXP_PIN_50
set_location_assignment PIN_C13 -to EXP_PIN_51
set_location_assignment PIN_B13 -to EXP_PIN_52
set_location_assignment PIN_C12 -to EXP_PIN_53
set_location_assignment PIN_C11 -to EXP_PIN_54
set_location_assignment PIN_A12 -to EXP_PIN_55
set_location_assignment PIN_A11 -to EXP_PIN_56
set_location_assignment PIN_A10 -to EXP_PIN_57
set_location_assignment PIN_A8 -to EXP_PIN_58
set_location_assignment PIN_A6 -to EXP_PIN_59
set_location_assignment PIN_B6 -to EXP_PIN_60
set_location_assignment PIN_A5 -to EXP_PIN_61
set_location_assignment PIN_A4 -to EXP_PIN_62
set_location_assignment PIN_C4 -to EXP_PIN_63
set_location_assignment PIN_A2 -to EXP_PIN_64
set_location_assignment PIN_B1 -to EXP_PIN_65
set_location_assignment PIN_C1 -to EXP_PIN_66
set_location_assignment PIN_E1 -to EXP_PIN_67
set_location_assignment PIN_E2 -to EXP_PIN_68
set_location_assignment PIN_D1 -to EXP_PIN_69
set_location_assignment PIN_AF4 -to EXP_PIN_70
set_location_assignment PIN_A3 -to EXP_PIN_71
set_location_assignment PIN_AE5 -to EXP_PIN_72
set_location_assignment PIN_B4 -to EXP_PIN_73
set_location_assignment PIN_B5 -to EXP_PIN_74
set_location_assignment PIN_B7 -to EXP_PIN_75
set_location_assignment PIN_A7 -to EXP_PIN_76
set_location_assignment PIN_A9 -to EXP_PIN_77
set_location_assignment PIN_B10 -to EXP_PIN_78
set_location_assignment PIN_B11 -to EXP_PIN_79
set_location_assignment PIN_A13 -to EXP_PIN_80


# =========OTHERS============= UART PINS ALSO IN EXPANSION EXP_PIN_70 AND EXP_PIN_72 
set_location_assignment PIN_A23 -to LED
set_location_assignment PIN_AE5 -to UART_RX
set_location_assignment PIN_AF4 -to UART_TX

#============================
set_location_assignment PLL_1 -to "pll:pll|altpll:altpll_component"
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[0]

set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[1]

set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[5]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[6]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[7]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[8]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[9]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[10]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[11]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[12]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[13]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[14]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQ[15]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[2]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[3]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[4]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[5]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[6]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[7]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[8]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[9]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[10]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[11]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_A[12]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_BA[0]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_BA[1]
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQMH
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_DQML
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_nRAS
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_nCAS
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_nWE
set_instance_assignment -name FAST_OUTPUT_REGISTER ON -to SDRAM_nCS
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[0]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[1]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[2]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[3]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[4]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[5]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[6]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[7]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[8]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[9]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[10]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[11]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[12]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[13]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[14]
set_instance_assignment -name FAST_OUTPUT_ENABLE_REGISTER ON -to SDRAM_DQ[15]

# Fitter Assignments
# ==================
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[7]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[8]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[9]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[10]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[11]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_A[12]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[6]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[7]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[8]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[9]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[10]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[11]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[12]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[13]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[14]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQ[15]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_BA[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_BA[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQML
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_DQMH
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_nRAS
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_nCAS
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_nWE
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_nCS
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_CKE
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to SDRAM_CLK
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_R[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_G[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[5]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[4]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[3]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[2]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[1]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_B[0]
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_HS
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to VGA_VS
set_instance_assignment -name CURRENT_STRENGTH_NEW "MAXIMUM CURRENT" -to LED

