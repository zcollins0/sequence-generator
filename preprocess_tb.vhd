library ieee;
use ieee.std_logic_1164.all;

entity preprocess_tb is
end entity preprocess_tb;

architecture preprocess_tb_behave of preprocess_tb is

  component preprocess is
  port(
    inputs: in std_logic_vector(3 downto 0);
    fs: in std_logic_vector(4 downto 0);
    load_gen, clock, track: in std_logic;
    outputs: out std_logic_vector(4 downto 0)
  );
  end component preprocess;

  signal t_inputs: std_logic_vector(3 downto 0);
  signal t_fs, t_outputs: std_logic_vector(4 downto 0);
  signal t_load_gen, t_clock, t_track: std_logic;

begin

  SLI: preprocess port map(t_inputs, t_fs, t_load_gen, t_clock,
        t_track, t_outputs);

  test_process: process
  begin
    t_inputs <= "0000";
    t_track <= '0';
    t_fs <= "11111";
    t_load_gen <= '0';
    t_clock <= '0';
    wait for 20 ns;
    t_inputs <= "1111";
    t_track <= '1';
    t_fs <= "00000";
    t_clock <= '1';
    wait for 20 ns;
    t_load_gen <= '1';
    t_clock <= '0';
    t_inputs <= "0000";
    t_track <= '0';
    t_fs <= "11111";
    wait for 20 ns;
    t_inputs <= "1111";
    t_track <= '1';
    t_fs <= "00000";
    t_clock <= '1';
    wait for 20 ns;
    wait;
    
  end process test_process;

end preprocess_tb_behave;

