-- Control Subsystems

library ieee ;
use ieee.std_logic_1164.all ;

entity controller is

port (

clk : in std_logic;

--Control Inputs 
coin_Detected: in std_logic;

value_cents: in std_logic_vector (7 downto 0);
soda_price_0: in std_logic_vector (7 downto 0);
soda_price_1: in std_logic_vector (7 downto 0);

soda_choice: in std_logic;
reset: in std_logic;

--Conditions inputs

comp_greater_in : in std_logic;
comp_smaller_in : in std_logic;
comp_equal_in	: in std_logic;

--Control Outputs
soda_Dispense: out std_logic_vector (1 downto 0);


--Control Signals
value_Coin: out std_logic_vector (7 downto 0);
price: out std_logic_vector (7 downto 0);

enable_change_reg: out std_logic;
register_rst: out std_logic;
reset_system: out std_logic

);

end controller ;

architecture rtl of controller is
type StateType is (waitState,dispenseState);
Signal present_state, next_state: StateType;
--signal --definitions;

begin
--select next state
--state register




detect_coin: process (clk) begin
		-- Check if a coin is detected or not, if yes then send 
		-- V to accumulator if not send 0s
		if coin_Detected = '1' then
			value_Coin <= value_cents;
		else
			value_Coin <= "00000000";
		end if;
	
end process detect_coin ;

change_choice: process (soda_choice) begin

if (soda_choice = '0') then
					price <= soda_price_0;
				else
					price <= soda_price_1;
				end if;

end process change_choice;


state_comb: process (present_state, comp_greater_in,comp_equal_in, comp_smaller_in ) begin

case present_state is

	when waitState =>
	
		register_rst <= '0';
		enable_change_reg <= '1';
		
		

			
		-- If we're still waiting then machine should not dispense
		-- soda, therefore value should remain '00'
		soda_Dispense <= "00";	
			
			
		-- We have more money than a price of Soda, go to the 
		-- Dispense state
		
		if (comp_smaller_in = '1' ) then
		
			next_state <= waitState;
			
			
	
		else 
		
		if (comp_greater_in = '1') then
		enable_change_reg <= '0';	
		end if;
		
		next_state <= dispenseState;
		
		end if;





	
	
	
	when dispenseState =>
	register_rst <='1';
	
		if (soda_choice ='1') then
		soda_Dispense<= "10";
		
		
		else
		soda_Dispense <= "01";
		
		end if;
	enable_change_reg <= '1';	
	next_state <= waitState;
	
	
	end case;
	
	
	if (reset = '0') then 
	
	reset_system <='1';
	register_rst <='1';
	enable_change_reg <= '1';
	
	end if;
	
	
	
	
	
end process state_comb;


state_clocked: process (clk) begin

 if (clk'event and clk='1') then
 present_state <= next_state;

 end if;
end process state_clocked;




end rtl ;



