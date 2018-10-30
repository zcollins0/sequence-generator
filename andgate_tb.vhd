library ieee;
use ieee.std_logic_1164.all;

entity andgate_tb is
end entity andgate_tb;

architecture andgate_tb_behave of andgate_tb is

  component andgate is
  port(
    a, b: in std_logic;
    output: out std_logic
  );
  end component andgate;

  signal t_a, t_b, t_out: std_logic;

begin

  SLI: andgate port map(t_a, t_b, t_out);

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

end andgate_tb_behave;

