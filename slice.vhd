library ieee;
use ieee.std_logic_1164.all;

entity slice is
port(
  inputs: in std_logic_vector(4 downto 0);
  tnext, clock, reset: in std_logic;
  outputs, fs: out std_logic_vector(4 downto 0)
);
end entity slice;

architecture slice_behave of slice is

  component inverter is
  port(
    input: in std_logic;
    output: out std_logic
  );
  end component inverter;

  component dff is
  port(
    d, clock: in std_logic;
    q: out std_logic
  );
  end component dff;

  component tgate is
  port(
    input, gate: in std_logic;
    output: out std_logic
  );
  end component tgate;

  component andgate is
  port(
    a, b: in std_logic;
    output: out std_logic
  );
  end component andgate;

  component norgate is
  port(
    a, b: in std_logic;
    output: out std_logic
  );
  end component norgate;

  signal activate: std_logic;
  signal inv_track_out_buf: std_logic;
  signal output_buf: std_logic_vector(4 downto 0);
  signal track_in_buf: std_logic;
  signal f_buf: std_logic_vector(4 downto 0);

begin

  RST: andgate port map(inputs(4), reset, track_in_buf);
  TRA: dff port map(track_in_buf, clock, output_buf(4));
  INV: inverter port map(output_buf(4), inv_track_out_buf);
  ACT: norgate port map(inv_track_out_buf, tnext, activate);
  TRB: tgate port map(output_buf(4), activate, f_buf(4));

  GEN_LOGIC: for i in 0 to 3 generate
    FF: dff port map(inputs(i), clock, output_buf(i));
    TG: tgate port map(output_buf(i), activate, f_buf(i));
  end generate GEN_LOGIC;

  buf_process: process(output_buf, f_buf)
  begin
    outputs <= output_buf;
    fs <= f_buf;
  end process buf_process;

end slice_behave;

