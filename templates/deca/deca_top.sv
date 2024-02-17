module deca_top (
	input         	MAX10_CLK1_50,

	input  [1:0]  	KEY,
	input  [1:0]	SW,

	output [7:0]    LED,

	output [3:0] 	VGA_R,
	output [3:0] 	VGA_G,
	output [3:0] 	VGA_B,
	output        	VGA_HS,
	output        	VGA_VS,

`ifdef USE_HDMI
	inout  [3:0]	HDMI_I2S,
	inout 			HDMI_LRCLK,   
	inout 			HDMI_MCLK,    
	inout 			HDMI_SCLK,    
	input 			HDMI_TX_INT,
	inout			HDMI_I2C_SCL,
	inout			HDMI_I2C_SDA,
	input 			HDMI_TX_CLK,  
	input [23:0]	HDMI_TX_D,    
	input 			HDMI_TX_DE,   
	input 			HDMI_TX_HS,   
	input 			HDMI_TX_VS,   
`endif

	// SDRAM
	output 		  	DRAM_CLK,   
	output 		  	DRAM_CKE,   
	output [12:0] 	DRAM_ADDR,  
	output [1:0]  	DRAM_BA,    
	inout  [15:0] 	DRAM_DQ,    
	output 		  	DRAM_LDQM,  
	output 		  	DRAM_UDQM,  
	output 		  	DRAM_CS_N,  
	output 		  	DRAM_WE_N,  
	output 		  	DRAM_CAS_N, 
	output 		  	DRAM_RAS_N, 
	
	output			SD_CS_N_O,
	output			SD_SCLK_O,
	output			SD_MOSI_O,
	input			SD_MISO_I,   
	output			SD_SEL,       
	output			SD_CMD_DIR,   
	output			SD_D0_DIR,    
	output			SD_D123_DIR,

	inout 		  	PS2_KEYBOARD_CLK,
	inout	      	PS2_KEYBOARD_DAT,
	inout	      	PS2_MOUSE_CLK,
	inout	      	PS2_MOUSE_DAT,
	
	input			JOY1_B2_P9, 
	input			JOY1_B1_P6, 
	input			JOY1_UP,    
	input			JOY1_DOWN,  
	input			JOY1_LEFT,  
	input			JOY1_RIGHT, 
	output			JOYX_SEL_O,

	inout			DETO1_PMOD2_6, 	// AUDIO_L
	inout			DETO2_PMOD2_7, 	// AUDIO_R
	inout			DETO3_JOY_MUX, 	
	inout			DETO4,			

`ifdef I2S_AUDIO
	inout 			AUDIO_GPIO_MFP5,  
	input 			AUDIO_MISO_MFP4,  
	inout 			AUDIO_RESET_n,   
	output 			AUDIO_SCLK_MFP3,  
	output 			AUDIO_SCL_SS_n,   
	inout 			AUDIO_SDA_MOSI,   
	output			AUDIO_SPI_SELECT, 
	output			I2S_MCK,          
	output			I2S_SCK,          
	output			I2S_LR,           
	output			I2S_D,            
`endif

`ifdef USE_AUDIO_IN
	input         	EAR,
`endif

//  input 			SPI_CS1,	// CTS
//  output 			SPI_CS2,	// RTS
	input         	UART_RXD,
	output        	UART_TXD
);

`ifdef VGA_8BIT
localparam VGA_BITS = 8;
`else
localparam VGA_BITS = 6;
`endif

wire reset_n;

////////// BOARD TO MIST SIGNALS ASSIGNMENTS //////////

wire 		CLOCK_27;
wire 		CLOCK_50 = MAX10_CLK1_50;
wire 		pll_lock;

wire   		SPI_SCK;
wire        SPI_DO;
wire        SPI_DI;
wire        SPI_SS2;    		// data_io
wire        SPI_SS3;    		// OSD
wire        CONF_DATA0; 		// SPI_SS for user_io
`ifndef NO_DIRECT_UPLOAD
wire        SPI_SS4;
`else
wire 		SPI_SS4 = 1;
`endif

wire AUDIO_L, AUDIO_R;
assign        DETO1_PMOD2_6 = AUDIO_L;
assign   	  DETO2_PMOD2_7 = AUDIO_R;
assign		  DETO3_JOY_MUX = 1'bz;
assign		  DETO4 = 1'bz;

`ifdef I2S_AUDIO
	wire I2S_BCK, I2S_LRCK, I2S_DATA;
	assign 	  I2S_SCK 		= I2S_BCK;
	assign    I2S_LR 		= I2S_LRCK;
	assign    I2S_D 		= I2S_DATA;
`endif

`ifdef USE_AUDIO_IN
wire        AUDIO_IN 	= EAR;
`endif

wire        UART_RX 	= UART_RXD;
wire 		UART_TX;
assign      UART_TXD 	= UART_TX;

