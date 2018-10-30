library ieee;
use ieee.std_logic_1164.all;

entity slice_tb is
end entity slice_tb;

architecture slice_tb_behave of slice_tb is

  component slice is
  port(
    inputs: in std_logic_vector(3 downto 0);
    tin, tnext, clock, gclock, reset: in std_logic;
    outputs, fs: out std_logic_vector(3 downto 0);
    tout: out std_logic
  );
  end component slice;

  signal t_inputs, t_outputs, t_fs: std_logic_vector(3 downto 0);
  signal t_tin, t_tnext, t_clock, t_gclock, t_reset, t_tout: std_logic;

begin

  SLI: slice port map(t_inputs, t_tin, t_tnext, t_clock, t_gclock, t_reset,
        t_outputs, t_fs, t_tout);

  test_process: process
  begin
    t_clock <= '0';
    t_gclock <= '0';
    t_inputs <= "0000";
    t_tin <= '1';
    t_tnext <= '0';
    t_reset <= '1';
    wait for 20 ns;
    t_clock <= '1';
    t_gclock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    t_gclock <= '0';
    wait for 20 ns;
    t_clock <= '1';
    t_gclock <= '1';
    wait for 20 ns;
    t_clock <= '0';
    t_gclock <= '0';
    wait for 20 ns;


    wait;
    
  end process test_process;

end slice_tb_behave;

