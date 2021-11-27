library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity atlas_top is
	port
	(
		CLK12M			:	 IN STD_LOGIC;
		KEY0			: 	 IN STD_LOGIC;
		LED				:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- SDRAM
		DRAM_CLK		:	 OUT STD_LOGIC;
		DRAM_CKE		:	 OUT STD_LOGIC;
		DRAM_ADDR		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		DRAM_BA			:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		DRAM_DQ			:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DRAM_LDQM		:	 OUT STD_LOGIC;
		DRAM_UDQM		:	 OUT STD_LOGIC;
		DRAM_CS_N		:	 OUT STD_LOGIC;
		DRAM_WE_N		:	 OUT STD_LOGIC;
		DRAM_CAS_N		:	 OUT STD_LOGIC;
		DRAM_RAS_N		:	 OUT STD_LOGIC;
		-- VGA
--		VGA_HS			:	 OUT STD_LOGIC;
--		VGA_VS			:	 OUT STD_LOGIC;
--		VGA_R			:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
--		VGA_G			:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
--		VGA_B			:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		-- HDMI TDMS   (VGA and TDMS share same pins. Just leave one or another but not both)
		TMDS			:	 OUT STD_LOGIC_VECTOR(7 DOWNTO 0)	:= (others => '0');
		-- AUDIO
		SIGMA_R         : OUT   STD_LOGIC;
		SIGMA_L         : OUT   STD_LOGIC;
		-- EAR
		EAR				: IN    STD_LOGIC;
		-- I2S audio		
		I2S_BCLK		: out   std_logic				:= '0';
		I2S_LRCLK		: out   std_logic				:= '0';
		I2S_DATA		: out   std_logic				:= '0';		
		-- JOYSTICK 
		JOY1_B2_P9		: IN    STD_LOGIC;
		JOY1_B1_P6		: IN    STD_LOGIC;
		JOY1_UP			: IN    STD_LOGIC;
		JOY1_DOWN		: IN    STD_LOGIC;
		JOY1_LEFT		: IN    STD_LOGIC;
		JOY1_RIGHT		: IN    STD_LOGIC;
--		JOYX_SEL_O	: OUT   STD_LOGIC := '1';
		-- PS2
		PS2_KEYBOARD_CLK   :    INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT   :    INOUT STD_LOGIC;
		PS2_MOUSE_CLK      :    INOUT STD_LOGIC;
		PS2_MOUSE_DAT      :    INOUT STD_LOGIC;
		-- UART
		UART_RXD           : IN  STD_LOGIC;
		UART_TXD           : OUT STD_LOGIC;
		-- SD Card
		SD_CS_N_O          : out   std_logic := '1';
		SD_SCLK_O          : out   std_logic := '0';
		SD_MOSI_O          : out   std_logic := '0';
		SD_MISO_I          : in    std_logic
	
	);
END entity;

architecture RTL of atlas_top is
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

-- SPI signals
	signal sd_clk : std_logic;
	signal sd_cs : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;
	
-- internal SPI signals
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;

-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