`ifdef USE_HDMI
wire        HDMI_RST;
wire [7:0]  HDMI_R;
wire [7:0]  HDMI_G;
wire [7:0]  HDMI_B;
wire        HDMI_HS;
wire        HDMI_VS;
wire        HDMI_PCLK;
wire        HDMI_DE;
wire        HDMI_SDA;
wire        HDMI_SCL;
wire        HDMI_INT;
assign      HDMI_TX_D[23:16]= HDMI_R;
assign      HDMI_TX_D[15:8] = HDMI_G;
assign      HDMI_TX_D[7:0] 	= HDMI_B;
assign      HDMI_TX_HS     	= HDMI_HS;
assign      HDMI_TX_VS     	= HDMI_VS;
assign      HDMI_TX_CLK    	= HDMI_PCLK;
assign      HDMI_TX_DE     	= HDMI_DE;
assign      HDMI_I2C_SDA   	= HDMI_SDA;
assign      HDMI_I2C_SCL   	= HDMI_SCL;
assign 		HDMI_INT		= HDMI_TX_INT;
`endif

`ifdef USE_QSPI
wire       	QSCK;				//input
wire       	QCSn;				//input
wire [3:0] 	QDAT;				//inout
`endif

// PLL
`ifdef USE_PLL_50_27
pll_50_27 u_pll_50_27 (
	.inclk0 ( CLOCK_50 ),
	.c0     ( CLOCK_27 ),
	.locked ( pll_lock )
);
`endif


//////////    BOARD ASSIGNMENTS   /////////

// SD SPI
wire   sd_cs, sd_mosi, sd_miso, sd_clk;
assign SD_CS_N_O = sd_cs;
assign SD_MOSI_O = sd_mosi;
assign sd_miso   = SD_MISO_I;
assign SD_SCLK_O = sd_clk;

`ifdef USE_QSPI
`else
assign SD_SEL      = 1'b0; 		// 0 = 3.3V at sdcard   
assign SD_CMD_DIR  = 1'b1; 		// MOSI FPGA output
assign SD_D0_DIR   = 1'b0; 		// MISO FPGA input     
assign SD_D123_DIR = 1'b1; 		// CS FPGA output  
`endif

// PS2 KEYB & MOUSE
wire   ps2_keyboard_clk_in = PS2_KEYBOARD_CLK;
wire   ps2_keyboard_clk_out;
wire   ps2_keyboard_dat_in = PS2_KEYBOARD_DAT ;
wire   ps2_keyboard_dat_out;
assign PS2_KEYBOARD_CLK = ~ps2_keyboard_clk_out ? 1'b0 : 1'bZ;
assign PS2_KEYBOARD_DAT = ~ps2_keyboard_dat_out ? 1'b0 : 1'bZ;

wire   ps2_mouse_clk_in = PS2_MOUSE_CLK;
wire   ps2_mouse_clk_out;
wire   ps2_mouse_dat_in = PS2_MOUSE_DAT;
wire   ps2_mouse_dat_out;
assign PS2_MOUSE_CLK    = ~ps2_mouse_clk_out 	? 1'b0 : 1'bZ;
assign PS2_MOUSE_DAT    = ~ps2_mouse_dat_out 	? 1'b0 : 1'bZ;

// JOYSTICK
assign JOYX_SEL_O = 1'b1;
wire [7:0] joy1 = {2'b11, JOY1_B2_P9, JOY1_B1_P6, JOY1_RIGHT, JOY1_LEFT, JOY1_DOWN, JOY1_UP};
wire [7:0] joy2 = {8'hFF};
wire [7:0] joy3 = {8'hFF};
wire [7:0] joy4 = {8'hFF};

// VGA OUTPUT
wire [7:0] vga_red, vga_green, vga_blue;
assign VGA_R  = vga_red  [VGA_BITS-1:VGA_BITS-4];  
assign VGA_G  = vga_green[VGA_BITS-1:VGA_BITS-4];
assign VGA_B  = vga_blue [VGA_BITS-1:VGA_BITS-4];

// DECA AUDIO CODEC
`ifdef I2S_AUDIO
assign AUDIO_GPIO_MFP5  = 1'b1; 	// GPIO
assign AUDIO_SPI_SELECT = 1'b1; 	// SPI mode
assign AUDIO_RESET_n    = reset_n;

AUDIO_SPI_CTL_RD AUDIO_SPI_CTL_RD_inst (
	.iRESET_n	( reset_n         ),
	.iCLK_50	( CLOCK_50        ),
	.oCS_n		( AUDIO_SCL_SS_n  ),
	.oSCLK		( AUDIO_SCLK_MFP3 ),
	.oDIN		( AUDIO_SDA_MOSI  ),
	.iDOUT		( AUDIO_MISO_MFP4 )
);

assign I2S_MCK = CLOCK_50;

`endif

// DECA HDMI
`ifdef USE_HDMI
I2C_HDMI_Config I2C_HDMI_Config_inst (
	.iCLK		 ( CLOCK_50	    ),
	.iRST_N		 ( reset_n	    ), 		//reset_n, KEY[0]
	.I2C_SCLK	 ( HDMI_I2C_SCL ),
	.I2C_SDAT	 ( HDMI_I2C_SDA ),
	.HDMI_TX_INT ( HDMI_TX_INT  )
);

