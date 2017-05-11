library ieee ;
use ieee.std_logic_1164.all ;


entity Vending_Machine is 
port (

C, Choice, rst: in std_logic;
V, S0, S1 : in std_logic_vector(7 downto 0);
P, E: out std_logic_vector(7 downto 0);
D: out std_logic_vector(1 downto 0);


--Data Inputs, Control Inputs : in standard_logic or standard_logic_vector;
--Data Outputs, Control Outputs : in standard_logic or standard_logic_vector;

clk : in std_logic ) ;
end Vending_Machine ;


architecture rtl of Vending_Machine is






component datapath 
port (

-- Data Inputs
clk : in std_logic;
reset: in std_logic ;



-- Control Signals:
soda_Value : in std_logic_vector(7 downto 0);
cost: in std_logic_vector (7 downto 0);

enable_Change : in std_logic ;
accumilate_reset: in std_logic;



-- Conditions outputs
 
 comp_Greater: out std_logic;
 comp_Smaller: out std_logic;
 comp_Equal: out std_logic;
 
-- Data Outpus

final_Total: out std_logic_vector (7 downto 0);
final_Change: out std_logic_vector (7 downto 0)

) ;

end component ;

component controller
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

end component ;

signal greater, smaller, equal, enable_Change, enable_total, register_rst_flag, reset_system_flag : std_logic ;
signal valueInput, price_input: std_logic_vector (7 downto 0);
signal temp_change, temp_total: std_logic_vector (7 downto 0);


begin




if_reset: process (clk) begin

		if rst = '0' then
			--value_Coin <= value_cents;
			E <= temp_total;
			P <= "00000000";
		else	
			E <= temp_change;
			P <= temp_total ;
		end if;
	
end process if_reset ;









controll_process: controller port map (clk, C, V, S0, S1, Choice, rst, greater, smaller, equal, D, valueInput, price_input, enable_Change, register_rst_flag, reset_system_flag  );

datapath_Process: datapath port map (clk, reset_system_flag, valueInput, price_input, enable_Change, register_rst_flag, greater, smaller, equal, temp_total, temp_change  );


end rtl ;