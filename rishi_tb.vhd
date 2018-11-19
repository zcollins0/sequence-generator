library ieee;
use ieee.std_logic_1164.all;

entity rishi_tb is
end entity rishi_tb;

architecture rishi_tb_behave of rishi_tb is

  component rishi is
  generic(
    n: integer
  );
  port(
    inputs: in std_logic_vector(3 downto 0);
    load_gen, clock, reset, track: in std_logic;
    outputs, fs: out std_logic_vector(3 downto 0);
    track_out: out std_logic
  );
  end component rishi;

  constant n: integer := 3;

  signal t_inputs, t_outputs, t_fs: std_logic_vector(3 downto 0);
  signal t_load_gen, t_clock, t_reset, t_track, t_track_out: std_logic;

begin

  RIS: rishi
    generic map(n => n)
    port map(inputs    => t_inputs,
             load_gen  => t_load_gen,
             clock     => t_clock,
             reset     => t_reset,
             track     => t_track,
             outputs   => t_outputs,
             fs        => t_fs,
             track_out => t_track_out);

  test_process: process
  begin
    t_inputs <= "0000";
    t_clock <= '0';
    t_load_gen <= '0';
    t_reset <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 2 ns;
    t_reset <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 2 ns;
    t_track <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 2 ns;
    t_inputs <= "1010";
    wait for 1 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 2 ns;
    t_inputs <= "0101";
    wait for 1 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 2 ns;
    t_load_gen <= '1';
    wait for 1 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    t_clock <= '1';
    wait for 3 ns;
    t_clock <= '0';
    wait for 3 ns;
    wait;
    
  end process test_process;

end rishi_tb_behave;

