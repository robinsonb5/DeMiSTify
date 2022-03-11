library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity qmtech_cyclonev_a5_top is
	port
	(
		CLOCK_50		:	 IN STD_LOGIC;
		RESET_N : in std_logic;
		DRAM_CLK		:	 OUT STD_LOGIC;
		DRAM_CKE		:	 OUT STD_LOGIC;
		DRAM_ADDR		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		DRAM_BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		DRAM_DQ		:	 INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		DRAM_DQM		:	 OUT STD_LOGIC_vector(3 downto 0);
		DRAM_CS_N		:	 OUT STD_LOGIC;
		DRAM_WE_N		:	 OUT STD_LOGIC;
		DRAM_CAS_N		:	 OUT STD_LOGIC;
		DRAM_RAS_N		:	 OUT STD_LOGIC;
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		UART_RX : in STD_LOGIC;
		UART_TX : out std_logic;
		SD_CS : out std_logic;
		SD_CLK : out std_logic;
		SD_MISO : in std_logic;
		SD_MOSI : out std_logic
	);
END entity;

architecture RTL of qmtech_cyclonev_a5_top is
   constant reset_cycles : integer := 131071;
	
-- System clocks

	signal locked : std_logic;
	signal n_reset : std_logic;

--	signal slowclk : std_logic;
--	signal fastclk : std_logic;
--	signal pll_locked : std_logic;

-- internal SPI signals
	
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;
	
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

	signal joya : std_logic_vector(6 downto 0);
	signal joyb : std_logic_vector(6 downto 0);
	signal joyc : std_logic_vector(6 downto 0);
	signal joyd : std_logic_vector(6 downto 0);

	signal uart_rxd : std_logic;
	signal uart_txd : std_logic;

	COMPONENT throbber
		PORT
		(
			clk		:	 IN STD_LOGIC;
			reset_n		:	 IN STD_LOGIC;
			q		:	 OUT STD_LOGIC
		);
	END COMPONENT;
	signal act_led : std_logic;

begin

-- External devices tied to GPIOs
	
UART_TX<=rs232_txd;
rs232_rxd<=UART_RX;

joya<=(others=>'1');
joyb<=(others=>'1');
joyc<=(others=>'1');
joyd<=(others=>'1');

VGA_R<=vga_red(7 downto 3);
VGA_G<=vga_green(7 downto 2);
VGA_B<=vga_blue(7 downto 3);
VGA_HS<=vga_hsync;
VGA_VS<=vga_vsync;


-- Generate clocks

guest: COMPONENT sdramtest_top
	PORT map
	(
--		CLOCK_27 => MAX10_CLK2_50&MAX10_CLK2_50, -- Comment out one of these lines to match the guest core.
		CLOCK_27 => CLOCK_50,
--		RESET_N => n_reset,
		-- clocks
		SDRAM_DQ => DRAM_DQ(15 downto 0),
		SDRAM_A => DRAM_ADDR,
		SDRAM_DQML => DRAM_DQM(0),
		SDRAM_DQMH => DRAM_DQM(1),
		SDRAM_nWE => DRAM_WE_N,
		SDRAM_nCAS => DRAM_CAS_N,
		SDRAM_nRAS => DRAM_RAS_N,
		SDRAM_nCS => DRAM_CS_N,
		SDRAM_BA => DRAM_BA,
		SDRAM_CLK => DRAM_CLK,
		SDRAM_CKE => DRAM_CKE,
		
--		SPI_DO_IN => sd_mosi,
		SPI_DO => spi_fromguest,
		SPI_DI => spi_toguest,
		SPI_SCK => spi_clk_int,
		SPI_SS2	=> spi_ss2,
		SPI_SS3 => spi_ss3,
		SPI_SS4 => spi_ss4,
		
		CONF_DATA0 => conf_data0,

		VGA_HS => vga_hsync,
		VGA_VS => vga_vsync,
		VGA_R => vga_red(7 downto 2),
		VGA_G => vga_green(7 downto 2),
		VGA_B => vga_blue(7 downto 2)
--		AUDIO_L => sigma_l,
--		AUDIO_R => sigma_r
);

-- Pass internal signals to external SPI interface
SD_CLK <= spi_clk_int;

controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
		debug => true,
		jtag_uart => false
	)
	port map (
		clk => CLOCK_50,
		reset_in => RESET_N,
		reset_out => n_reset,

		-- SPI signals
		spi_miso => SD_MISO,
		spi_mosi	=> SD_MOSI,
		spi_clk => spi_clk_int,
		spi_cs => SD_CS,
		spi_fromguest => spi_fromguest,
		spi_toguest => spi_toguest,
		spi_ss2 => spi_ss2,
		spi_ss3 => spi_ss3,
		spi_ss4 => spi_ss4,
		conf_data0 => conf_data0,
		
		-- PS/2 signals
--		ps2k_clk_in => ps2_keyboard_clk_in,
--		ps2k_dat_in => ps2_keyboard_dat_in,
--		ps2k_clk_out => ps2_keyboard_clk_out,
--		ps2k_dat_out => ps2_keyboard_dat_out,
--		ps2m_clk_in => ps2_mouse_clk_in,
--		ps2m_dat_in => ps2_mouse_dat_in,
--		ps2m_clk_out => ps2_mouse_clk_out,
--		ps2m_dat_out => ps2_mouse_dat_out,

		buttons => (others=>'1'),

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
--		intercept => intercept
);

end rtl;

