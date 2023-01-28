
--https://surf-vhdl.com/compute-frequency-clock/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_freq_counter is
port (
  i_clk_ref            : in  std_logic;
  i_clk_test           : in  std_logic;
  i_rstb               : in  std_logic;
  o_clock_freq         : out std_logic_vector(15 downto 0));
end clock_freq_counter;

architecture rtl of clock_freq_counter is

-- r1_  register con clock reference domain
-- r2_  register con clock test domain

--  CLOCK REFERENCE signal declaration
signal r1_counter_ref              : unsigned(12 downto 0);  -- 12+1 bit: extra bit used for test counter control
signal r1_counter_test_ena         : std_logic;
signal r1_counter_test_strobe      : std_logic;
signal r1_counter_test_rstb        : std_logic;
--  CLOCK TEST signal declaration
signal r2_counter_test             : unsigned(15 downto 0); -- clock test can be up-to 16 times clock ref
signal r2_counter_test_ena         : std_logic;
signal r2_counter_test_strobe      : std_logic;
signal r2_counter_test_rstb        : std_logic;

begin
--  CLOCK REFERENCE domain
p_counter_ref : process (i_rstb,i_clk_ref)
begin
  if(i_rstb='0') then
    r1_counter_ref                 <= (others=>'0');
    r1_counter_test_ena            <= '0';
    r1_counter_test_strobe         <= '0';
    r1_counter_test_rstb           <= '0';
  elsif(rising_edge(i_clk_ref)) then
    r1_counter_ref            <= r1_counter_ref + 1;  -- free running
    
    -- use MSB to control test counter
    r1_counter_test_ena       <= not r1_counter_ref(r1_counter_ref'high);
    
    -- enable storing for 1024 clock cycle after 256 clock cycle
    if(r1_counter_ref>16#1100#) and (r1_counter_ref<16#1500#) then
      r1_counter_test_strobe     <= '1';
    else
      r1_counter_test_strobe     <= '0';
    end if;

    -- enable reset for 1024 clock cycle; after 1024 clock cycle from storing
    if(r1_counter_ref>16#1900#) and (r1_counter_ref<16#1D00#) then
      r1_counter_test_rstb    <= '0';
    else
      r1_counter_test_rstb    <= '1';
    end if;

  end if;
end process p_counter_ref;

------------------------------------------------------------------------------------------------------------------------

p_clk_test_resync : process (i_clk_test)
begin
  if(rising_edge(i_clk_test)) then
    r2_counter_test_ena        <= r1_counter_test_ena     ;
    r2_counter_test_strobe     <= r1_counter_test_strobe  ;
    r2_counter_test_rstb       <= r1_counter_test_rstb    ;
  end if;
end process p_clk_test_resync;

p_counter_test : process (r2_counter_test_rstb,i_clk_test)
begin
  if(r2_counter_test_rstb='0') then
    r2_counter_test         <= (others=>'0');
  elsif(rising_edge(i_clk_test)) then
    if(r2_counter_test_ena='1') then
      r2_counter_test    <= r2_counter_test + 1;
    end if;
  end if;
end process p_counter_test;

p_counter_test_out : process (i_rstb,i_clk_test)
begin
  if(i_rstb='0') then
    o_clock_freq         <= (others=>'1');  -- set all bit to '1' at reset and if test clock is not present
  elsif(rising_edge(i_clk_test)) then
    if(r2_counter_test_strobe='1') then
      o_clock_freq         <= std_logic_vector(r2_counter_test);
    end if;
  end if;
end process p_counter_test_out;

end rtl;