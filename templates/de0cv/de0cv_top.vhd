library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;
    use ieee.numeric_std.all;

library work;
    use work.demistify_config_pkg.all;

entity de0cv_top is
	generic (
		debug7Disp : boolean := false;
		debug : boolean := false;
		jtag_uart : boolean := false;
		spirtc : boolean := false;
		sysclk_frequency : integer := 500; -- Sysclk frequency * 10
		SPI_SLOWBIT : integer := 6;  -- ~384KHz when sysclk is 50MHz
		SPI_FASTBIT : integer := 2 ; -- ~5MHz when sysclk is 50MHz
		SPI_INTERNALBIT : integer := 1; -- Full speed when 0, half speed when 1
		SPI_EXTERNALCLK : boolean := false
	);
	port(

		-- Clock, Reset ports
		CLOCK_50		: in	std_logic;							-- FPGA Clock ... 50.00MHz
        CLOCK2_50		: in	std_logic;							-- FPGA Clock ... 50.00MHz
		CLOCK3_50		: in	std_logic;							-- FPGA Clock ... 50.00MHz
		CLOCK4_50		: in	std_logic;							-- FPGA Clock ... 50.00MHz        

		KEY4_RESET_N	: in	std_logic;


		-- SD-RAM ports
		pMemClk			: out	std_logic;							-- SD-RAM Clock
		pMemCke			: out	std_logic;							-- SD-RAM Clock enable
		pMemCs_n		: out	std_logic;							-- SD-RAM Chip select
		pMemRas_n		: out	std_logic;							-- SD-RAM Row/RAS
		pMemCas_n		: out	std_logic;							-- SD-RAM /CAS
		pMemWe_n		: out	std_logic;							-- SD-RAM /WE
		pMemUdq			: out	std_logic;							-- SD-RAM UDQM
		pMemLdq			: out	std_logic;							-- SD-RAM LDQM
		pMemBa			: out   std_logic_vector(1 downto 0);       -- SD-RAM Bank select
		pMemAdr			: out	std_logic_vector( 12 downto 0 );	-- SD-RAM Address
		pMemDat			: inout std_logic_vector( 15 downto 0 );	-- SD-RAM Data

		-- PS/2 keyboard ports
		pPs2Clk			: inout std_logic;
		pPs2Dat			: inout std_logic;

		-- PS/2 mouse ports
        pPs2mClk		: inout std_logic;
		pPs2mDat		: inout std_logic;


		-- SD/MMC slot ports
        pSd_Ck			: out	std_logic;							-- pin 5
		pSd_Cm			: out	std_logic;							-- pin 2
		pSd_Dt			: inout std_logic_vector(  3 downto 0);		-- pin 1(D3), 9(D2), 8(D1), 7(D0)


		-- DIP switch, Lamp ports
		pSW				: in	std_logic_vector(  3 downto 0);		-- 0=press, 1=unpress
		pDip			: in	std_logic_vector(  9 downto 0);		-- 0=On, 1=Off (default on shipment)
		pLed			: out	std_logic_vector(  9 downto 0);		-- 0=Off, 1=On (green)

		p7SegLed0		: out	std_logic_vector(  6 downto 0);
		p7SegLed1		: out	std_logic_vector(  6 downto 0);
		p7SegLed2		: out	std_logic_vector(  6 downto 0);
		p7SegLed3		: out	std_logic_vector(  6 downto 0);
		p7SegLed4		: out	std_logic_vector(  6 downto 0);
		p7SegLed5		: out	std_logic_vector(  6 downto 0);


        
		-- Video, Audio/CMT ports

      -- I2S Audio ((TODO define Pins or change Pin Assign)
      I2S_MCK	: out std_logic; --I2S_MCK
      I2S_SCK  : out std_logic; --I2S_SCK
      I2S_LR   : out std_logic; --I2S_LR
      I2S_D    : out std_logic; --I2S_D    

		pDac_VR			: out std_logic_vector(  3 downto 0);		-- RGB_Red / Svideo_C
		pDac_VG			: out std_logic_vector(  3 downto 0);		-- RGB_Grn / Svideo_Y
		pDac_VB			: out std_logic_vector(  3 downto 0);		-- RGB_Blu / CompositeVideo

		pVideoHS_n		: out	std_logic;							-- Csync(RGB15K), HSync(VGA31K)
		pVideoVS_n		: out	std_logic							-- Audio(RGB15K), VSync(VGA31K)
         
	);
END de0cv_top;

architecture RTL of de0cv_top is
   constant reset_cycles : integer := 131071;
	
-- System clocks
	signal locked : std_logic;
	signal reset_n : std_logic;

--	signal slowclk : std_logic;
--	signal fastclk : std_logic;
--	signal pll_locked : std_logic;

-- SPI signals
	signal sd_clk : std_logic;
	signal sd_cs : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;

-- internal SPI signals
	signal spi_do : std_logic;
	signal spi_toguest : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2 : std_logic;
	signal spi_ss3 : std_logic;
	signal spi_ss4 : std_logic;
	signal conf_data0 : std_logic;
	signal spi_clk_int : std_logic;

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

	signal intercept : std_logic;

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

	-- I2S
	signal i2s_Mck_o : std_logic;
	signal i2s_Sck_o : std_logic;
	signal i2s_Lr_o  : std_logic;
	signal i2s_D_o   : std_logic;

	-- DAC AUDIO     
	signal dac_l : signed(12 downto 0);
	signal dac_r : signed(12 downto 0);    
    
	component audio_top is
		port (
			clk_50MHz : in std_logic;  -- system clock (50 MHz)
			dac_MCLK  : out std_logic; -- outputs to I2S DAC
			dac_LRCK  : out std_logic;
			dac_SCLK  : out std_logic;
			dac_SDIN  : out std_logic;
			L_data    : in std_logic_vector(15 downto 0); -- LEFT data (16-bit signed)
			R_data    : in std_logic_vector(15 downto 0)  -- RIGHT data (16-bit signed) 
		);
	end component;    

    --Debug 
    
    --Signal Freq

    signal Freq_o   : std_logic_vector(15 downto 0);
    signal Count    : std_logic_vector( 5 downto 0) := "000000";

	component clock_freq_counter is
		port (
            i_clk_ref            : in  std_logic;
            i_clk_test           : in  std_logic;
            i_rstb               : in  std_logic;
            o_clock_freq         : out std_logic_vector(15 downto 0)
        );
	end component;    

  	component Seven_Seg_Driver is
		port (
            Data_in: in  STD_LOGIC_VECTOR (3 downto 0);
            LED: out STD_LOGIC_VECTOR (6 downto 0)
        );
	end component;    

    -- DE0CV target guest_top template signals
	alias clock_input 			: std_logic is CLOCK_50;

begin


	--PS2
	-- External devices tied to GPIOs
	ps2_mouse_dat_in <= pPs2mDat;
	pPs2mDat    <= '0' when ps2_mouse_dat_out = '0' else 'Z';
	ps2_mouse_clk_in <= pPs2mClk;
	pPs2mClk    <= '0' when ps2_mouse_clk_out = '0' else 'Z';

	ps2_keyboard_dat_in <= pPs2Dat;
	pPs2Dat    <= '0' when ps2_keyboard_dat_out = '0' else 'Z';
	ps2_keyboard_clk_in <= pPs2Clk;
	pPs2Clk    <= '0' when ps2_keyboard_clk_out = '0' else 'Z';

	--Video Assign Pins    
    pDac_VR<=vga_red(7 downto 4);
    pDac_VG<=vga_green(7 downto 4);
    pDac_VB<=vga_blue(7 downto 4);
    pVideoHS_n<=vga_hsync;
    pVideoVS_n<=vga_vsync;


	-- AUDIO CODEC
	audio_i2s : entity work.audio_top
		port map(
			clk_50MHz => CLOCK_50,
			dac_MCLK  => i2s_Mck_o,
			dac_LRCK  => i2s_Lr_o,
			dac_SCLK  => i2s_Sck_o,
			dac_SDIN  => i2s_D_o,
			L_data    => std_logic_vector("0" & dac_l & "00"),
			R_data    => std_logic_vector("0" & dac_r & "00")
        );

	I2S_MCK <= i2s_Mck_o;
	I2S_SCK <= i2s_Sck_o;
	I2S_LR  <= i2s_Lr_o;
	I2S_D   <= i2s_D_o;


guest: COMPONENT guest_top
	PORT map
	(
		-- Clocks
		CLOCK_27 => clock_input,
		RESET_N => reset_n,
--		LED => act_led,

        -- Sdram
		SDRAM_DQ => pMemDat,
		SDRAM_A => pMemAdr,
		SDRAM_DQML => pMemLdq,
		SDRAM_DQMH => pMemUdq,
		SDRAM_nWE => pMemWe_n,
		SDRAM_nCAS => pMemCas_n,
		SDRAM_nRAS => pMemRas_n,
		SDRAM_nCS => pMemCs_n,
		SDRAM_BA => pMemBa,
		SDRAM_CLK => pMemClk,
		SDRAM_CKE => pMemCke,

		-- SPI
		SPI_DO => spi_do,
		SPI_DI => spi_toguest,
		SPI_SCK => spi_clk_int,
		SPI_SS2 => spi_ss2,
		SPI_SS3 => spi_ss3,
		SPI_SS4 => spi_ss4,
		CONF_DATA0 => conf_data0,
		-- UART
			--UART_TX => UART_TXD,
			--UART_RX => UART_RXD,
			--UART_CTS  => DETO1_PMOD2_6,
			--UART_RTS  => DETO2_PMOD2_7,
			--UART_TX  => open,
			--UART_RX  => EAR,

		--SD_IN			=> pDip(0), --Scandoubler 0:NO 1:Yes
		
        -- VGA
		VGA_HS => vga_hsync,
		VGA_VS => vga_vsync,
		VGA_R => vga_red(7 downto 2),
		VGA_G => vga_green(7 downto 2),
		VGA_B => vga_blue(7 downto 2),
		-- VGA_BLANK => vga_blank,
		-- VGA_CLK   => vga_clk
		-- vga_x_r   => vga_x_r,
		-- vga_x_g   => vga_x_g,
		-- vga_x_b   => vga_x_b,
		-- vga_x_hs  => vga_x_hs,
		-- vga_x_vs  => vga_x_vs,        
    
		--AUDIO
		--AUDIO_L => sigma_l,
		--AUDIO_R => sigma_r,
        --DAC_L   => dac_l,
        --DAC_R   => dac_r
      
);

-- Pass internal signals to external SPI interface
-- SD / SPI
    pSd_Dt(0) <= 'Z';
    pSd_Dt(1) <= 'Z';
    pSd_Dt(2) <= 'Z';

    sd_clk <= spi_clk_int;
	spi_do <= sd_miso when spi_ss4='0' else 'Z';
	spi_fromguest <= spi_do;

	pSd_Dt(3)<= sd_cs;
	pSd_Cm  <= sd_mosi;
	sd_miso <= pSd_Dt(0);
	pSd_Ck  <= sd_clk;
    

controller : entity work.substitute_mcu
	generic map (
		debug => debug,
		jtag_uart => jtag_uart,
		spirtc => spirtc,
		sysclk_frequency => sysclk_frequency, -- Sysclk frequency * 10
		SPI_SLOWBIT => SPI_SLOWBIT, -- ~384KHz when sysclk is 50MHz
		SPI_FASTBIT => SPI_FASTBIT, -- ~5MHz when sysclk is 50MHz
		SPI_INTERNALBIT => SPI_INTERNALBIT, -- Full speed when 0, half speed when 1
		SPI_EXTERNALCLK => SPI_EXTERNALCLK 
	)
	port map (
		clk => CLOCK_50,
		reset_in => KEY4_RESET_N,-- and pSW(0),
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
		buttons => (0=>pSW(0),others=>'1'), -- 0 = opens OSD
      --buttons => (others=>'1'),
        
		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd,
		--
		intercept => intercept
);



gendebug7Disp:
if debug7Disp=true generate

	COUNTER_PROC: process(CLOCK_50)  
	begin
			if rising_edge(CLOCK_50) then
					Count <= Count + 1;
			end if;
	end process;

	Debug1: entity work.clock_freq_counter
	port map (
	  i_clk_ref     => Count(4),
	  i_clk_test    => not vga_hsync,
	  i_rstb        => reset_n,
	  o_clock_freq  => Freq_o
	);

	Seg7_0 : entity work.Seven_Seg_Driver 
		port map (
		 Data_in => Freq_o (3 downto 0),
		LED     => p7SegLed0
		 );

	Seg7_1 : entity work.Seven_Seg_Driver 
	port map (
		 Data_in => Freq_o (7 downto 4),
		LED     => p7SegLed1
		 );

		 Seg7_2 : entity work.Seven_Seg_Driver 
		port map (
		 Data_in => Freq_o (11 downto 8),
		LED     => p7SegLed2
		 );
		 
	Seg7_3 : entity work.Seven_Seg_Driver 
		port map (
		 Data_in => Freq_o (15 downto 12),
	LED     => p7SegLed3
		 );
		

	Seg7_5 : entity work.Seven_Seg_Driver 
		port map (
		 Data_in => pDip(3) & pDip(2) & pDip(1) & pDip(0),
	LED     => p7SegLed5
		 );
end generate;
	
end RTL;
