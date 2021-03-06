library IEEE;
use IEEE.std_logic_1164.all;


entity reg8 is

port (d: in bit_vector (7 downto 0);

clk, synch_reset: in bit;

q: out bit_vector (7 downto 0));

end reg8;

architecture bhv of reg8 is
begin

	process (clk)

		begin
		if clk'event and clk = '1' then
		if synch_reset = '1' then
			q <= "00000000";
		else
			q <= d;
			end if;
		end if;
		
			
	end process;
end bhv;