library ieee;
use ieee.std_logic_1164.all;

entity inverter_tb is
end entity inverter_tb;

architecture inverter_tb_behave of inverter_tb is

  component inverter is
  port(
    input: in std_logic;
    output: out std_logic
  );
  end component inverter;

  signal t_in, t_out: std_logic;

begin

  SLI: inverter port map(t_in, t_out);

  test_process: process
  begin
    t_in <= '0';
    wait for 20 ns;    
    t_in <= '1';
    wait for 20 ns;
    wait;

  end process test_process;

end inverter_tb_behave;

