library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end entity mux_tb;

architecture mux_tb_behave of mux_tb is

  component mux is
  port(
    a, b, gate: in std_logic;
    output: out std_logic
  );
  end component mux;

  signal t_a, t_b, t_gate, t_out: std_logic;

begin

  SLI: mux port map(t_a, t_b, t_gate, t_out);

  test_process: process
  begin
    t_a <= '0';
    t_b <= '0';
    t_gate <= '0';
    wait for 20 ns;
    t_a <= '0';
    t_b <= '1';
    t_gate <= '0';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '0';
    t_gate <= '0';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '1';
    t_gate <= '0';
    wait for 20 ns;
    t_a <= '0';
    t_b <= '0';
    t_gate <= '1';
    wait for 20 ns;
    t_a <= '0';
    t_b <= '1';
    t_gate <= '1';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '0';
    t_gate <= '1';
    wait for 20 ns;
    t_a <= '1';
    t_b <= '1';
    t_gate <= '1';
    wait for 20 ns;
    wait;
    
  end process test_process;

end mux_tb_behave;

