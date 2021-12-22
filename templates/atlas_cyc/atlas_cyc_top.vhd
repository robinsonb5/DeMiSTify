library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity atlas_top is
	generic (
		ATLAS_CYC_EAR : natural := 0; -- 0 = JOY SEL pin,	1 = EAR pin
		ATLAS_CYC_VGA : natural := 0  -- 0 = HDMI,  		1 = VGA
	);
	port (
		CLK12M : in std_logic;
		CLK_X  : in std_logic;
		KEY0   : in std_logic;
		LED    : out std_logic_vector(7 downto 0);
		-- SDRAM
		DRAM_CLK   : out std_logic;
		DRAM_CKE   : out std_logic;
		DRAM_ADDR  : out std_logic_vector(12 downto 0);
		DRAM_BA    : out std_logic_vector(1 downto 0);
		DRAM_DQ    : inout std_logic_vector(15 downto 0);
		DRAM_LDQM  : out std_logic;
		DRAM_UDQM  : out std_logic;
		DRAM_CS_N  : out std_logic;
		DRAM_WE_N  : out std_logic;
		DRAM_CAS_N : out std_logic;
		DRAM_RAS_N : out std_logic;
		-- HDMI TDMS [or VGA if ATLAS_CYC_VGA = 1]
		TMDS : out std_logic_vector(7 downto 0) := (others => '0');
		-- AUDIO
		SIGMA_R : out std_logic;
		SIGMA_L : out std_logic;
		-- -- I2S audio		
-- 		I2S_BCLK		: 	 out std_logic	:= '0';
-- 		I2S_LRCLK		: 	 out std_logic	:= '0';
-- 		I2S_DATA		: 	 out std_logic	:= '0';		
		-- PS2
		PS2_KEYBOARD_CLK : inout std_logic;
		PS2_KEYBOARD_DAT : inout std_logic;
		PS2_MOUSE_CLK    : inout std_logic;
		PS2_MOUSE_DAT    : inout std_logic;
		-- UART
		UART_RXD : in std_logic;
		UART_TXD : out std_logic;
		-- JOYSTICK 
		JOY1_B2_P9 : in std_logic;
		JOY1_B1_P6 : in std_logic;
		JOY1_UP    : in std_logic;
		JOY1_DOWN  : in std_logic;
		JOY1_LEFT  : in std_logic;
		JOY1_RIGHT : in std_logic;
		-- SHARED PIN_P11: JOY SELECT Output / EAR Input
		JOYX_SEL_EAR : inout std_logic := '0';
		-- SD Card
		SD_CS_N_O : out std_logic := '1';
		SD_SCLK_O : out std_logic := '0';
		SD_MOSI_O : out std_logic := '0';
		SD_MISO_I : in std_logic
	);
end entity;

architecture RTL of atlas_top is

	-- System clocks
	signal locked  : std_logic;
	signal reset_n : std_logic;

	-- SPI signals
	signal sd_clk  : std_logic;
	signal sd_cs   : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;

	-- internal SPI signals
	signal spi_toguest   : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2       : std_logic;
	signal spi_ss3       : std_logic;
	signal spi_ss4       : std_logic;
	signal conf_data0    : std_logic;
	signal spi_clk_int   : std_logic;

	-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in  : std_logic;
	signal ps2_keyboard_dat_in  : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

	-- PS/2 Mouse
	signal ps2_mouse_clk_in  : std_logic;
	signal ps2_mouse_dat_in  : std_logic;
	signal ps2_mouse_clk_out : std_logic;
	signal ps2_mouse_dat_out : std_logic;

	signal intercept : std_logic;

	-- Video
	signal vga_red   : std_logic_vector(7 downto 0);
	signal vga_green : std_logic_vector(7 downto 0);
	signal vga_blue  : std_logic_vector(7 downto 0);
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
--			CLOCK_27 : in std_logic;                    -- Comment out one of these two lines
			CLOCK_27 : in std_logic_vector(1 downto 0); -- to match the guest core
--			RESET_N :   IN std_logic;
			LED : out std_logic;
			-- SDRAM
			SDRAM_DQ   : inout std_logic_vector (15 downto 0);
			SDRAM_A    : out std_logic_vector (12 downto 0);
			SDRAM_DQML : out std_logic;
			SDRAM_DQMH : out std_logic;
			SDRAM_nWE  : out std_logic;
			SDRAM_nCAS : out std_logic;
			SDRAM_nRAS : out std_logic;
			SDRAM_nCS  : out std_logic;
			SDRAM_BA   : out std_logic_vector (1 downto 0);
			SDRAM_CLK  : out std_logic;
			SDRAM_CKE  : out std_logic;
			-- UART
			UART_TX : out std_logic;
			UART_RX : in std_logic;
			-- SPI
			SPI_DO : out std_logic;
			-- 		We can't do bi-directional signals here, so we need separate in and out signals.
			--		If the guest core uses direct mode for ROM upload it will need to be adapted.
