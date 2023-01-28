library IEEE;
use IEEE.std_logic_1164.all;

Entity Seven_Seg_Driver is 
	port(Data_in: in  STD_LOGIC_VECTOR (3 downto 0);
	     LED: out STD_LOGIC_VECTOR (6 downto 0));
End Seven_Seg_Driver;

Architecture Structure of Seven_Seg_Driver is
Begin
	Process(Data_in)
	Begin
		Case Data_in is
	--//	   _______   
	--//	  <___0___>  
	--//	| |       | |
	--//	|5|       |1|
	--//	| |_______| |
	--//	  <___6___>  
	--//	| |       | |
	--//	|4|       |2|
	--//	| |_______| |
	--//	  <___3___>  
	--//
    --     1 : Turn Off
    --     0 : Turn On
            when "0000" => LED <= "1000000";  
			when "0001" => LED <= "1111001";
			when "0010" => LED <= "0100100";
			when "0011" => LED <= "0110000";
			when "0100" => LED <= "0011001";
			when "0101" => LED <= "0010010";
			when "0110" => LED <= "0000010";
			when "0111" => LED <= "1111000";
			when "1000" => LED <= "0000000";
			when "1001" => LED <= "0010000";
			when "1010" => LED <= "0001000";
			when "1011" => LED <= "0000011";
			when "1100" => LED <= "1000110";
			when "1101" => LED <= "0100001";
			when "1110" => LED <= "0000110";
			when "1111" => LED <= "0001110";
			                       
			when others => LED <= "1111111";--this should never occur
		End Case;
	End process;
End Structure;