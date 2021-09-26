library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- -----------------------------------------------------------------------

entity deca_top is
	port
	(
		ADC_CLK_10		:	 IN STD_LOGIC;
		MAX10_CLK1_50		:	 IN STD_LOGIC;
		MAX10_CLK2_50		:	 IN STD_LOGIC;
		KEY			:	 IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		LED			:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
               -- SDRAM
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
               -- VGA
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
		-- AUDIO
		SIGMA_R                     : OUT STD_LOGIC;
		SIGMA_L                     : OUT STD_LOGIC;
		-- PS2
		PS2_KEYBOARD_CLK            :    INOUT STD_LOGIC;
		PS2_KEYBOARD_DAT            :    INOUT STD_LOGIC;
		PS2_MOUSE_CLK               :    INOUT STD_LOGIC;
		PS2_MOUSE_DAT               :    INOUT STD_LOGIC;
		-- UART
		UART_RXD                    : IN STD_LOGIC;
		UART_TXD                    : OUT STD_LOGIC;
		-- SD Card
		sd_cs_n_o                      : out   std_logic := '1';
		sd_sclk_o                      : out   std_logic := '0';
		sd_mosi_o                      : out   std_logic := '0';
		sd_miso_i                      : in    std_logic;
		SD_SEL                         : out   std_logic := '0';   
		SD_CMD_DIR                     : out   std_logic := '1';  
		SD_D0_DIR                      : out   std_logic := '0';  
		SD_D123_DIR                    : out   std_logic;
		-- HDMI-TX  DECA 
		HDMI_I2C_SCL  : inout std_logic; 		          		
		HDMI_I2C_SDA  : inout std_logic; 		          		
		HDMI_I2S      : inout std_logic_vector(3 downto 0);		     	
		HDMI_LRCLK    : inout std_logic; 		          		
		HDMI_MCLK     : inout std_logic;		          		
		HDMI_SCLK     : inout std_logic; 		          		
		HDMI_TX_CLK   : out	std_logic;	          		
		HDMI_TX_D     : out	std_logic_vector(23 downto 0);	    		
		HDMI_TX_DE    : out std_logic;		          		 
		HDMI_TX_HS    : out	std_logic;	          		
		HDMI_TX_INT   : in  std_logic;		          		
		HDMI_TX_VS    : out std_logic;         
               -- AUDIO CODEC  DECA 
		AUDIO_GPIO_MFP5 : inout std_logic;
		AUDIO_MISO_MFP4 : in std_logic;
		AUDIO_RESET_n :  inout std_logic;
		AUDIO_SCLK_MFP3 : out std_logic;
		AUDIO_SCL_SS_n : out std_logic;
		AUDIO_SDA_MOSI : inout std_logic;
		AUDIO_SPI_SELECT : out std_logic;
		i2sMck : out std_logic;
		i2sSck : out std_logic;
		i2sLr : out std_logic;
		i2sD : out std_logic		
	);
END entity;

architecture RTL of deca_top is
   constant reset_cycles : integer := 131071;
	
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
	signal joya : std_logic_vector(6 downto 0);
	signal joyb : std_logic_vector(6 downto 0);
	signal joyc : std_logic_vector(6 downto 0);
	signal joyd : std_logic_vector(6 downto 0);


