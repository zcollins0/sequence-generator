library ieee;
use ieee.std_logic_1164.all;

entity slice_tb is
end entity slice_tb;

architecture slice_tb_behave of slice_tb is

  component slice is
  port(
    inputs: in std_logic_vector(4 downto 0);
    tnext, clock, reset: in std_logic;
    outputs, fs: out std_logic_vector(4 downto 0)
  );
  end component slice;

  signal t_inputs, t_outputs, t_fs: std_logic_vector(4 downto 0);
  signal t_tnext, t_clock, t_reset: std_logic;

begin

  SLI: slice port map(inputs => t_inputs,
                      tnext => t_tnext,
                      clock => t_clock,
                      reset => t_reset,
                      outputs => t_outputs,
                      fs => t_fs);

  test_process: process
  begin
    -- initial
    t_clock <= '0';
    t_inputs <= "00000";
    t_tnext <= '0';
    t_reset <= '1';
    wait for 20 ns;
    -- cycle the clock once - we should see 0s at output and Zs at F
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    -- bring inputs high and cycle the clock - outputs should be high
    --   no change to F
    t_inputs <= "01111";
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    -- shift a 1 into our track - should see output in F and t_tout = 1
    t_inputs <= "11111";
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    -- turn t_tnext = 1 -> no more output in F
    t_tnext <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    -- finally, test our reset
    t_reset <= '0';
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 19 ns;
    t_tnext <= '0';
    t_inputs <= "10000";
    t_reset <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    wait for 20 ns;
    wait;
    
  end process test_process;

end slice_tb_behave;