--			SPI_SD_DI	:	 IN STD_LOGIC;
			SPI_DI     : in std_logic;
			SPI_SCK    : in std_logic;
			SPI_SS2    : in std_logic;
			SPI_SS3    : in std_logic;
--			SPI_SS4    : in std_logic;
			CONF_DATA0 : in std_logic;
			-- VGA
			VGA_HS    : out std_logic;
			VGA_VS    : out std_logic;
			VGA_R     : out std_logic_vector (5 downto 0);
			VGA_G     : out std_logic_vector (5 downto 0);
			VGA_B     : out std_logic_vector (5 downto 0);
				VGA_BLANK : out std_logic;
				VGA_CLK   : out std_logic;
				HDMI_CLK  : out std_logic;
				vga_x_r   : out std_logic_vector(5 downto 0);
				vga_x_g   : out std_logic_vector(5 downto 0);
				vga_x_b   : out std_logic_vector(5 downto 0);
				vga_x_hs  : out std_logic;
				vga_x_vs  : out std_logic
			-- AUDIO
				DAC_L   : out std_logic_vector (15 downto 0);
				DAC_R   : out std_logic_vector (15 downto 0);
			AUDIO_L : out std_logic;
			AUDIO_R : out std_logic
		);
	end component;


	-- -- I2S audio
	-- component audio_top is
	-- Port ( 	
	-- 		clk_50MHz : in STD_LOGIC; -- system clock
	-- 		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
	-- 		dac_LRCK : out STD_LOGIC;
	-- 		dac_SCLK : out STD_LOGIC;
	-- 		dac_SDIN : out STD_LOGIC;
	-- 		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (16-bit signed)
	-- 		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (16-bit signed) 
	-- );
	-- end component;	

	-- DAC AUDIO     
	signal dac_l : signed(15 downto 0);
	signal dac_r : signed(15 downto 0);
	--signal dac_l: std_logic_vector(15 downto 0);
	--signal dac_r: std_logic_vector(15 downto 0);
	--signal dac_l_s: signed(15 downto 0);
	--signal dac_r_s: signed(15 downto 0);

	-- I2S 
	signal i2s_mclk : std_logic;

	-- HDMI TDMS signas
	signal clock_vga_s    : std_logic;
	signal clock_dvi_s    : std_logic;
	signal sound_hdmi_l_s : std_logic_vector(15 downto 0);
	signal sound_hdmi_r_s : std_logic_vector(15 downto 0);
	signal tdms_r_s       : std_logic_vector(9 downto 0);
	signal tdms_g_s       : std_logic_vector(9 downto 0);
	signal tdms_b_s       : std_logic_vector(9 downto 0);
	signal tdms_p_s       : std_logic_vector(3 downto 0);
	signal tdms_n_s       : std_logic_vector(3 downto 0);

	-- VGA signals  [ ATLAS_CYC_VGA = 1]
	signal VGA_HS : std_logic;
	signal VGA_VS : std_logic;
	signal VGA_R  : std_logic_vector(1 downto 0);
	signal VGA_G  : std_logic_vector(1 downto 0);
	signal VGA_B  : std_logic_vector(1 downto 0);

	-- VIDEO signals
	signal vga_clk   : std_logic;
	signal hdmi_clk  : std_logic;
	signal vga_blank : std_logic;
	signal vga_x_r   : std_logic_vector(5 downto 0);
	signal vga_x_g   : std_logic_vector(5 downto 0);
	signal vga_x_b   : std_logic_vector(5 downto 0);
	signal vga_x_hs  : std_logic;
	signal vga_x_vs  : std_logic;


	signal clock_50M : std_logic;

	component pll2 is			-- for hdmi output & 50 MHz clock
	    port (
	--  areset : in std_logic;
	    inclk0 : in std_logic;
	    c0 : out std_logic;
	    c1 : out std_logic;
		c2 : out std_logic;
	    locked : out std_logic
	  );
	end component;

	-- SHARE PIN P11 EAR IN / JOY SEL OUT  
	signal EAR        : std_logic;
	signal JOYX_SEL_O : std_logic;

