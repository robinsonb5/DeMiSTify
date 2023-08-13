library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity unamiga_top is
	port
	(
		CLOCK_50	:	 IN STD_LOGIC;
		LEDS         :   OUT STD_LOGIC_VECTOR(1 downto 0);
		SDRAM_CLK		:	 OUT STD_LOGIC;
		SDRAM_CKE		:	 OUT STD_LOGIC;
		SDRAM_A		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		SDRAM_BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		SDRAM_DQ		:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		SDRAM_DQML		:	 OUT STD_LOGIC;
		SDRAM_DQMH		:	 OUT STD_LOGIC;
		SDRAM_nCS		:	 OUT STD_LOGIC;
		SDRAM_nWE		:	 OUT STD_LOGIC;
		SDRAM_nCAS		:	 OUT STD_LOGIC;
		SDRAM_nRAS		:	 OUT STD_LOGIC;
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		-- AUDIO
		AUDIO_R                     : OUT STD_LOGIC;
		AUDIO_L                     : OUT STD_LOGIC;
		-- PS2
		PS2_CLK            :    INOUT STD_LOGIC;
		PS2_DAT            :    INOUT STD_LOGIC;
		PS2_MCLK               :    INOUT STD_LOGIC;
		PS2_MDAT               :    INOUT STD_LOGIC;
		-- UART
		UART_RXD                    : in std_logic;
		UART_TXD                    : out std_logic;
		
		-- Joystick
		JOYA                        : in std_logic_vector (5 downto 0);
		JOYB                        : in std_logic_vector (5 downto 0);
		-- SD Card
		SD_CS                       : out   std_logic := '1';
		SD_SCK                      : out   std_logic := '0';
		SD_MOSI                     : out   std_logic := '0';
		SD_MISO                     : in    std_logic
	
	);
END entity;

architecture RTL of unamiga_top is
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

	
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
	
	signal intercept : std_logic;

-- Video
	signal vga_red: std_logic_vector(5 downto 0);
	signal vga_green: std_logic_vector(5 downto 0);
	signal vga_blue: std_logic_vector(5 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;
	
-- IO
	signal joy1 : std_logic_vector(7 downto 0);
	signal joy2 : std_logic_vector(7 downto 0);
	signal joy3 : std_logic_vector(7 downto 0);
	signal joy4 : std_logic_vector(7 downto 0);
	
-- DAC AUDIO
   signal dac_l: std_logic_vector(15 downto 0);
   signal dac_r: std_logic_vector(15 downto 0);	

begin




-- External devices tied to GPIOs
ps2_mouse_dat_in<=ps2_mdat;
ps2_mdat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mclk;
ps2_mclk <= '0' when ps2_mouse_clk_out='0' else 'Z';

ps2_keyboard_dat_in <=ps2_dat;
ps2_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=ps2_clk;
ps2_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';

	
joy1<="11" & JOYA(5) & JOYA(4) & JOYA(0) & JOYA(1) & JOYA(2) &JOYA(3);
joy2<="11" & JOYB(5) & JOYB(4) & JOYB(0) & JOYB(1) & JOYB(2) &JOYB(3);
joy3<=(others=>'1');
joy4<=(others=>'1');




VGA_R  <=vga_red;
VGA_G  <=vga_green;
VGA_B  <=vga_blue;
VGA_HS <=vga_hsync;
VGA_VS <=vga_vsync;


guest: COMPONENT  c16_guest
  port map (			
	CLOCK_27 => CLOCK_50,
    LED => LEDS(0),
	--SPI
	SPI_DO => spi_fromguest,
	SPI_DI => spi_toguest,
	SPI_SCK => spi_clk_int,
	SPI_SS2 => spi_ss2,
	SPI_SS3 => spi_ss3,
	SPI_SS4 => spi_ss4,
	CONF_DATA0 => conf_data0,
	--UART
	UART_TX  => UART_TXD,
	UART_RX  => UART_RXD,
	--SDRAM
	SDRAM_DQ => SDRAM_DQ,
	SDRAM_A => SDRAM_A,
	SDRAM_DQML => SDRAM_DQML,
	SDRAM_DQMH => SDRAM_DQMH,
	SDRAM_nWE => SDRAM_nWE,
	SDRAM_nCAS => SDRAM_nCAS,
	SDRAM_nRAS => SDRAM_nRAS,
	SDRAM_nCS => SDRAM_nCS,
	SDRAM_BA => SDRAM_BA,
	SDRAM_CLK => SDRAM_CLK,
	SDRAM_CKE => SDRAM_CKE,
	--AUDIO
    AUDIO_L => AUDIO_L,
    AUDIO_R => AUDIO_R,
	DAC_L   => dac_l,
	DAC_R   => dac_r,
	--VGA
	VGA_HS => vga_hsync,
	VGA_VS => vga_vsync,
	VGA_R => vga_red(5 downto 0),
	VGA_G => vga_green(5 downto 0),
	VGA_B => vga_blue(5 downto 0),
	PS2CLK => ps2_keyboard_clk_in or intercept,
   PS2DAT => ps2_keyboard_dat_in or intercept,
   c64_keys => (others=>'1'),
   tape_button_n => '1'
  );




-- Pass internal signals to external SPI interface
sd_sck <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
		--		SPI_FASTBIT=>3,
		--		SPI_INTERNALBIT=>2,		--needed if OSD hungs
		debug => false,
		jtag_uart => false
	)
	port map (
		clk => CLOCK_50,
		reset_in =>  '1',		--reset_in when 0
		reset_out => reset_n,	--reset_out when 0

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
		buttons => (others=>'1'),
		
        -- joy
		joy1 => joy1,
		joy2 => joy2,
		joy3 => joy3,
		joy4 => joy4,
		
		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd,
		intercept => intercept
);

end rtl;

