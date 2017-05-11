library ieee;
use ieee.std_logic_1164.all;

entity comp8bit is
 port(
 a,b: in std_logic_vector(7 downto 0);
 eq,gtr,les: out std_logic
 );
end comp8bit;

architecture model of comp8bit is
begin     
eq <= '1' when a = b else '0';
gtr <= '1' when a > b else '0';
 les <= '1' when a < b else '0';

end model;