COMPONENT  NES_mist
	PORT
	(
		CLOCK_27 :	IN STD_LOGIC;
--             CLOCK_27 :	IN STD_LOGIC_VECTOR(1 downto 0);
--		RESET_N :   IN std_logic;
               LED : out std_logic;
               -- SDRAM
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
		-- UART
		UART_TX    :   OUT STD_LOGIC;
		UART_RX    :   IN STD_LOGIC;
		-- SPI
		SPI_DO		:	 OUT STD_LOGIC;
		SPI_SD_DI	:	 IN STD_LOGIC;
		SPI_DI		:	 IN STD_LOGIC;
		SPI_SCK		:	 IN STD_LOGIC;
		SPI_SS2		:	 IN STD_LOGIC;
		SPI_SS3		:	 IN STD_LOGIC;
		SPI_SS4		:	 IN STD_LOGIC;
		CONF_DATA0		:	 IN STD_LOGIC;
               -- VGA
		VGA_HS		:	 OUT STD_LOGIC;
		VGA_VS		:	 OUT STD_LOGIC;
		VGA_R		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
		VGA_B		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	        VGA_BLANK : out std_logic; 
	        VGA_CLK : out std_logic;
               -- AUDIO
		AUDIO_L  : out std_logic;
		AUDIO_R  : out std_logic;
		dac_l           : OUT SIGNED(15 DOWNTO 0);
                dac_r           : OUT SIGNED(15 DOWNTO 0);
--		dac_l           : OUT SIGNED(9 DOWNTO 0);
--              dac_r           : OUT SIGNED(9 DOWNTO 0)
	);
END COMPONENT;


component AUDIO_SPI_CTL_RD
    port (
    iRESET_n : in std_logic;
    iCLK_50 : in std_logic;
    oCS_n : out std_logic;
    oSCLK : out std_logic;
    oDIN : out std_logic;
    iDOUT : in std_logic
  );
end component;

signal RESET_DELAY_n     : std_logic;   

component i2s_transmitter
  generic (
    sample_rate : positive
  );
    port (
    clock_i : in std_logic;
    reset_i : in std_logic;
    pcm_l_i : in std_logic_vector(15 downto 0);
    pcm_r_i : in std_logic_vector(15 downto 0);
    i2s_mclk_o : out std_logic;
    i2s_lrclk_o : out std_logic;
    i2s_bclk_o : out std_logic;
    i2s_d_o : out std_logic
  );
end component;


-- DAC AUDIO
signal dac_l: signed(15 downto 0);
signal dac_r: signed(15 downto 0);
--signal dac_l: signed(9 downto 0);
--signal dac_r: signed(9 downto 0);
        
--signal dac_l_s: signed(15 downto 0);
--signal dac_r_s: signed(15 downto 0);


-- HDMI
signal i2s_Mck_o : std_logic;
signal i2s_Sck_o : std_logic;
signal i2s_Lr_o : std_logic;
signal i2s_D_o : std_logic;

component I2C_HDMI_Config
    port (
    iCLK : in std_logic;
    iRST_N : in std_logic;
    I2C_SCLK : out std_logic;
    I2C_SDAT : inout std_logic;
    HDMI_TX_INT : in std_logic
  );
end component;

signal hdmi_clk :  std_logic;
signal hdmi_blank  :  std_logic;

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
	

joya<=(others=>'1');
joyb<=(others=>'1');
joyc<=(others=>'1');
joyd<=(others=>'1');


SD_SEL                          <= '0';  -- 0 = 3.3V at sdcard   
SD_CMD_DIR                      <= '1';  -- MOSI FPGA output
SD_D0_DIR                       <= '0';  -- MISO FPGA input     
SD_D123_DIR                     <= '1';  -- CS FPGA output  


VGA_R<=vga_red(7 downto 5);
VGA_G<=vga_green(7 downto 5);
VGA_B<=vga_blue(7 downto 5);
VGA_HS<=vga_hsync;
VGA_VS<=vga_vsync;


-- DECA AUDIO CODEC
RESET_DELAY_n <= reset_n;
-- Audio DAC DECA Output assignments
AUDIO_GPIO_MFP5  <= '1';  -- GPIO
AUDIO_SPI_SELECT <= '1';  -- SPI mode
AUDIO_RESET_n    <= RESET_DELAY_n;    

-- DECA AUDIO CODEC SPI CONFIG
AUDIO_SPI_CTL_RD_inst : AUDIO_SPI_CTL_RD
port map (
	iRESET_n => RESET_DELAY_n,
	iCLK_50 => MAX10_CLK1_50,
	oCS_n => AUDIO_SCL_SS_n,
	oSCLK => AUDIO_SCLK_MFP3,
	oDIN => AUDIO_SDA_MOSI,
	iDOUT => AUDIO_MISO_MFP4
);

