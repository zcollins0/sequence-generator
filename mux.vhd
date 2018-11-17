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
      output <= not a after 594 ps;
    else
      output <= not b after 594 ps;
    end if;
  end process mux_process;
end mux_behave;