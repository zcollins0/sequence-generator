library ieee;
use ieee.std_logic_1164.all;

entity tgate_tb is
end entity tgate_tb;

architecture tgate_tb_behave of tgate_tb is

  component tgate is
  port(
    input, gate: in std_logic;
    output: out std_logic
  );
  end component tgate;

  signal t_in, t_gate, t_out: std_logic;

begin

  SLI: tgate port map(t_in, t_gate, t_out);

  test_process: process
  begin
  t_in <= '0';
  t_gate <= '0';
  wait for 20 ns;    
  t_in <= '0';
  t_gate <= '1';
  wait for 20 ns;    
  t_in <= '1';
  t_gate <= '0';
  wait for 20 ns;    
  t_in <= '1';
  t_gate <= '1';
  wait for 20 ns;  


  wait;
    
  end process test_process;

end tgate_tb_behave;

