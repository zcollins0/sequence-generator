library ieee;
use ieee.std_logic_1164.all;

entity preprocess is
port(
  inputs: in std_logic_vector(3 downto 0);
  fs: in std_logic_vector(4 downto 0);
  load_gen, clock, track: in std_logic;
  outputs: out std_logic_vector(4 downto 0)
);
end entity preprocess;

architecture preprocess_behave of preprocess is

  component mux is
  port(
    a, b, gate: in std_logic;
    output: out std_logic
  );
  end component mux;

  signal output_buf: std_logic_vector(4 downto 0);

begin

  TMUX: mux port map(fs(4), track, load_gen, output_buf(4));
  
  GEN_MUXES: for i in 0 to 3 generate
    MX: mux port map(fs(i), inputs(i), load_gen, output_buf(i));
  end generate GEN_MUXES;

  preprocess_process:  process(output_buf)
  begin
    outputs <= output_buf;
  end process preprocess_process;

end preprocess_behave;
