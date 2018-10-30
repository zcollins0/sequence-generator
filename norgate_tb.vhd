library ieee;
use ieee.std_logic_1164.all;

entity norgate_tb is
end entity norgate_tb;

architecture norgate_tb_behave of norgate_tb is

  component norgate is
  port(
    a, b: in std_logic;
    output: out std_logic
  );
  end component norgate;

  signal t_a, t_b, t_out: std_logic;

begin

  SLI: norgate port map(t_a, t_b, t_out);

  test_process: process
  begin
    t_a <= '0';
    t_b <= '0';
    wait for 20 ns;
    t_a <= '0';
    t_b <= '1';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '0';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '1';
    wait for 20 ns;
    wait;
    
  end process test_process;

end norgate_tb_behave;

