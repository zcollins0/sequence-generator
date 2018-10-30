library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end entity dff_tb;

architecture dff_tb_behave of dff_tb is

  component dff is
  port(
    d, clock: in std_logic;
    q: out std_logic
  );
  end component dff;

  signal t_d, t_clock, t_q: std_logic;

begin

  SLI: dff port map(t_d, t_clock, t_q);

  test_process: process
  begin
    t_d <= '0';
    t_clock <= '0';
    wait for 20 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    t_d <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    t_d <= '0';
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 20 ns;
    wait;

  end process test_process;

end dff_tb_behave;

