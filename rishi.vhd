library ieee;
use ieee.std_logic_1164.all;

entity rishi is
port(
  inputs: in std_logic_vector(3 downto 0);
  load_gen, clock, reset: in std_logic;
  outputs, fs: out std_logic_vector(3 downto 0)
);
end entity rishi;

architecture rishi_behave of rishi is

  component slice is
  port(
    inputs: in std_logic_vector(3 downto 0);
    tin, tnext, clock, gclock, reset: in std_logic;
    outputs, fs: out std_logic_vector(3 downto 0);
    tout: out std_logic
  );
  end component slice;

  component preprocess is
  port(
    inputs, fs: in std_logic_vector(3 downto 0);
    load_gen, clock: in std_logic;
    outputs: out std_logic_vector(3 downto 0);
    gclock: out std_logic
  );
  end component preprocess;

  signal common_bus: std_logic_vector(3 downto 0);
  signal track: std_logic := '1';
  signal gclock: std_logic;

begin

  PRE: preprocess port map(inputs, common_bus, load_gen, clock,
       outputs, gclock);

  rishi_process: process(common_bus)
  begin
    fs <= common_bus;
  end process rishi_process;

end rishi_behave;

