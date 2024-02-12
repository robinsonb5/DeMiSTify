module zxtres_top (
	input         CLOCK_50,
	output        LED,

	output  [7:0] VGA_R,
	output  [7:0] VGA_G,
	output  [7:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,

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
	
	output        SD_CS,
	output        SD_SCK,
	output        SD_MOSI,
	input         SD_MISO,
	
	inout 		  PS2_KEYBOARD_CLK,
	inout	      PS2_KEYBOARD_DAT,
	inout	      PS2_MOUSE_CLK,
	inout	      PS2_MOUSE_DAT,
	
    output        JOY_CLK,
	output        JOY_LOAD,
	input         JOY_DATA,
	output        JOY_SEL,
	
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
);

wire reset_n;

wire SPI_SCK,SPI_DO,SPI_DI,SPI_SS2,SPI_SS3,CONF_DATA0;
`ifndef NO_DIRECT_UPLOAD
wire        SPI_SS4;
`else
wire 		SPI_SS4 = 1;
`endif

wire CLOCK_50_buff;

IBUF clkin1_ibufg
(.O (CLOCK_50_buff),
 .I (CLOCK_50));

// LEDS
wire   act_led;
assign LED = ~act_led;

wire ps2_keyboard_clk_in = PS2_KEYBOARD_CLK;
wire ps2_keyboard_clk_out;
wire ps2_keyboard_dat_in = PS2_KEYBOARD_DAT ;
wire ps2_keyboard_dat_out;
assign PS2_KEYBOARD_CLK = !ps2_keyboard_clk_out ? 1'b0 : 1'bZ;
assign PS2_KEYBOARD_DAT = !ps2_keyboard_dat_out ? 1'b0 : 1'bZ;

wire ps2_mouse_clk_in = PS2_MOUSE_CLK;
wire ps2_mouse_clk_out;
wire ps2_mouse_dat_in = PS2_MOUSE_DAT;
wire ps2_mouse_dat_out;
assign PS2_MOUSE_CLK = !ps2_mouse_clk_out ? 1'b0 : 1'bZ;
assign PS2_MOUSE_DAT = !ps2_mouse_dat_out ? 1'b0 : 1'bZ;


wire joy1up,joy1down,joy1left,joy1right,joy1fire1,joy1fire2;
wire joy2up,joy2down,joy2left,joy2right,joy2fire1,joy2fire2;
wire [11:0] joy1_b12, joy2_b12;
wire [`DEMISTIFY_JOYBITS-1:0] joy1, joy2;

joydecoder_neptuno joydecoder
(
	.clk_i        (CLOCK_50_buff),
	.joy_data_i   (JOY_DATA),
	.joy_clk_o    (JOY_CLK),
	.joy_load_o   (JOY_LOAD),
	.joy1_up_o    (joy1up),
	.joy1_down_o  (joy1down),
	.joy1_left_o  (joy1left),
	.joy1_right_o (joy1right),
	.joy1_fire1_o (joy1fire1),
	.joy1_fire2_o (joy1fire2),
	.joy2_up_o    (joy2up),
	.joy2_down_o  (joy2down),
	.joy2_left_o  (joy2left),
	.joy2_right_o (joy2right),
	.joy2_fire1_o (joy2fire1),
	.joy2_fire2_o (joy2fire2) 
);

joystick_sega   #(.CLK_SPEED(50000) )  sega
(
	.joy0        (joy1fire2&joy1fire1&joy1up&joy1down&joy1left&joy1right),
	.joy1        (joy2fire2&joy2fire1&joy2up&joy2down&joy2left&joy2right),
	// -- fire12-1, up, down, left,right
	// -- joy_s format MXYZ SACB UDLR
	.player1     (joy1_b12),
	.player2     (joy2_b12),
	// -- sega joystick
	.clk_i       (CLOCK_50_buff),
	.sega_strobe (JOY_SEL)
);	

