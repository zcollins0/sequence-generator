library ieee;
use ieee.std_logic_1164.all;

entity andgate is
port(
  a, b: in std_logic;
  output: out std_logic
);
end entity andgate;

architecture andgate_behave of andgate is
begin
  andgate_process: process(a, b)
  begin
    output <= a and b;
  end process andgate_process;
end andgate_behave;