begin


	-- SPI
	SD_CS_N_O <= sd_cs;
	SD_MOSI_O <= sd_mosi;
	sd_miso   <= SD_MISO_I;
	SD_SCLK_O <= sd_clk;

	-- External devices tied to GPIOs
	ps2_mouse_dat_in <= ps2_mouse_dat;
	ps2_mouse_dat    <= '0' when ps2_mouse_dat_out = '0' else 'Z';
	ps2_mouse_clk_in <= ps2_mouse_clk;
	ps2_mouse_clk    <= '0' when ps2_mouse_clk_out = '0' else 'Z';

	ps2_keyboard_dat_in <= ps2_keyboard_dat;
	ps2_keyboard_dat    <= '0' when ps2_keyboard_dat_out = '0' else 'Z';
	ps2_keyboard_clk_in <= ps2_keyboard_clk;
	ps2_keyboard_clk    <= '0' when ps2_keyboard_clk_out = '0' else 'Z';

	PIN_P11_JOYSEL_1 : if ATLAS_CYC_EAR = 1 generate -- EAR Input
		EAR <= JOYX_SEL_EAR;
	end generate PIN_P11_JOYSEL_1;

	PIN_P11_JOYSEL_2 : if ATLAS_CYC_EAR = 0 generate -- JOY Select Output
		JOYX_SEL_O   <= '1';
		JOYX_SEL_EAR <= JOYX_SEL_O;
		EAR          <= '0';
	end generate PIN_P11_JOYSEL_2;

	joya <= "11" & JOY1_B2_P9 & JOY1_B1_P6 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;
	joyb <= (others => '1');
	joyc <= (others => '1');
	joyd <= (others => '1');

	-- -- I2S audio
	-- audio_i2s: audio_top
	-- port map(
	-- 	clk_50MHz => CLK12M,
	-- 	dac_MCLK  => i2s_mclk,
	-- 	dac_LRCK  => I2S_LRCLK,
	-- 	dac_SCLK  => I2S_BCLK,
	-- 	dac_SDIN  => I2S_DATA,
	-- 	L_data    => std_logic_vector(dac_l),
	-- 	R_data    => std_logic_vector(dac_r)
	-- );		


	-- BEGIN VGA ATLAS -------------------  
	VGA_R  <= vga_red(7 downto 6);
	VGA_G  <= vga_green(7 downto 6);
	VGA_B  <= vga_blue(7 downto 6);
	VGA_HS <= vga_hsync;
	VGA_VS <= vga_vsync;

	PINS_HDMI_VGA_1 : if ATLAS_CYC_VGA = 1 generate -- VGA
		TMDS(7) <= VGA_R(1);
		TMDS(6) <= VGA_R(0);
		TMDS(5) <= VGA_G(1);
		TMDS(4) <= VGA_G(0);
		TMDS(3) <= VGA_B(1);
		TMDS(2) <= VGA_B(0);
		TMDS(1) <= VGA_VS;
		TMDS(0) <= VGA_HS;
	end generate PINS_HDMI_VGA_1;
	-- END VGA ATLAS -------------------  


	-- PLL VIDEO / 50 MHz
	pllvideo : pll2
	port map (
		inclk0		=> CLK12M,				--      PAL       NTSC
		c0			=> clock_dvi_s,			-- x5	177.5     143.2
		c1			=> clock_vga_s,			-- x 	35.5      28.63
		c2			=> clock_50M,			-- 50 MHz
		locked		=> locked
	);


	-- BEGIN HDMI ATLAS -------------------   
	PINS_HDMI_VGA_2 : if ATLAS_CYC_VGA = 0 generate -- HDMI TDMS

		clock_vga_s <= vga_clk;
		clock_dvi_s <= hdmi_clk;

		-- HDMI AUDIO
		sound_hdmi_l_s <= dac_l;
		sound_hdmi_r_s <= dac_r;
		-- sound_hdmi_l_s <= '0' & std_logic_vector(dac_l(15 downto 1));
		-- sound_hdmi_r_s <= '0' & std_logic_vector(dac_r(15 downto 1));


		------------------------------------------------------------------------------------------------------
		-- JUST LEAVE ONE HDMI WRAPPER (1/2/3) UNCOMMENTED                                                  --
		-- SELECT PROJECT FILES FOR HDMI WRAPPER (1/2/3) AT DeMiSTify/Board/atlas_cyc/atlas_cyc_support.tcl --
		------------------------------------------------------------------------------------------------------
		

		---- BEGIN HDMI 1 NO SOUND (MULTICPM / Next186) 

		TMDS(6) <= '0';
		TMDS(4) <= '0';
		TMDS(2) <= '0';
		TMDS(0) <= '0';

		inst_hdmi : entity work.hdmi
			port map(
				-- clocks
				CLK_PIXEL_I => clock_vga_s,
				CLK_DVI_I   => clock_dvi_s,
				--components
				R_I        => vga_x_r & vga_x_r(4 downto 3),
				G_I        => vga_x_g & vga_x_g(4 downto 3),
				B_I        => vga_x_b & vga_x_b(4 downto 3),
				BLANK_I    => vga_blank,
				HSYNC_I    => vga_x_hs,
				VSYNC_I    => vga_x_vs,
				TMDS_D0_O  => TMDS(3),
				TMDS_D1_O  => TMDS(5),
				TMDS_D2_O  => TMDS(7),
				TMDS_CLK_O => TMDS(1)
			);

		---- END HDMI 1 


		----  BEGIN HDMI 2 (MSX)  

		-- hdmi: entity work.hdmi
		-- generic map (
		-- 	FREQ	=> 35480000,	-- pixel clock frequency 
		-- 	CTS		=> 35480,		-- CTS = Freq(pixclk) * N / (128 * Fs)
		-- 	-- FREQ	=> 28630000,	-- pixel clock frequency 
		-- 	-- CTS	=> 28630,		-- CTS = Freq(pixclk) * N / (128 * Fs)
		-- 	FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
		-- 	N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
		-- ) 
		-- port map (
		-- 	I_CLK_PIXEL		=> clock_vga_s,
		-- 	I_R				=> vga_x_r & vga_x_r(4 downto 3),
		-- 	I_G				=> vga_x_g & vga_x_g(4 downto 3),
		-- 	I_B				=> vga_x_b & vga_x_b(4 downto 3),
		-- 	I_BLANK			=> vga_blank,
		-- 	I_HSYNC			=> vga_x_hs,
		-- 	I_VSYNC			=> vga_x_vs,
		-- 	-- PCM audio
		-- 	I_AUDIO_ENABLE	=> '1',
		-- 	I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
		-- 	I_AUDIO_PCM_R	=> sound_hdmi_r_s,
		-- 	-- TMDS parallel pixel synchronous outputs (serialize LSB first)
		-- 	O_RED			=> tdms_r_s,
		-- 	O_GREEN			=> tdms_g_s,
		-- 	O_BLUE			=> tdms_b_s
		-- );

		-- hdmio: entity work.hdmi_out_altera
		-- port map (
		-- 	clock_pixel_i		=> clock_vga_s,
		-- 	clock_tdms_i		=> clock_dvi_s,
		-- 	red_i				=> tdms_r_s,
		-- 	green_i				=> tdms_g_s,
		-- 	blue_i				=> tdms_b_s,
		-- 	tmds_out_p			=> tdms_p_s,
		-- 	tmds_out_n			=> tdms_n_s
		-- );

		-- TMDS(7)	<= tdms_p_s(2);	-- 2+		
		-- TMDS(6)	<= tdms_n_s(2);	-- 2-		
		-- TMDS(5)	<= tdms_p_s(1);	-- 1+			
		-- TMDS(4)	<= tdms_n_s(1);	-- 1-		
		-- TMDS(3)	<= tdms_p_s(0);	-- 0+		
		-- TMDS(2)	<= tdms_n_s(0);	-- 0-	
		-- TMDS(1)	<= tdms_p_s(3);	-- CLK+	
		-- TMDS(0)	<= tdms_n_s(3);	-- CLK-

		---- END HDMI 2 


		---- BEGIN HDMI 3 (ATARI)    ok PAL, AUDIO 32k, 41k, 48k IS NOT GOOD, NTSC NOT TESTED

		-- inst_dvid: entity work.hdmi
		-- generic map (
		-- 	FREQ	=> 35480000,	-- pixel clock frequency 
		-- 	CTS		=> 35480,		-- CTS = Freq(pixclk) * N / (128 * Fs)
		-- 	FS		=> 41000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
		-- 	N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
		-- ) 
		-- port map(
		-- 	I_CLK_VGA	=> clock_vga_s,
		-- 	I_CLK_TMDS	=> clock_dvi_s,
		-- 	I_HSYNC		=> vga_x_hs,
		-- 	I_VSYNC		=> vga_x_vs,
		-- 	I_BLANK		=> vga_blank,
		-- 	I_RED		=> vga_x_r & vga_x_r(4 downto 3),
		-- 	I_GREEN		=> vga_x_g & vga_x_g(4 downto 3),
		-- 	I_BLUE		=> vga_x_b & vga_x_b(4 downto 3),
		-- 	I_AUDIO_PCM_L 	=> sound_hdmi_l_s,
		-- 	I_AUDIO_PCM_R	=> sound_hdmi_r_s,
		-- 	O_TMDS			=> TMDS
		-- );

		---- END HDMI 3 


		---- END HDMI PAL ATLAS 

	end generate PINS_HDMI_VGA_2;
	
	-- END HDMI ATLAS -------------------


	guest : component guest_mist
		port map(
--			CLOCK_27 => CLK12M,
			CLOCK_27 => CLK12M & CLK12M,
--			RESET_N => reset_n,
			LED => LED(0),
			--SDRAM
			SDRAM_DQ   => DRAM_DQ,
			SDRAM_A    => DRAM_ADDR,
			SDRAM_DQML => DRAM_LDQM,
			SDRAM_DQMH => DRAM_UDQM,
			SDRAM_nWE  => DRAM_WE_N,
			SDRAM_nCAS => DRAM_CAS_N,
			SDRAM_nRAS => DRAM_RAS_N,
			SDRAM_nCS  => DRAM_CS_N,
			SDRAM_BA   => DRAM_BA,
			SDRAM_CLK  => DRAM_CLK,
			SDRAM_CKE  => DRAM_CKE,
			--UART
			UART_TX  => UART_TXD,
			UART_RX  => UART_RXD,
--			UART_TX  => open,
--			UART_RX  => EAR,   
			--SPI
--			SPI_SD_DI => sd_miso,
			SPI_DO     => spi_fromguest,
			SPI_DI     => spi_toguest,
			SPI_SCK    => spi_clk_int,
			SPI_SS2    => spi_ss2,
			SPI_SS3    => spi_ss3,
--			SPI_SS4    => spi_ss4,
			CONF_DATA0 => conf_data0,
			--VGA
			VGA_HS    => vga_hsync,
			VGA_VS    => vga_vsync,
			VGA_R     => vga_red(7 downto 2),
			VGA_G     => vga_green(7 downto 2),
			VGA_B     => vga_blue(7 downto 2),
				VGA_BLANK => vga_blank,
				VGA_CLK   => vga_clk,
				HDMI_CLK  => hdmi_clk,
				vga_x_r   => vga_x_r,
				vga_x_g   => vga_x_g,
				vga_x_b   => vga_x_b,
				vga_x_hs  => vga_x_hs,
				vga_x_vs  => vga_x_vs,
			--AUDIO
				DAC_L   => dac_l,
				DAC_R   => dac_r,
			AUDIO_L => SIGMA_L,
			AUDIO_R => SIGMA_R
		);


		-- Pass internal signals to external SPI interface
		sd_clk <= spi_clk_int;

		controller : entity work.substitute_mcu
			generic map(
				sysclk_frequency => 500,
		--		SPI_FASTBIT=>3,			
		--		SPI_INTERNALBIT=>2,		--needed to avoid hungs on the OSD
				debug     => false,
				jtag_uart => false
			)
			port map(
				clk       => clock_50M,	
				reset_in  => KEY0,
				reset_out => reset_n,

				-- SPI signals
				spi_miso      => sd_miso,
				spi_mosi      => sd_mosi,
				spi_clk       => spi_clk_int,
				spi_cs        => sd_cs,
				spi_fromguest => spi_fromguest,
				spi_toguest   => spi_toguest,
				spi_ss2       => spi_ss2,
				spi_ss3       => spi_ss3,
				spi_ss4       => spi_ss4,
				conf_data0    => conf_data0,

				-- PS/2 signals
				ps2k_clk_in  => ps2_keyboard_clk_in,
				ps2k_dat_in  => ps2_keyboard_dat_in,
				ps2k_clk_out => ps2_keyboard_clk_out,
				ps2k_dat_out => ps2_keyboard_dat_out,
				ps2m_clk_in  => ps2_mouse_clk_in,
				ps2m_dat_in  => ps2_mouse_dat_in,
				ps2m_clk_out => ps2_mouse_clk_out,
				ps2m_dat_out => ps2_mouse_dat_out,

				-- Buttons
				buttons => (0 => KEY0, others => '1'),

				-- JOYSTICKS
				joy1 => joya,

				-- UART
				rxd       => rs232_rxd,
				txd       => rs232_txd,
				intercept => intercept
			);

	end rtl;