//     joy1 <= "11" & JOY1_B2_P9 & JOY1_B1_P6 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;
assign joy1 = {2'b11, joy1_b12[4], joy1_b12[6], joy1_b12[0], joy1_b12[1], joy1_b12[2], joy1_b12[3]};	
assign joy2 = {2'b11, joy2_b12[4], joy2_b12[6], joy2_b12[0], joy2_b12[1], joy2_b12[2], joy2_b12[3]};	


// joydecoder joydecoder
// (
// 	.clk      (CLOCK_50_buff),
// 	.joy_data (JOY_DATA),
// 	.joy_clk  (JOY_CLK),
// 	.joy_load_n (JOY_LOAD),
// 	.joy1up   (joy1up),
// 	.joy1down (joy1down),
// 	.joy1left (joy1left),
// 	.joy1right(joy1right),
// 	.joy1fire1(joy1fire1),
// 	.joy1fire2(joy1fire2),
// 	.joy2up   (joy2up),
// 	.joy2down (joy2down),
// 	.joy2left (joy2left),
// 	.joy2right(joy2right),
// 	.joy2fire1(joy2fire1),
// 	.joy2fire2(joy2fire2) 
// );
//
// assign joy1 ={2'b11,joy1fire2,joy1fire1,joy1right,joy1left,joy1down,joy1up};
// assign joy2 ={2'b11,joy2fire2,joy2fire1,joy2right,joy2left,joy2down,joy2up};



// // I2S audio
// audio_top  audio_i2s 
// (
// 	.clk_50MHz (CLOCK_50),
// 	.dac_MCLK  (        ),
// 	.dac_SCLK  (I2S_BCLK),
// 	.dac_SDIN  (I2S_DATA),
// 	.dac_LRCK  (I2S_LRCLK),
// 	.L_data    (dac_l),
// 	.R_data    (dac_r)
// );



////////// MIST GUEST TOP MODULE //////////

`GUEST_TOP guest
(
 	.CLOCK_27	(CLOCK_50_buff),
`ifdef USE_CLOCK_50
 	.CLOCK_50 	(CLOCK_50_buff),
`endif

	.LED		(act_led),

    	//.SPI_DO_IN  (SD_MISO),

	.*

	// .PS2K_CLK_IN  ( ps2_keyboard_clk_in || intercept ), // Block keyboard when OSD is active
	// .PS2K_DAT_IN  ( ps2_keyboard_dat_in ),
	// .PS2K_CLK_OUT ( ps2_keyboard_clk_out ),
	// .PS2K_DAT_OUT ( ps2_keyboard_dat_out ),

	// .PS2K_MOUSE_CLK_IN  ( ps2_mouse_clk_in ),
	// .PS2K_MOUSE_DAT_IN  ( ps2_mouse_dat_in ),
	// .PS2K_MOUSE_CLK_OUT ( ps2_mouse_clk_out ),
	// .PS2K_MOUSE_DAT_OUT ( ps2_mouse_dat_out )
);


//////////    SUBSTITUTE MCU    //////////

wire rs232_rxd, rs232_txd;
wire intercept;

// Pass internal signals to external SPI interface
assign SD_SCK = SPI_SCK;

substitute_mcu #(
	.sysclk_frequency(500) 
	// ,.SPI_FASTBIT(3),				//needed if OSD hungs
	// .SPI_INTERNALBIT(2),			//needed if OSD hungs
	// ,.debug("false"), 
	// .jtag_uart("false")
) 
controller
(
 .clk          (CLOCK_50_buff),
 .reset_in     (1'b1),			// reset_in  when 0
 .reset_out    (reset_n),		// reset_out  when 0
 
 .spi_miso     (SD_MISO),
 .spi_mosi     (SD_MOSI),
 .spi_clk      (SPI_SCK),
 .spi_cs       (SD_CS),
 .spi_fromguest(SPI_DO),
 .spi_toguest  (SPI_DI),
 .spi_ss2      (SPI_SS2),
 .spi_ss3      (SPI_SS3),
`ifndef NO_DIRECT_UPLOAD 
 .spi_ss4      (SPI_SS4),
`endif
 .conf_data0   (CONF_DATA0),
 
 .ps2k_clk_in  (ps2_keyboard_clk_in),
 .ps2k_dat_in  (ps2_keyboard_dat_in),
 .ps2k_clk_out (ps2_keyboard_clk_out),
 .ps2k_dat_out (ps2_keyboard_dat_out),
 .ps2m_clk_in  (ps2_mouse_clk_in),
 .ps2m_dat_in  (ps2_mouse_dat_in),
 .ps2m_clk_out (ps2_mouse_clk_out),
 .ps2m_dat_out (ps2_mouse_dat_out),

 // Buttons
 .buttons	   ({32'h80000000}),		// 0=OSD_button

 // Joysticks
 .joy1         (joy1),
 .joy2         (joy2),

//  // UART
//  .rxd  			(rs232_rxd),
//  .txd  			(rs232_txd),

 // intercept=1 when OSD is on
 .intercept    (intercept)
);

endmodule
