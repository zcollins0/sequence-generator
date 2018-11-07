library ieee;
use ieee.std_logic_1164.all;

entity norgate is
port(
  a, b: in std_logic;
  output: out std_logic
);
end entity norgate;

architecture norgate_behave of norgate is
begin
  norgate_process: process(a, b)
  begin
    output <= a nor b after 367 ps;
  end process norgate_process;
end norgate_behave;
