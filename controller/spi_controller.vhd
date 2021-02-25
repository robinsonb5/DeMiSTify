-- Copyright (c) 2014 by Alastair M. Robinsonb
-- Adapted by the Chameleon Minimig cfide.vhd file,
-- originally by Tobias Gubener.

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity spi_controller is
	port (
		sysclk : in std_logic;
		reset : in std_logic;

		-- Host interface
		spiclk_in : in std_logic;	-- Momentary high pulse
		host_to_spi : in std_logic_vector(7 downto 0);
		spi_to_host : out std_logic_vector(7 downto 0);
		trigger : in std_logic;  -- Momentary high pulse
		busy : buffer std_logic;

		-- Hardware interface
		miso : in std_logic;
		mosi : out std_logic;
		ack : in std_logic; -- '1' when clk and MOSI can be trusted to have reached the wire
		spiclk_out : out std_logic -- 50% duty cycle
	);
end entity;

architecture rtl of spi_controller is
signal sck : std_logic;
signal sd_shift : std_logic_vector(7 downto 0);
signal shiftcnt : std_logic_vector(5 downto 0);
signal pending : std_logic;
begin

-----------------------------------------------------------------
-- SPI-Interface
-----------------------------------------------------------------	
	spiclk_out <= sck;
	busy <= shiftcnt(5) or trigger;
   spi_to_host <= sd_shift;

	PROCESS (sysclk, reset) BEGIN

		IF reset ='0' THEN 
			shiftcnt(5)<='0';
			sck <= '0';
		ELSIF rising_edge(sysclk) then
			-- TC64V1 sends SPI signals through a MUX. Must make sure signals have reached the wire.
			if ack='1' then
				pending <= '0';
			end if;
			
			IF trigger='1' then
				shiftcnt <= "100111";  -- shift out 8 bits, underflow will clear bit 5, mapped to busy
				sd_shift <= host_to_spi(7 downto 0); -- & X"FFFFFF";
				pending <= '1';
				sck <= '1';
			ELSE
				IF spiclk_in='1' and pending='0' and busy='1' THEN
					IF sck='1' THEN
						mosi<=sd_shift(7);
						pending <= '1';
						sck <='0';
					ELSE	
						sd_shift <= sd_shift(6 downto 0)&miso;
						shiftcnt <= shiftcnt-1;
						pending <= '1';
						sck <='1';
					END IF;
				END IF;
			END IF;
		end if;
	END PROCESS;

end architecture;
