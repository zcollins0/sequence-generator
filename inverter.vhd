library ieee;
use ieee.std_logic_1164.all;

entity inverter is
port(
  input: in std_logic;
  output: out std_logic
);
end entity inverter;

architecture inverter_behave of inverter is
begin
  inverter_process: process(input)
  begin
    output <= not input;
  end process inverter_process;
end inverter_behave;