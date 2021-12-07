library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity neptuno_top is
	port
	(
		clock_50_i	:	 IN STD_LOGIC;
		LED         :   OUT STD_LOGIC;
		DRAM_CLK		:	 OUT STD_LOGIC;
		DRAM_CKE		:	 OUT STD_LOGIC;
		DRAM_ADDR		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
		DRAM_BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		DRAM_DQ		:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		DRAM_LDQM		:	 OUT STD_LOGIC;
		DRAM_UDQM		:	 OUT STD_LOGIC;
		DRAM_CS_N		:	 OUT STD_LOGIC;
		DRAM_WE_N		:	 OUT STD_LOGIC;
		DRAM_CAS_N		:	 OUT STD_LOGIC;
		DRAM_RAS_N		:	 OUT STD_LOGIC;
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		-- AUDIO
		SIGMA_R                     : OUT STD_LOGIC;
		SIGMA_L                     : OUT STD_LOGIC;
				-- I2S audio		
		I2S_BCLK				: out   std_logic								:= '0';
		I2S_LRCLK			: out   std_logic								:= '0';
		I2S_DATA				: out   std_logic								:= '0';		
      
		-- JOYSTICK 
		JOY_CLK				: out   std_logic;
		JOY_LOAD 			: out   std_logic;
		JOY_DATA 			: in    std_logic;
		joyP7_o			   : out   std_logic								:= '1';

		-- PS2
		PS2_KEYBOARD_CLK            :    INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT            :    INOUT STD_LOGIC;
		PS2_MOUSE_CLK               :    INOUT STD_LOGIC;
		PS2_MOUSE_DAT               :    INOUT STD_LOGIC;
		-- UART
		AUDIO_INPUT                 : IN STD_LOGIC;
		--STM32
      stm_rx_o            : out std_logic     := 'Z'; -- stm RX pin, so, is OUT on the slave
      stm_tx_i            : in  std_logic     := 'Z'; -- stm TX pin, so, is IN on the slave
      stm_rst_o           : out std_logic     := 'Z'; -- '0' to hold the microcontroller reset line, to free the SD card

		-- SD Card
		sd_cs_n_o                      : out   std_logic := '1';
		sd_sclk_o                      : out   std_logic := '0';
		sd_mosi_o                      : out   std_logic := '0';
		sd_miso_i                      : in    std_logic
	
	);
END entity;

architecture RTL of neptuno_top is
	
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


component guest_mist
    port (
    CLOCK_27 : in std_logic_vector (1 downto 0);
    LED : out std_logic;
	-- SPI
    SPI_DO : out std_logic;
    SPI_DI : in std_logic;
    SPI_SCK : in std_logic;
    SPI_SS2 : in std_logic;
    SPI_SS3 : in std_logic;
    SPI_SS4 : in std_logic;
    CONF_DATA0 : in std_logic;
	-- SDRAM
    SDRAM_DQ : inout std_logic_vector (15 downto 0);
    SDRAM_A : out std_logic_vector (12 downto 0);
    SDRAM_DQML : out std_logic;
    SDRAM_DQMH : out std_logic;
    SDRAM_nWE : out std_logic;
    SDRAM_nCAS : out std_logic;
    SDRAM_nRAS : out std_logic;
    SDRAM_nCS : out std_logic;
    SDRAM_BA : out std_logic_vector (1 downto 0);
    SDRAM_CLK : out std_logic;
    SDRAM_CKE : out std_logic;
	-- AUDIO
    AUDIO_L : out std_logic;
    AUDIO_R : out std_logic;
	DAC_L           : OUT SIGNED(15 DOWNTO 0);
    DAC_R           : OUT SIGNED(15 DOWNTO 0);
	-- VGA
    VGA_HS : out std_logic;
    VGA_VS : out std_logic;
    VGA_R : out std_logic_vector (5 downto 0);
    VGA_G : out std_logic_vector (5 downto 0);
    VGA_B : out std_logic_vector (5 downto 0)
  );
end component;

component audio_top is
Port ( 	
		clk_50MHz : in STD_LOGIC; -- system clock (50 MHz)
		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
		dac_LRCK : out STD_LOGIC;
		dac_SCLK : out STD_LOGIC;
		dac_SDIN : out STD_LOGIC;
		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (15-bit signed)
		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (15-bit signed) 
);
end component;	

-- DAC AUDIO     
signal dac_l: signed(15 downto 0);
signal dac_r: signed(15 downto 0);

--signal audio_l_s			: std_logic_vector(15 downto 0);
--signal audio_r_s			: std_logic_vector(15 downto 0);


