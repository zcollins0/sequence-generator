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


begin




end preprocess_behave;
