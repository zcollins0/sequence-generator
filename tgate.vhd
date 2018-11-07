library ieee;
use ieee.std_logic_1164.all;

entity tgate is
port(
  input, gate: in std_logic;
  output: out std_logic
);
end entity tgate;

architecture tgate_behave of tgate is
begin
  tgate_process: process(input, gate)
  begin
    if (gate = '1') then
      output <= not input after 479 ps;
    else
      output <= 'Z';
    end if;
  end process tgate_process;
end tgate_behave;
