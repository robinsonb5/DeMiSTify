---------------------------------------------------------------------------------
-- extracted from sgtl5000 DAC by Dar (darfpga@aol.fr)
-- http://darfpga.blogspot.fr
---------------------------------------------------------------------------------
-- Minimum setup for i2s in PCM -> Headphone
--
---------------------------------------------------------------------------------
-- First release V0.0 : 01/05/2017
---------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;


entity I2S is
port(
 sample_data : in  std_logic_vector(31 downto 0); -- audio data : 16bits left channel + 16bits right channel
 tx_data     : out std_logic;
 lrclk       : in  std_logic;
 bclk        : in  std_logic
);
end I2S ;

architecture struct of I2S is

-- Audio interface
signal sample_data_reg : std_logic_vector(31 downto 0);
signal audio_bit_cnt : integer range 0 to 31 := 0;
signal audio_out  : std_logic := '0';

begin

tx_data <= sample_data_reg(audio_bit_cnt) when audio_out = '1' else '0';
 
process(bclk)
begin
	if rising_edge(bclk) then
		if lrclk  = '1' then			
			audio_bit_cnt <= 31;
			sample_data_reg <= sample_data;
			audio_out <= '1';
		else
			if audio_bit_cnt = 0 then
				audio_out <= '0';				
			else
				audio_bit_cnt <= audio_bit_cnt -1;
			end if;
		end if;
  end if;
end process;

end architecture;