component joydecoder is
Port ( 	
		clk 			: in std_logic; 
		joy_data    : in std_logic;
		joy_clk		: out std_logic;
		joy_load_n	: out std_logic;
		joy1up		: out std_logic;
		joy1down		: out std_logic;
		joy1left		: out std_logic;
		joy1right	: out std_logic;
		joy1fire1	: out std_logic;
		joy1fire2	: out std_logic;
		joy2up		: out std_logic;
		joy2down		: out std_logic;
		joy2left		: out std_logic;
		joy2right	: out std_logic;
		joy2fire1	: out std_logic;
		joy2fire2	: out std_logic
);
end component;

-- JOYSTICKS
	signal joy1up			: std_logic								:= '1';
	signal joy1down		: std_logic								:= '1';
	signal joy1left		: std_logic								:= '1';
	signal joy1right		: std_logic								:= '1';
	signal joy1fire1		: std_logic								:= '1';
	signal joy1fire2		: std_logic								:= '1';
	signal joy2up			: std_logic								:= '1';
	signal joy2down		: std_logic								:= '1';
	signal joy2left		: std_logic								:= '1';
	signal joy2right		: std_logic								:= '1';
	signal joy2fire1		: std_logic								:= '1';
	signal joy2fire2		: std_logic								:= '1';
	signal clk_sys_out   : std_logic;
	-- i2s 
	signal i2s_mclk		    : std_logic;
	
begin


-- SPI

sd_cs_n_o<=sd_cs;
sd_mosi_o<=sd_mosi;
sd_miso<=sd_miso_i;
sd_sclk_o<=sd_clk;



-- External devices tied to GPIOs

ps2_mouse_dat_in<=ps2_mouse_dat;
ps2_mouse_dat <= '0' when ps2_mouse_dat_out='0' else 'Z';
ps2_mouse_clk_in<=ps2_mouse_clk;
ps2_mouse_clk <= '0' when ps2_mouse_clk_out='0' else 'Z';

ps2_keyboard_dat_in <=ps2_keyboard_dat;
ps2_keyboard_dat <= '0' when ps2_keyboard_dat_out='0' else 'Z';
ps2_keyboard_clk_in<=ps2_keyboard_clk;
ps2_keyboard_clk <= '0' when ps2_keyboard_clk_out='0' else 'Z';
	


joya<="11" & joy1fire2 & joy1fire1 & joy1right & joy1left & joy1down & joy1up;
joyb<="11" & joy2fire2 & joy2fire1 & joy2right & joy2left & joy2down & joy2up;

stm_rst_o <= '0';

--process(clk_sys)
--begin
--	if rising_edge(clk_sys) then
		VGA_R<=vga_red(7 downto 3);
		VGA_G<=vga_green(7 downto 3);
		VGA_B<=vga_blue(7 downto 3);
		VGA_HS<=vga_hsync;
		VGA_VS<=vga_vsync;
--	end if;
--end process;

-- I2S audio
	
audio_i2s: entity work.audio_top
port map(
	clk_50MHz => clock_50_i,
	dac_MCLK  => I2S_MCLK,
	dac_LRCK  => I2S_LRCLK,
	dac_SCLK  => I2S_BCLK,
	dac_SDIN  => I2S_DATA,
	L_data    => std_logic_vector(dac_l),
	R_data    => std_logic_vector(dac_r)
);		

--audio_l_s <= '0' & DAC_L & "00000";
--audio_r_s <= '0' & DAC_R & "00000";

	-- JOYSTICKS
joy: joydecoder
	  port map (
		clk				=> clock_50_i,
		joy_clk			=> JOY_CLK,
		joy_load_n 		=> JOY_LOAD,
		joy_data			=> JOY_DATA,		
		joy1up  			=> joy1up,
		joy1down			=> joy1down,
		joy1left			=> joy1left,
		joy1right		=> joy1right,
		joy1fire1		=> joy1fire1,
		joy1fire2		=> joy1fire2,
		joy2up  			=> joy2up,
		joy2down			=> joy2down,
		joy2left			=> joy2left,
		joy2right		=> joy2right,
		joy2fire1		=> joy2fire1,
		joy2fire2		=> joy2fire2
	);
	

guest: COMPONENT  guest_mist
  port map (
    CLOCK_27 => clock_50_i&clock_50_i,
    LED => LED,
	--SPI
	SPI_DO => spi_fromguest,
	SPI_DI => spi_toguest,
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
	VGA_B => vga_blue(7 downto 2)
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
		clk => clock_50_i,
		reset_in =>  '1',
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

		buttons => (others=>'1'),
		
		-- JOYSTICKS
		joy1 => joya,
		joy2 => joyb,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
);

end rtl;

