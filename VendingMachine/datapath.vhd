-- Data Subsystems

library ieee ;
use ieee.std_logic_1164.all ;

entity datapath is
port (

-- Data Inputs
clk : in std_logic;
reset: in std_logic ;



-- Control Signals:
soda_Value : in std_logic_vector(7 downto 0);
cost: in std_logic_vector (7 downto 0);

enable_Change : in std_logic ;
accumilate_reset : in std_logic ;



-- Conditions outputs
 
 comp_Greater: out std_logic;
 comp_Smaller: out std_logic;
 comp_Equal: out std_logic;
 
-- Data Outpus

final_Total: out std_logic_vector (7 downto 0);
final_Change: out std_logic_vector (7 downto 0)

) ;
end datapath ;

architecture rtl of datapath is


-- Components decleration

component bit_adder_8_implementation 
port(A,B : in std_logic_vector (7 downto 0); -- two numbers to be added
 Sum : out std_logic_vector (7 downto 0); -- output of addition
Carry : out std_logic);
end component;

component twosComp
port(
A : in std_logic_vector(7 downto 0);
B : out std_logic_vector(7 downto 0)
);
end component;



component comp8bit
port(
 a,b: in std_logic_vector(7 downto 0);
 eq,gtr,les: out std_logic
 ); --output ports
end component;




component reg8

port (d: in std_logic_vector (7 downto 0);
clk, synch_reset: in std_logic;
q: out std_logic_vector (7 downto 0));
end component;

component accumulator_8_bits
port ( data_in : in std_logic_vector (7 downto 0); -- two numbers to be added
clk,rst : in std_logic; -- output of addition
data_out :out  std_logic_vector (7 downto 0)); --output ports
end component;


-- Signal definitions;
signal A,B,C: std_logic_vector(7 downto 0);
signal C_out: std_logic;


begin
--Combination Logic;



accumilate_output: accumulator_8_bits port map (soda_Value, clk, accumilate_reset, C);
total_Register: reg8 port map (C, clk, accumilate_reset, final_Total);


complementValue: twosComp port map (cost, A);
adderOutput: bit_adder_8_implementation port map(C, A, B, C_out);
change_Register: reg8 port map (B, clk, enable_Change, final_Change);



comapring_price: comp8bit port map (C, cost, comp_Equal, comp_Greater, comp_Smaller);


--entity output is register output
--Send outputs to Conditions, Data Outputs ;
end rtl ;