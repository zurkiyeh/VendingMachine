library IEEE;
use IEEE.std_logic_1164.all;


entity accumulator_8_bits is

port ( data_in : in std_logic_vector (7 downto 0); -- two numbers to be added
clk,rst : in std_logic; -- output of addition
data_out :out  std_logic_vector (7 downto 0)); --output ports

end accumulator_8_bits;


architecture implementation of accumulator_8_bits is 


component bit_adder_8_implementation 
port(A,B : in std_logic_vector (7 downto 0); -- two numbers to be added
 Sum : out std_logic_vector (7 downto 0); -- output of addition
	Carry : out std_logic);
end component;



component reg8 
port(d: in std_logic_vector (7 downto 0); -- two numbers to be added
 clk, synch_reset: in std_logic;
	q: out std_logic_vector (7 downto 0));
	
end component;


signal  bit_adder_C_out: std_logic;	
signal adder_sum, regOut: std_logic_vector(7 downto 0) ;
			


begin


--inital_reg: (inital_value, clk, rst, data_out_inital);

adder_output: bit_adder_8_implementation port map (data_in,regOut, adder_sum, bit_adder_C_out);

reg_output : reg8 port map (adder_sum, clk, rst,regOut);

data_out <= regOut;





end implementation;