// HDMI I2S AUDIO   
`ifdef I2S_AUDIO
assign HDMI_MCLK   = I2S_MCK;
assign HDMI_SCLK   = I2S_BCK; 			// lr*2*16
assign HDMI_LRCLK  = I2S_LRCK;
assign HDMI_I2S[0] = I2S_DATA;
`endif

`endif

// LEDS
wire   act_led;
assign LED = {~act_led,7'b1111111};


////////// MIST GUEST TOP MODULE //////////
wire   spi_clk_int;  
// wire spi_do, spi_toguest, spi_fromguest;

`GUEST_TOP guest
(
`ifdef USE_PLL_50_27
	.CLOCK_27	(CLOCK_27),
`else
	.CLOCK_27	(CLOCK_50),
`endif

`ifdef USE_CLOCK_50
	.CLOCK_50 	(CLOCK_50),
`endif

	.LED		(act_led),

    .SDRAM_A(DRAM_ADDR),
    .SDRAM_DQ(DRAM_DQ),
    .SDRAM_DQML(DRAM_LDQM),
    .SDRAM_DQMH(DRAM_UDQM),
    .SDRAM_nWE(DRAM_WE_N),
    .SDRAM_nCAS(DRAM_CAS_N),
    .SDRAM_nRAS(DRAM_RAS_N),
    .SDRAM_nCS(DRAM_CS_N),
    .SDRAM_BA(DRAM_BA),
    .SDRAM_CLK(DRAM_CLK),
    .SDRAM_CKE(DRAM_CKE),

	// .SPI_DO		(spi_do),
	// .SPI_DI		(spi_toguest),
	.SPI_SCK  	(spi_clk_int),

	.VGA_R		(vga_red),	
	.VGA_G		(vga_green),
	.VGA_B		(vga_blue),
	
	// .PS2K_CLK (ps2_keyboard_clk_in | intercept), // Block keyboard when OSD is active
	// .PS2K_DAT (ps2_keyboard_dat_in),
	// .PS2M_CLK (ps2_mouse_clk_in),
	// .PS2M_DAT (ps2_mouse_dat_in),
	// .PS2K_CLK_OUT (ps2_keyboard_clk_out), // Block keyboard when OSD is active
	// .PS2K_DAT_OUT (ps2_keyboard_dat_out),
	// .PS2M_CLK_OUT (ps2_mouse_clk_out),
	// .PS2M_DAT_OUT (ps2_mouse_dat_out),

 	.*
);


//////////    SUBSTITUTE MCU    //////////

wire rs232_rxd, rs232_txd;
wire intercept;

// Pass internal signals to external SPI interface
assign sd_clk = spi_clk_int;
// assign spi_do = ~SPI_SS4 ? sd_miso : 1'bZ;  // to guest
// assign spi_fromguest = spi_do;  			   // to control CPU

substitute_mcu #(
	.sysclk_frequency(500), 
	// .SPI_FASTBIT(3),				//needed if OSD hungs
	// .SPI_INTERNALBIT(2),			//needed if OSD hungs
	.debug("false"), 
	.jtag_uart("false")
) 
controller
(
 	.clk 			(CLOCK_50),
 	.reset_in		(KEY[0]),		// reset_in  when 0
 	.reset_out		(reset_n),		// reset_out when 0
 
	 // SPI signals
 	.spi_miso		(sd_miso),
 	.spi_mosi		(sd_mosi),
 	.spi_clk		(spi_clk_int),
 	.spi_cs			(sd_cs),
 	// .spi_fromguest  (spi_fromguest),
 	// .spi_toguest    (spi_toguest),
	.spi_fromguest  (SPI_DO),
 	.spi_toguest    (SPI_DI),
 	.spi_ss2        (SPI_SS2),
 	.spi_ss3        (SPI_SS3),
`ifndef NO_DIRECT_UPLOAD 
 	.spi_ss4        (SPI_SS4),
`endif
 	.conf_data0     (CONF_DATA0),
 
	// PS/2 signals
 	.ps2k_clk_in    (ps2_keyboard_clk_in),
 	.ps2k_dat_in    (ps2_keyboard_dat_in),
 	.ps2k_clk_out   (ps2_keyboard_clk_out),
 	.ps2k_dat_out   (ps2_keyboard_dat_out),
 	.ps2m_clk_in    (ps2_mouse_clk_in),
 	.ps2m_dat_in    (ps2_mouse_dat_in),
 	.ps2m_clk_out   (ps2_mouse_clk_out),
 	.ps2m_dat_out   (ps2_mouse_dat_out),

	// Buttons
	.buttons	    ({31'h7FFFFFFF,KEY[1]}),		// 0=OSD_button

	// Joysticks
 	.joy1           (joy1),
 	.joy2           (joy2),
 	.joy3           (joy3),
 	.joy4           (joy4),

	 // UART
	 .rxd  			(rs232_rxd),
	 .txd  			(rs232_txd),
	 
	 // intercept=1 when OSD is on
	 .intercept 	(intercept)
);

endmodule
