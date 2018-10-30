library ieee;
use ieee.std_logic_1164.all;

entity preprocess is
port(
  inputs, fs: in std_logic_vector(3 downto 0);
  load_gen, clock: in std_logic;
  outputs: out std_logic_vector(3 downto 0);
  gclock: out std_logic
);
end entity preprocess;

architecture preprocess_behave of preprocess is

  component mux is
  port(
    a, b, gate: in std_logic;
    output: out std_logic
  );
  end component mux;

  component inverter is
  port(
    input: in std_logic;
    output: out std_logic
  );
  end component inverter;

  component norgate is
  port(
    a, b: in std_logic;
    output: out std_logic
  );
  end component norgate;

  signal inv_clock: std_logic;
  signal output_buf: std_logic_vector(3 downto 0);

begin

  INVC: inverter port map(clock, inv_clock);
  GCLK: norgate port map(inv_clock, load_gen, gclock);
  
  GEN_MUXES: for i in 0 to 3 generate
    MX: mux port map(fs(i), inputs(i), load_gen, output_buf(i));
  end generate GEN_MUXES;

  preprocess_process:  process(output_buf)
  begin
    outputs <= output_buf;
  end process preprocess_process;

end preprocess_behave;
