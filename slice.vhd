library ieee;
use ieee.std_logic_1164.all;

entity slice is
port(
  inputs: in std_logic_vector(3 downto 0);
  tin, tnext, clock, gclock, reset: in std_logic;
  outputs, fs: out std_logic_vector(3 downto 0);
  tout: out std_logic
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
  signal inv_tbuf: std_logic;
  signal t_buf: std_logic;
  signal output_buf: std_logic_vector(3 downto 0);
  signal tra_in_buf: std_logic;

begin

  RST: andgate port map(tin, reset, tra_in_buf);
  TRA: dff port map(tra_in_buf, gclock, t_buf);
  INV: inverter port map(t_buf, inv_tbuf);
  ACT: norgate port map(inv_tbuf, tnext, activate);

  GEN_LOGIC: for i in 0 to 3 generate
    FF: dff port map(inputs(i), clock, output_buf(i));
    TG: tgate port map(output_buf(i), activate, fs(i));
  end generate GEN_LOGIC;

  buf_process: process(t_buf, output_buf)
  begin
    tout <= t_buf;
    outputs <= output_buf;
  end process buf_process;

end slice_behave;
