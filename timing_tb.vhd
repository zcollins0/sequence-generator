library ieee;
use ieee.std_logic_1164.all;

entity timing_tb is
end entity timing_tb;

architecture timing_tb_behave of timing_tb is

  signal Clk, LoadGen, Reset, Track: std_logic;
  signal Inputs, Fs: std_logic_vector(3 downto 0);

begin

  test_process: process
  begin
    Inputs <= "0000";
    Fs <= "0000";
    Clk <= '0';
    LoadGen <= '0';
    Reset <= '1';
    Track <= '1';
    wait for 5 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    Reset <= '0';
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    Reset <= '1';
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    Inputs <= "0101";
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    Inputs <= "1010";
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    Inputs <= "1111";
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 4 ns;
    LoadGen <= '1';
    wait for 1 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 2 ns;
    Fs <= "0101";
    wait for 3 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 2 ns;
    Fs <= "1010";
    wait for 3 ns;
    Clk <= '1';
    wait for 5 ns;
    Clk <= '0';
    wait for 2 ns;
    Fs <= "1111";
    wait for 3 ns;
    wait;
    
  end process test_process;

end timing_tb_behave;
