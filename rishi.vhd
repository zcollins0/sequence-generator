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

begin




end rishi_behave;