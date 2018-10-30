library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(
  a, b, gate: in std_logic;
  output: out std_logic
);
end entity mux;

architecture mux_behave of mux is
begin
  mux_process: process(a, b, gate)
  begin
    if (gate = '1') then
      output <= b;
    else
      output <= a;
    end if;
  end process mux_process;
end mux_behave;