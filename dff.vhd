library ieee;
use ieee.std_logic_1164.all;

entity dff is
port(
  d, clock: in std_logic;
  q: out std_logic
);
end entity dff;

architecture dff_behave of dff is
begin
  dff_process: process(clock)
  begin
    if rising_edge(clock) then
      q <= d after 478 ps;
    end if;
  end process dff_process;
end dff_behave;
