-- DeMiSTifyConfig_pkg.vhd
-- Copyright 2021 by Alastair M. Robinson

library ieee;
use ieee.std_logic_1164.all;

package demistify_config_pkg is
constant demistify_romspace : integer := 14; -- 16k address space to accommodate 12K of ROM
constant demistify_romsize1 : integer := 13; -- 8k fot the first chunk
constant demistify_romsize2 : integer := 12; -- 4k for the second chunk, mirrored across the last 4k

	-- Declare the guest component
	
	COMPONENT guest_mist -- Rename to match the guest core
		PORT
		(
			CLOCK_27 :	IN STD_LOGIC;	-- Comment out one of these two lines
			CLOCK_27 :	IN STD_LOGIC_VECTOR(1 downto 0);	-- to match the guest core
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
	-- 		We can't do bi-directional signals here, so we need separate in and out signals.
	--		If the guest core uses direct mode for ROM upload it will need to be adapted.
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
	

end package;
