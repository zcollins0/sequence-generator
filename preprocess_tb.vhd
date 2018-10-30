library ieee;
use ieee.std_logic_1164.all;

entity preprocess_tb is
end entity preprocess_tb;

architecture preprocess_tb_behave of preprocess_tb is

  component preprocess is
  port(
    inputs, fs: in std_logic_vector(3 downto 0);
    load_gen, clock: in std_logic;
    outputs: out std_logic_vector(3 downto 0);
    gclock: out std_logic
  );
  end component preprocess;

  signal t_inputs, t_fs, t_outputs: std_logic_vector(3 downto 0);
  signal t_load_gen, t_clock, t_gclock: std_logic;

begin

  SLI: preprocess port map(t_inputs, t_fs, t_load_gen, t_clock,
        t_outputs, t_gclock);

  test_process: process
  begin
    t_inputs <= "0000";
    t_fs <= "1111";
    t_load_gen <= '0';
    t_clock <= '0';
    wait for 20 ns;
    t_inputs <= "1111";
    t_fs <= "0000";
    t_clock <= '1';
    wait for 20 ns;
    t_load_gen <= '1';
    t_clock <= '0';
    t_inputs <= "0000";
    t_fs <= "1111";
    wait for 20 ns;
    t_inputs <= "1111";
    t_fs <= "0000";
    t_clock <= '1';
    wait for 20 ns;
    wait;
    
  end process test_process;

end preprocess_tb_behave;

