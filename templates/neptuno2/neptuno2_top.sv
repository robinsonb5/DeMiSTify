module neptuno2_top (
	input         CLOCK_50,
	input         KEY0,
	input         KEY1,
	output        LED1,
 // output        LED2,

	output  [7:0] VGA_R,
	output  [7:0] VGA_G,
	output  [7:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,

	input         SPI_SCK,
	inout         SPI_DO,
	input         SPI_DI,
	input         SPI_SS2,    // data_io
	input         SPI_SS3,    // OSD
	input         CONF_DATA0, // SPI_SS for user_io
`ifndef NO_DIRECT_UPLOAD
	input         SPI_SS4,
`endif

	output [12:0] SDRAM_A,
	inout  [15:0] SDRAM_DQ,
	output        SDRAM_DQML,
	output        SDRAM_DQMH,
	output        SDRAM_nWE,
	output        SDRAM_nCAS,
	output        SDRAM_nRAS,
	output        SDRAM_nCS,
	output  [1:0] SDRAM_BA,
	output        SDRAM_CLK,
	output        SDRAM_CKE,

	output        AUDIO_L,
	output        AUDIO_R,
`ifdef I2S_AUDIO
	output        I2S_BCK,
	output        I2S_LRCK,
	output        I2S_DATA,
`endif
`ifdef USE_AUDIO_IN
	input         AUDIO_IN,
`endif
	input         UART_RX,
	output        UART_TX

	// output        SD_CS,
	// output        SD_SCK,
	// output        SD_MOSI,
	// input         SD_MISO,
	
	// inout 		  PS2_KEYBOARD_CLK,
	// inout	      PS2_KEYBOARD_DAT,
	// inout	      PS2_MOUSE_CLK,
	// inout	      PS2_MOUSE_DAT,
	
    // output        JOY_CLK,
	// output        JOY_LOAD,
	// input         JOY_DATA,
	// output        JOY_SEL
);

wire   LED;

`ifdef USE_PLL_50_27
wire CLOCK_27;
wire pll_lock;
pll_50_27 u_pll_50_27 (
	.inclk0 ( CLOCK_50 ),
	.c0     ( CLOCK_27 ),
	.locked ( pll_lock )
);
`endif


`GUEST_TOP guest
(
`ifdef USE_PLL_50_27
 	.CLOCK_27	(CLOCK_27),
`else
 	.CLOCK_27	(CLOCK_50),
`endif
// `ifdef USE_CLOCK_50
//  	.CLOCK_50 	(CLOCK_50),
// `endif

 	.*

);

assign LED1 = ~LED;

endmodule
