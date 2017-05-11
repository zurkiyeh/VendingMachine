library IEEE ;
use IEEE.std_logic_1164.all ;


entity bit_adder_8_implementation is
port ( A,B : in std_logic_vector (7 downto 0); -- two numbers to be added
Sum : out std_logic_vector (7 downto 0); -- output of addition
Carry : out std_logic); --output ports
end bit_adder_8_implementation;


-- Structure view of Half Adder
architecture structure_view_8_bit_adder of bit_adder_8_implementation is

-- Remember to add the gates you're using
-- into this portion of the code!


component bit_adder_8 
port(A, B, C : in std_logic; Sum, Carry: out std_logic);
end component;



-- Remember to add the signals you're using
-- into this portion of the code!

signal  zero_bit, C_0, C_1, C_2, C_3, C_4, C_5, C_6 : std_logic;


begin
--  G4: and_gate_3_input port map (A_not, B_not, C, op1);

zero_bit <= '0';

bit_1 : bit_adder_8 port map (A(0), B(0), zero_bit, Sum (0), C_0 );
bit_2 : bit_adder_8 port map (A(1), B(1), C_0, Sum (1), C_1 );
bit_3 : bit_adder_8 port map (A(2), B(2), C_1, Sum (2), C_2 );
bit_4 : bit_adder_8 port map (A(3), B(3), C_2, Sum (3), C_3 );
bit_5 : bit_adder_8 port map (A(4), B(4), C_3, Sum (4), C_4 );
bit_6 : bit_adder_8 port map (A(5), B(5), C_4, Sum (5), C_5 );
bit_7 : bit_adder_8 port map (A(6), B(6), C_5, Sum (6), C_6 );
bit_8 : bit_adder_8 port map (A(7), B(7), C_6, Sum (7), Carry);




end structure_view_8_bit_adder;