-- Video
	signal vga_red: std_logic_vector(7 downto 0);
	signal vga_green: std_logic_vector(7 downto 0);
	signal vga_blue: std_logic_vector(7 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;

-- IO
	signal joya : std_logic_vector(7 downto 0);
	signal joyb : std_logic_vector(7 downto 0);
	signal joyc : std_logic_vector(7 downto 0);
	signal joyd : std_logic_vector(7 downto 0);

component audio_top is
Port ( 	
		clk_50MHz : in STD_LOGIC; -- system clock
		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
		dac_LRCK : out STD_LOGIC;
		dac_SCLK : out STD_LOGIC;
		dac_SDIN : out STD_LOGIC;
		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (16-bit signed)
		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (16-bit signed) 
);
end component;	

-- DAC AUDIO     
signal dac_l: std_logic_vector(15 downto 0);
signal dac_r: std_logic_vector(15 downto 0);

-- I2S 
signal i2s_mclk		    : std_logic;

-- HDMI
signal clock_vga_s		: std_logic;
signal clock_dvi_s		: std_logic;
signal sound_hdmi_l_s	: std_logic_vector(15 downto 0);
signal sound_hdmi_r_s	: std_logic_vector(15 downto 0);
signal tdms_r_s			: std_logic_vector( 9 downto 0);
signal tdms_g_s			: std_logic_vector( 9 downto 0);
signal tdms_b_s			: std_logic_vector( 9 downto 0);
signal tdms_p_s			: std_logic_vector( 3 downto 0);
signal tdms_n_s			: std_logic_vector( 3 downto 0);

-- VIDEO 
signal hdmi_clk :  std_logic;
signal hdmi_blank  :  std_logic;
-- signal vga_x_r :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
-- signal vga_x_g :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
-- signal vga_x_b :  STD_LOGIC_VECTOR(5 DOWNTO 0); 
-- signal vga_x_hs :  std_logic; 
-- signal vga_x_vs :  std_logic; 


component pll2
    port (
--  areset : in std_logic;
    inclk0 : in std_logic;
    c0 : out std_logic;
    c1 : out std_logic
--  locked : out std_logic
  );
end component;


component gb_mist
    port (
    CLOCK_27 : in std_logic_vector (1 downto 0);
    LED 	 : out std_logic;
	-- SPI
    SPI_DO  : out std_logic;
    SPI_DI  : in std_logic;
    SPI_SCK : in std_logic;
    SPI_SS2 : in std_logic;
    SPI_SS3 : in std_logic;
    SPI_SS4 : in std_logic;
    CONF_DATA0 : in std_logic;
	-- SDRAM
    SDRAM_DQ : inout std_logic_vector (15 downto 0);
    SDRAM_A  : out std_logic_vector (12 downto 0);
    SDRAM_DQML : out std_logic;
    SDRAM_DQMH : out std_logic;
    SDRAM_nWE  : out std_logic;
    SDRAM_nCAS : out std_logic;
    SDRAM_nRAS : out std_logic;
    SDRAM_nCS : out std_logic;
    SDRAM_BA  : out std_logic_vector (1 downto 0);
    SDRAM_CLK : out std_logic;
    SDRAM_CKE : out std_logic;
	-- AUDIO
    AUDIO_L : out std_logic;
    AUDIO_R : out std_logic;
		DAC_L     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
    	DAC_R     : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
	-- VGA
    VGA_HS : out std_logic;
    VGA_VS : out std_logic;
    VGA_R : out std_logic_vector (5 downto 0);
    VGA_G : out std_logic_vector (5 downto 0);
    VGA_B : out std_logic_vector (5 downto 0);
		VGA_BLANK : out std_logic; 
		VGA_CLK : out std_logic
  );
end component;


begin


-- SPI
SD_CS_N_O<=sd_cs;
SD_MOSI_O<=sd_mosi;
sd_miso  <=SD_MISO_I;
SD_SCLK_O<=sd_clk;

-- External devices tied to GPIOs
ps2_mouse_dat_in<=ps2_mouse_dat;
ps2_mouse_dat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mouse_clk;
ps2_mouse_clk <= '0' when ps2_mouse_clk_out='0' else 'Z';

ps2_keyboard_dat_in <=ps2_keyboard_dat;
ps2_keyboard_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=ps2_keyboard_clk;
ps2_keyboard_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';
	

--JOYX_SEL_O <= '1';
joya<="11" & JOY1_B2_P9 & JOY1_B1_P6 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;
joyb<=(others=>'1');
joyc<=(others=>'1');
joyd<=(others=>'1');


-- I2S audio
audio_i2s: audio_top
port map(
	clk_50MHz => CLK12M,
	dac_MCLK  => i2s_mclk,
	dac_LRCK  => I2S_LRCLK,
	dac_SCLK  => I2S_BCLK,
	dac_SDIN  => I2S_DATA,
	L_data    => std_logic_vector(dac_l),
	R_data    => std_logic_vector(dac_r)
);		



-- -- VGA
-- VGA_R <=vga_red(7 downto 6);
-- VGA_G <=vga_green(7 downto 6);
-- VGA_B <=vga_blue(7 downto 6);
-- VGA_HS<=vga_hsync;
-- VGA_VS<=vga_vsync;



-- BEGIN HDMI ATLAS -------------------   (VGA and TDMS share same pins. Just leave one or another but not both)

-- PLL VIDEO
pllvideo : pll2
port map (
	inclk0		=> CLK12M,
	c0			=> clock_vga_s,		-- x 	33.000   (clk64 = 66 MHz instead of 67.11 ) (output is 59Hz instead of 60Hz)
	c1			=> clock_dvi_s			-- x5	165.000
);
--clock_vga_s <= hdmi_clk;

--  HDMI   
sound_hdmi_l_s <= '0' & std_logic_vector(dac_l(15 downto 1));
sound_hdmi_r_s <= '0' & std_logic_vector(dac_r(15 downto 1));

hdmi: entity work.hdmi
generic map (
	FREQ	=> 33600000,			-- pixel clock frequency 
	FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
	CTS		=> 33600,		-- CTS = Freq(pixclk) * N / (128 * Fs)
	N		=> 6144		-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
) 
port map (
	I_CLK_PIXEL		=> clock_vga_s,
	I_R				=> vga_red(7 downto 2)&vga_red(7 downto 6),
	I_G				=> vga_green(7 downto 2)&vga_green(7 downto 6),
	I_B				=> vga_blue(7 downto 2)&vga_blue(7 downto 6),
	I_BLANK			=> hdmi_blank,
	I_HSYNC			=> vga_hsync,
	I_VSYNC			=> vga_vsync,
	-- PCM audio
	I_AUDIO_ENABLE	=> '1',
	I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
	I_AUDIO_PCM_R	=> sound_hdmi_r_s,
	-- TMDS parallel pixel synchronous outputs (serialize LSB first)
	O_RED			=> tdms_r_s,
	O_GREEN			=> tdms_g_s,
	O_BLUE			=> tdms_b_s
);

hdmio: entity work.hdmi_out_altera
port map (
	clock_pixel_i		=> clock_vga_s,
	clock_tdms_i		=> clock_dvi_s,
	red_i				=> tdms_r_s,
	green_i				=> tdms_g_s,
	blue_i				=> tdms_b_s,
	tmds_out_p			=> tdms_p_s,
	tmds_out_n			=> tdms_n_s
);

TMDS(7)	<= tdms_p_s(2);	-- 2+		
TMDS(6)	<= tdms_n_s(2);	-- 2-		
TMDS(5)	<= tdms_p_s(1);	-- 1+			
TMDS(4)	<= tdms_n_s(1);	-- 1-		
TMDS(3)	<= tdms_p_s(0);	-- 0+		
TMDS(2)	<= tdms_n_s(0);	-- 0-	
TMDS(1)	<= tdms_p_s(3);	-- CLK+	
TMDS(0)	<= tdms_n_s(3);	-- CLK-

-- END HDMI ATLAS -------------------


guest: COMPONENT  gb_mist
  port map (
--	CLOCK_27 => CLK12M,
    CLOCK_27 => CLK12M&CLK12M,
--  RESET_N => reset_n,
    LED => LED(0),
	--SPI
--	SPI_SD_DI => sd_miso,
	SPI_DO  => spi_fromguest,
	SPI_DI  => spi_toguest,
	SPI_SCK => spi_clk_int,
	SPI_SS2 => spi_ss2,
	SPI_SS3 => spi_ss3,
	SPI_SS4 => spi_ss4,
	CONF_DATA0 => conf_data0,
	--SDRAM
	SDRAM_DQ => DRAM_DQ,
	SDRAM_A => DRAM_ADDR,
	SDRAM_DQML => DRAM_LDQM,
	SDRAM_DQMH => DRAM_UDQM,
	SDRAM_nWE => DRAM_WE_N,
	SDRAM_nCAS => DRAM_CAS_N,
	SDRAM_nRAS => DRAM_RAS_N,
	SDRAM_nCS => DRAM_CS_N,
	SDRAM_BA => DRAM_BA,
	SDRAM_CLK => DRAM_CLK,
	SDRAM_CKE => DRAM_CKE,
	--UART
--	UART_TX  => UART_TXD,
--	UART_RX  => UART_RXD,
	--AUDIO
    AUDIO_L => SIGMA_L,
    AUDIO_R => SIGMA_R,
		DAC_L   => dac_l,
		DAC_R   => dac_r,
	--VGA
	VGA_HS => vga_hsync,
	VGA_VS => vga_vsync,
	VGA_R => vga_red(7 downto 2),
	VGA_G => vga_green(7 downto 2),
	VGA_B => vga_blue(7 downto 2),
		VGA_BLANK => hdmi_blank,
		VGA_CLK   => hdmi_clk
  );


-- Pass internal signals to external SPI interface
sd_clk <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
		debug => false,
		jtag_uart => false
	)
	port map (
		clk => CLK12M,
		reset_in  =>  KEY0,
		reset_out => reset_n,

		-- SPI signals
		spi_miso => sd_miso,
		spi_mosi	=> sd_mosi,
		spi_clk => spi_clk_int,
		spi_cs => sd_cs,
		spi_fromguest => spi_fromguest,
		spi_toguest => spi_toguest,
		spi_ss2 => spi_ss2,
		spi_ss3 => spi_ss3,
		spi_ss4 => spi_ss4,
		conf_data0 => conf_data0,
		
		-- PS/2 signals
		ps2k_clk_in => ps2_keyboard_clk_in,
		ps2k_dat_in => ps2_keyboard_dat_in,
		ps2k_clk_out => ps2_keyboard_clk_out,
		ps2k_dat_out => ps2_keyboard_dat_out,
		ps2m_clk_in => ps2_mouse_clk_in,
		ps2m_dat_in => ps2_mouse_dat_in,
		ps2m_clk_out => ps2_mouse_clk_out,
		ps2m_dat_out => ps2_mouse_dat_out,

		-- Buttons
		buttons => (0=>KEY0,others=>'1'),

		-- JOYSTICKS
		joy1 => joya,
		joy2 => joyb,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
);

end rtl;