-- AUDIO CODEC
i2s_transmitter_inst : i2s_transmitter
	generic map (
		sample_rate => 48000
	)
	port map (
		clock_i => MAX10_CLK1_50,
		reset_i => '0',
		pcm_l_i => std_logic_vector(dac_l),
		pcm_r_i => std_logic_vector(dac_r),		
--		pcm_l_i => std_logic_vector(dac_l_s),
--		pcm_r_i => std_logic_vector(dac_r_s),
		i2s_mclk_o => i2s_Mck_o,
		i2s_lrclk_o => i2s_Lr_o,
		i2s_bclk_o => i2s_Sck_o,
		i2s_d_o => i2s_D_o
	);

i2sMck <= i2s_Mck_o;
i2sSck <= i2s_Sck_o;
i2sLr <= i2s_Lr_o;
i2sD <= i2s_D_o;

--dac_l_s <= ('0' & dac_l & "00000");
--dac_r_s <= ('0' & dac_r & "00000");


-- HDMI CONFIG    
I2C_HDMI_Config_inst : I2C_HDMI_Config
port map (
	iCLK => MAX10_CLK1_50,      
	iRST_N =>  reset_n,       --reset_n, KEY(0)
	I2C_SCLK => HDMI_I2C_SCL,
	I2C_SDAT => HDMI_I2C_SDA,
	HDMI_TX_INT => HDMI_TX_INT
);

--  HDMI VIDEO   
HDMI_TX_CLK <= hdmi_clk;	
HDMI_TX_DE <= not hdmi_blank;
HDMI_TX_HS <= vga_hsync;
HDMI_TX_VS <= vga_vsync;
HDMI_TX_D <= vga_red(7 downto 2)&vga_red(7 downto 6)&vga_green(7 downto 2)&vga_green(7 downto 6)&vga_blue(7 downto 2)&vga_blue(7 downto 6);

--  HDMI AUDIO   
HDMI_MCLK <= i2s_Mck_o;
HDMI_SCLK <= i2s_Sck_o;    -- lr*2*16
HDMI_LRCLK <= i2s_Lr_o;   
HDMI_I2S(0) <= i2s_D_o;



guest: COMPONENT  NES_mist
	PORT map
	(
		CLOCK_27 => MAX10_CLK1_50,
--         	CLOCK_27 => MAX10_CLK2_50&MAX10_CLK1_50,
--	        RESET_N => reset_n,
                LED => LED(0),		 
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
		UART_TX  => UART_TXD,
		UART_RX  => UART_RXD,
		--SPI
		SPI_SD_DI => sd_miso,
		SPI_DO => spi_fromguest,
		SPI_DI => spi_toguest,
		SPI_SCK => spi_clk_int,
		SPI_SS2	=> spi_ss2,
		SPI_SS3 => spi_ss3,
		SPI_SS4	=> spi_ss4,
		CONF_DATA0 => conf_data0,
               --VGA
		VGA_HS => vga_hsync,
		VGA_VS => vga_vsync,
		VGA_R => vga_red(7 downto 2),
		VGA_G => vga_green(7 downto 2),
		VGA_B => vga_blue(7 downto 2),
	             VGA_BLANK => hdmi_blank,
	             VGA_CLK => hdmi_clk
                --AUDIO
		AUDIO_L => sigma_l,
		AUDIO_R => sigma_r,
		     DAC_L   => dac_l,
                     DAC_R   => dac_r

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
		clk => MAX10_CLK1_50,
		reset_in =>  KEY(0),
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

		buttons => (0=>KEY(0),1=>KEY(1),others=>'1'),

		-- UART
		rxd => rs232_rxd,
		txd => rs232_txd
);

end rtl;

