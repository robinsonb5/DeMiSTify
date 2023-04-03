module deca_mist_top (
    input  	 MAX10_CLK1_50,

    input [1:0]    KEY,

    // LED outputs
    output [7:0]   LED,

    // SDRAM interface
    inout  [15:0]  DRAM_DQ, // SDRAM Data bus 16 Bits
    output [12:0]  DRAM_ADDR, // SDRAM Address bus 13 Bits
    output 	       DRAM_LDQM, // SDRAM Low-byte Data Mask
    output 	       DRAM_UDQM, // SDRAM High-byte Data Mask
    output 	       DRAM_WE_N, // SDRAM Write Enable
    output 	       DRAM_CAS_N, // SDRAM Column Address Strobe
    output         DRAM_RAS_N, // SDRAM Row Address Strobe
    output 	       DRAM_CS_N, // SDRAM Chip Select
    output [1:0]   DRAM_BA, // SDRAM Bank Address
    output 	       DRAM_CLK, // SDRAM Clock
    output 	       DRAM_CKE, // SDRAM Clock Enable

    // SPI interface to arm io controller
    inout 	 SPI_MISO_WSBD, //SPI_DO,
    input 	 SPI_MOSI,      //SPI_DI,
    input 	 SPI_SCLK_DABD, //SPI_SCK,
    input 	 SPI_CS2,       //SPI_SS2,    (FPGA)
    input 	 SPI_CS0_CLKBD, //SPI_SS3,    (OSD)
    input 	 SPI_CS1,       //CONF_DATA0, (USER_IO)
    input 	 SPI_SS4,       //SPI_SS4,    (SD DIRECT)
--  input    RESET_N,       //RESET FROM SAM7S BUTTON

    // Audio DAC DECA
    output I2S_MCK,		//AUDIO_MCLK
    output I2S_SCK,		//AUDIO_BCLK
    output I2S_LR,		//AUDIO_WCLK
    output I2S_D,		//AUDIO_DIN_MFP1
    inout  AUDIO_GPIO_MFP5,
    input  AUDIO_MISO_MFP4,
    inout  AUDIO_RESET_n,
    output AUDIO_SCLK_MFP3,
    output AUDIO_SCL_SS_n,
    inout  AUDIO_SDA_MOSI,
    output AUDIO_SPI_SELECT,

    //VIDEO
    output 	      VGA_HS,
    output 	      VGA_VS,
    output [3:0]  VGA_R,
    output [3:0]  VGA_G,
    output [3:0]  VGA_B,

    //output 	 SIGMA_L, 	// sigma-delta DAC output left
    //output 	 SIGMA_R, 	// sigma-delta DAC output right
    
    //UART
    input     UART_RXD,		//pin DETO1_PMOD2_6 [change to output if used as SIGMA_L]
    output    UART_TXD		//pin DETO2_PMOD2_7

  );

  wire [5:0]  r_aux, g_aux, b_aux;
  wire [15:0] dac_l, dac_r;

  wire led;
  assign LED[0] = ~led;
  assign LED[7:1] = '1;

  guest_top guest
  (
    .CLOCK_27 	  (MAX10_CLK1_50),
    //.RESET_N    (1'b1),        //RESET_N
    .LED      	  (led),

    .SDRAM_DQ	  (DRAM_DQ),
    .SDRAM_A	  (DRAM_ADDR),
    .SDRAM_DQML	  (DRAM_LDQM),
    .SDRAM_DQMH	  (DRAM_UDQM),
    .SDRAM_nWE	  (DRAM_WE_N),
    .SDRAM_nCAS	  (DRAM_CAS_N),
    .SDRAM_nRAS	  (DRAM_RAS_N),
    .SDRAM_nCS	  (DRAM_CS_N),
    .SDRAM_BA	  (DRAM_BA),
    .SDRAM_CLK	  (DRAM_CLK),
    .SDRAM_CKE	  (DRAM_CKE),

    .SPI_DO		  (SPI_MISO_WSBD),
    .SPI_DI		  (SPI_MOSI),
    .SPI_SCK	  (SPI_SCLK_DABD),
    .SPI_SS2	  (SPI_CS2),
    .SPI_SS3	  (SPI_CS0_CLKBD),
    .SPI_SS4	  (SPI_SS4),
    .CONF_DATA0	  (SPI_CS1),

    //.UART_RX		(UART_RXD),
    //.UART_TX		(UART_TXD),
    
    //.AUDIO_L  	(SIGMA_L),
    //.AUDIO_R  	(SIGMA_R),
    //.AUDIO_L  	(UART_RXD),	//pin DETO1_PMOD2_6
    //.AUDIO_R  	(UART_TXD),	//pin DETO2_PMOD2_7
    
    .DAC_L       (dac_l),
    .DAC_R       (dac_r),

    .VGA_HS		  (VGA_HS),
    .VGA_VS		  (VGA_VS),
    .VGA_R		  (r_aux),
    .VGA_G		  (g_aux),
    .VGA_B		  (b_aux)

  );

  // VIDEO bits assignation
  assign VGA_R = r_aux[5:2];
  assign VGA_G = g_aux[5:2];
  assign VGA_B = b_aux[5:2];

  // AUDIO CODEC
  wire   RESET_DELAY_n;
  assign RESET_DELAY_n = 1'b1;     // BUTTON;

  // Audio DAC DECA Output assignments
  assign AUDIO_GPIO_MFP5  = 1'b1;  // GPIO
  assign AUDIO_SPI_SELECT = 1'b1;  // SPI mode
  assign AUDIO_RESET_n    = RESET_DELAY_n;

  // AUDIO CODEC SPI CONFIG
  // I2S mode; fs = 48khz; MCLK = 24.567Mhz x 2
  AUDIO_SPI_CTL_RD AUDIO_SPI_CTL_RD_inst 
  (
    .iRESET_n	  (RESET_DELAY_n  ),
    .iCLK_50	  (MAX10_CLK1_50  ),  //50Mhz clock
    .oCS_n		  (AUDIO_SCL_SS_n ),  //SPI interface mode chip-select signal
    .oSCLK		  (AUDIO_SCLK_MFP3),  //SPI serial clock
    .oDIN		  (AUDIO_SDA_MOSI ),  //SPI Serial data output
    .iDOUT		  (AUDIO_MISO_MFP4)   //SPI serial data input
  );

  audio_top audio_i2s
  (
    .clk_50MHz (MAX10_CLK1_50),
    .dac_MCLK  (I2S_MCK),
    .dac_LRCK  (I2S_LR),
    .dac_SCLK  (I2S_SCK),
    .dac_SDIN  (I2S_D),
    .L_data    (dac_l),
    .R_data    (dac_r)
  );

endmodule
