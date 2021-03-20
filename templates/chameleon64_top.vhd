-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Toplevel file for Turbo Chameleon 64
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity chameleon64_top is
	generic (
		resetCycles: integer := 131071
	);
	port (
-- Clocks
		clk8 : in std_logic;
		phi2_n : in std_logic;
		dotclock_n : in std_logic;

-- Bus
		romlh_n : in std_logic;
		ioef_n : in std_logic;

-- Buttons
		freeze_n : in std_logic;

-- MMC/SPI
		spi_miso : in std_logic;
		mmc_cd_n : in std_logic;
		mmc_wp : in std_logic;

-- MUX CPLD
		mux_clk : out std_logic;
		mux : out unsigned(3 downto 0);
		mux_d : out unsigned(3 downto 0);
		mux_q : in unsigned(3 downto 0);

-- USART
		usart_tx : in std_logic;
		usart_clk : in std_logic;
		usart_rts : in std_logic;
		usart_cts : in std_logic;

-- SDRam
		ram_clk : out std_logic;
		ram_data : inout std_logic_vector(15 downto 0);
		ram_addr : out std_logic_vector(12 downto 0);
		ram_we_n : out std_logic;
		ram_ras_n : out std_logic;
		ram_cas_n : out std_logic;
		ram_ba_0 : out std_logic;
		ram_ba_1 : out std_logic;
		ram_ldqm : out std_logic;
		ram_udqm : out std_logic;

-- Video
		red : out unsigned(4 downto 0);
		grn : out unsigned(4 downto 0);
		blu : out unsigned(4 downto 0);
		hsync_n : out std_logic;
		vsync_n : out std_logic;

-- Audio
		sigma_l : out std_logic;
		sigma_r : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon64_top is
   constant reset_cycles : integer := 131071;
	
-- System clocks
	signal clk_100 : std_logic;
	signal clk_50 : std_logic;
	signal pll_locked : std_logic;
	
-- Global signals
	signal reset_8 : std_logic;
	signal reset_100 : std_logic;
	signal reset : std_logic;
	signal reset_n : std_logic;
	signal reset_core : std_logic;
	
-- MUX
	signal mux_clk_reg : std_logic := '0';
	signal mux_reg : unsigned(3 downto 0) := (others => '1');
	signal mux_d_reg : unsigned(3 downto 0) := (others => '1');
	signal mux_d_regd : unsigned(3 downto 0) := (others => '1');
	signal mux_regd : unsigned(3 downto 0) := (others => '1');

-- LEDs
	signal led_green : std_logic;
	signal led_red : std_logic;
	signal socleds : std_logic_vector(7 downto 0);

-- PS/2 Keyboard
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

-- SD card
	signal spi_mosi : std_logic;
	signal mmc_cs : std_logic;
	signal spi_clk : std_logic;
	signal spi_raw_ack : std_logic;
	signal spi_raw_ack_d : std_logic;
	signal spi_ack : std_logic;

-- internal SPI signals
	
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;
	
-- RTC

	signal rtc_cs : std_logic;
	
-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;
	signal midi_rxd : std_logic;
	signal midi_txd : std_logic;

-- IO
	signal ena_1mhz : std_logic;
	signal button_reset_n : std_logic;

	signal power_button : std_logic;
	signal play_button : std_logic;

	signal no_clock : std_logic;
	signal docking_station : std_logic;
	signal c64_keys : unsigned(63 downto 0);
	signal c64_restore_key_n : std_logic;
	signal c64_nmi_n : std_logic;
	signal c64_joy1 : unsigned(6 downto 0);
	signal c64_joy2 : unsigned(6 downto 0);
	signal joystick3 : unsigned(6 downto 0);
	signal joystick4 : unsigned(6 downto 0);
	signal cdtv_joya : unsigned(5 downto 0);
	signal cdtv_joyb : unsigned(5 downto 0);
	signal joy1 : unsigned(7 downto 0);
	signal joy2 : unsigned(7 downto 0);
	signal joy3 : unsigned(7 downto 0);
	signal joy4 : unsigned(7 downto 0);
	signal usart_rx : std_logic:='1'; -- Safe default
	signal ir : std_logic;
	
	signal amiga_reset_n : std_logic;
	signal amiga_key : unsigned(7 downto 0);
	signal amiga_key_stb : std_logic;

	signal vga_csync : std_logic;
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;
	signal vga_red : std_logic_vector(7 downto 0);
	signal vga_green : std_logic_vector(7 downto 0);
	signal vga_blue : std_logic_vector(7 downto 0);
	
	signal red_dithered :unsigned(7 downto 0);
	signal grn_dithered :unsigned(7 downto 0);
	signal blu_dithered :unsigned(7 downto 0);
	signal hsync_n_dithered : std_logic;
	signal vsync_n_dithered : std_logic;

	-- Declare guest component, since it's written in systemverilog
	
	COMPONENT NES_mist
		PORT
		(
			CLOCK_27 :	IN STD_LOGIC_VECTOR(1 downto 0);
	--		RESET_N :   IN std_logic;
			SDRAM_DQ		:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			SDRAM_A		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
			SDRAM_DQML		:	 OUT STD_LOGIC;
			SDRAM_DQMH		:	 OUT STD_LOGIC;
			SDRAM_nWE		:	 OUT STD_LOGIC;
			SDRAM_nCAS		:	 OUT STD_LOGIC;
			SDRAM_nRAS		:	 OUT STD_LOGIC;
			SDRAM_nCS		:	 OUT STD_LOGIC;
			SDRAM_BA		:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			SDRAM_CLK		:	 OUT STD_LOGIC;
			SDRAM_CKE		:	 OUT STD_LOGIC;
			SPI_DO		:	 OUT STD_LOGIC;
	--		SPI_SD_DI	:	 IN STD_LOGIC;
			SPI_DI		:	 IN STD_LOGIC;
			SPI_SCK		:	 IN STD_LOGIC;
			SPI_SS2		:	 IN STD_LOGIC;
			SPI_SS3		:	 IN STD_LOGIC;
			SPI_SS4		:	 IN STD_LOGIC;
			CONF_DATA0		:	 IN STD_LOGIC;
			VGA_HS		:	 OUT STD_LOGIC;
			VGA_VS		:	 OUT STD_LOGIC;
			VGA_R		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			VGA_B		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			AUDIO_L  : out std_logic;
			AUDIO_R  : out std_logic
		);
	END COMPONENT;
	
	signal vol_up : std_logic;
	signal vol_down : std_logic;
	signal cdtv_port : std_logic;

	signal keys_safe : std_logic;
	signal c64_menu : std_logic;
	signal gp1_run : std_logic;
	signal gp1_select :std_logic;
	signal gp2_run : std_logic;
	signal gp2_select : std_logic;

	signal porta_start : std_logic;
	signal porta_select : std_logic;
	signal portb_start : std_logic;
	signal portb_select : std_logic;

begin

-- -----------------------------------------------------------------------
-- Clocks and PLL
-- -----------------------------------------------------------------------

	clocks: entity work.hostclocks
		port map
		(
			inclk0 => clk8,
			c0 => clk_100,
			c1 => clk_50,
			locked => pll_locked	
		);

	my1mhz : entity work.chameleon_1mhz
		generic map (
			-- Timer calibration. Clock speed in Mhz.
			clk_ticks_per_usec => 100
		)
		port map(
			clk => clk_100,
			ena_1mhz => ena_1mhz
		);

	-- Reset handling

	myReset : entity work.gen_reset
		generic map (
			resetCycles => reset_cycles
		)
		port map (
			clk => clk8,
			enable => '1',
			button => not (pll_locked and button_reset_n),
			reset => reset_8
		);
		
	process(clk_100,reset_8)
	begin
		if rising_edge(clk_100) then
			reset_100<=reset_8;
			reset<=reset_100;
		end if;
	end process;
	
	-- IO handling
	
	myIO : entity work.chameleon_io
		generic map (
			enable_docking_station => true,
			enable_docking_irq => true,
			enable_c64_joykeyb => true,
			enable_c64_4player => true,
			enable_raw_spi => true,
			enable_iec_access =>true
		)
		port map (
		-- Clocks
			clk => clk_100,
			clk_mux => clk_100,
			ena_1mhz => ena_1mhz,
			reset => reset,
			
			no_clock => no_clock,
			docking_station => docking_station,
			
		-- Chameleon FPGA pins
			-- C64 Clocks
			phi2_n => phi2_n,
			dotclock_n => dotclock_n, 
			-- C64 cartridge control lines
			io_ef_n => ioef_n,
			rom_lh_n => romlh_n,
			-- SPI bus
			spi_miso => spi_miso,
			-- CPLD multiplexer
			mux_clk => mux_clk,
			mux => mux,
			mux_d => mux_d,
			mux_q => mux_q,
			
			to_usb_rx => usart_rx,

		-- SPI raw signals (enable_raw_spi must be set to true)
			rtc_cs => rtc_cs,
			mmc_cs_n => mmc_cs,
			spi_raw_clk => spi_clk,
			spi_raw_mosi => spi_mosi,
			spi_raw_ack => spi_raw_ack,

		-- LEDs
			led_green => led_green,
			led_red => led_red,
			ir => ir,
		
		-- PS/2 Keyboard
			ps2_keyboard_clk_out => ps2_keyboard_clk_out,
			ps2_keyboard_dat_out => ps2_keyboard_dat_out,
			ps2_keyboard_clk_in => ps2_keyboard_clk_in,
			ps2_keyboard_dat_in => ps2_keyboard_dat_in,
	
		-- PS/2 Mouse
			ps2_mouse_clk_out => ps2_mouse_clk_out,
			ps2_mouse_dat_out => ps2_mouse_dat_out,
			ps2_mouse_clk_in => ps2_mouse_clk_in,
			ps2_mouse_dat_in => ps2_mouse_dat_in,

		-- Buttons
			button_reset_n => button_reset_n,

		-- Joysticks
			joystick1 => c64_joy1,
			joystick2 => c64_joy2,
			joystick3 => joystick3, 
			joystick4 => joystick4,

		-- Keyboards
			keys => c64_keys,
			restore_key_n => c64_restore_key_n,
			c64_nmi_n => c64_nmi_n,

			amiga_reset_n => amiga_reset_n,
			amiga_trigger => amiga_key_stb,
			amiga_scancode => amiga_key,

			midi_txd => midi_txd,
			midi_rxd => midi_rxd,

			iec_atn_out => rs232_txd,
			iec_clk_in => rs232_rxd
--			iec_clk_out : in std_logic := '1';
--			iec_dat_out : in std_logic := '1';
--			iec_srq_out : in std_logic := '1';
--			iec_dat_in : out std_logic;
--			iec_atn_in : out std_logic;
--			iec_srq_in : out std_logic
	
		);

	-- Widen the SPI ack pulse		
	process(clk_100,spi_raw_ack,spi_raw_ack_d)
	begin
		if rising_edge(clk_100) then
			spi_raw_ack_d <= spi_raw_ack;
		end if;
		spi_ack <= spi_raw_ack or spi_raw_ack_d;
	end process;

	cdtv : entity work.chameleon_cdtv_remote
	port map(
		clk => clk_100,
		ena_1mhz => ena_1mhz,
		ir => ir,
		key_power => power_button,
		key_play => play_button,
		joystick_a => cdtv_joya,
		joystick_b => cdtv_joyb,
		key_vol_up => vol_up,
		key_vol_dn => vol_down,
		currentport => cdtv_port
	);

	rtc_cs<='0';

	keys_safe <= '1' when c64_joy1="1111111" else '0';

	-- Update c64 keys only when the joystick isn't active.
	process (clk_100)
	begin
		if rising_edge(clk_100) then
			if keys_safe='1' then
				gp1_run <= c64_keys(62); -- Return
				gp1_select <= c64_keys(11); -- Right shift
				gp2_run <= c64_keys(0); -- Run/stop
				gp2_select <= c64_keys(48); -- Left shift;
				c64_menu <= c64_keys(54); -- Up arrow;
			end if;
		end if;
	end process;
	
	porta_start <= cdtv_port or ((not play_button) and gp1_run);
	porta_select <= (cdtv_port or ((not vol_up) and gp1_select)) and c64_joy1(6);

	portb_start <= (not cdtv_port) or ((not play_button) and gp2_run);
	portb_select <= ((not cdtv_port) or ((not vol_up) and gp2_select)) and c64_joy2(6);

	joy1<=porta_start & porta_select & (c64_joy1(5 downto 0) and cdtv_joya);
	joy2<=portb_start & portb_select & (c64_joy2(5 downto 0) and cdtv_joyb);
	joy3<="1" & joystick3;
	joy4<="1" & joystick4;

	-- Guest core
	
	midi_txd<='1';

	guest: COMPONENT NES_mist
	PORT map
	(
			CLOCK_27 => clk8&clk8,
--			RESET_N => reset_n,
			-- clocks
			
			-- SDRAM
			SDRAM_DQ => ram_data,
			SDRAM_A => ram_addr,
			SDRAM_DQML => ram_ldqm,
			SDRAM_DQMH => ram_udqm,
			SDRAM_nWE => ram_we_n,
			SDRAM_nCAS => ram_cas_n,
			SDRAM_nRAS => ram_ras_n,
--			SDRAM_nCS => ram_cs_n,	-- Hardwired on TC64
			SDRAM_BA(0) => ram_ba_0,
			SDRAM_BA(1) => ram_ba_1,
			SDRAM_CLK => ram_clk,
--			SDRAM_CKE => ram_cke, -- Hardwired on TC64

			-- SPI interface to control module
--			SPI_SD_DI => spi_miso,
			SPI_DO => spi_fromguest,
			SPI_DI => spi_toguest,
			SPI_SCK => spi_clk_int,
			SPI_SS2	=> spi_ss2,
			SPI_SS3 => spi_ss3,
			SPI_SS4	=> spi_ss4,			
			CONF_DATA0 => conf_data0,
			-- Video output
			VGA_HS => vga_hsync,
			VGA_VS => vga_vsync,
			VGA_R => vga_red(7 downto 2),
			VGA_G => vga_green(7 downto 2),
			VGA_B => vga_blue(7 downto 2),
			-- Audio output
			AUDIO_L => sigma_l,
			AUDIO_R => sigma_r
	);
	
	
	-- Register video outputs, invert sync for Chameleon V1 hardware
	
--	process(clk_sys)
--	begin
--		if rising_edge(clk_sys) then
			red<=unsigned(vga_red(7 downto 3));
			grn<=unsigned(vga_green(7 downto 3));
			blu<=unsigned(vga_blue(7 downto 3));
			hsync_n<=not vga_hsync;
			vsync_n<=not vga_vsync;
--		end if;
--	end process;


	-- Pass internal signals to external SPI interface
	spi_clk <= spi_clk_int;

	controller : entity work.substitute_mcu
	generic map (
		sysclk_frequency => 500,
		debug => false
	)
	port map (
		clk => clk_50,
		reset_in => not reset,
		reset_out => reset_n,

		-- SPI signals
		spi_miso => spi_miso,
		spi_mosi	=> spi_mosi,
		spi_clk => spi_clk_int,
		spi_cs => mmc_cs,
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

		-- Joysticks
		
		joy1 => std_logic_vector(joy1(7 downto 6)&joy1(4)&joy1(5)&joy1(3 downto 0)), -- Swap buttons A & B
		joy2 => std_logic_vector(joy2(7 downto 6)&joy2(4)&joy2(5)&joy2(3 downto 0)), -- Swap buttons A & B
		joy3 => std_logic_vector(joy3),
		joy4 => std_logic_vector(joy4),

		menu_button => usart_cts and not power_button,

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
	);

end architecture;
