library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity not_gate is
port(I : in std_logic; O : out std_logic);
end not_gate;

architecture behavioral of not_gate is
begin
O <= not(I) after 10 ns;
end behavioral;


library IEEE ;
use IEEE.std_logic_1164.all ;


entity and_gate is
port(I1, I2:in std_logic;
O:out std_logic);
end and_gate;
architecture behavioral of and_gate is
begin
O <= (I1 and I2) after 10 ns;
end behavioral;


library IEEE ;
use IEEE.std_logic_1164.all ;


entity and_gate_4_input is
port (I1, I2, I3, I4: in std_logic;
O: out std_logic);
end and_gate_4_input;

architecture behavioral of and_gate_4_input is
begin
O <= (I1 and I2 and I3 and I4) after 10 ns;
end behavioral;


library IEEE ;
use IEEE.std_logic_1164.all ;


entity and_gate_3_input is
port(I1, I2, I3:in std_logic;
O:out std_logic);
end and_gate_3_input;
architecture behavioral of and_gate_3_input is
begin
O <= ((I1 and I2) and I3) after 10 ns;
end behavioral;


library IEEE ;
use IEEE.std_logic_1164.all ;


entity or_gate is
port(I1, I2:in std_logic;
O:out std_logic);
end or_gate;
architecture behavioral of or_gate is
begin
O <= (I1 or I2) after 10 ns;
end behavioral;

library IEEE ;
use IEEE.std_logic_1164.all ;


entity or_gate_4_inputs is
port(I1, I2, I3, I4 :in std_logic;
O:out std_logic);
end or_gate_4_inputs;
architecture behavioral of or_gate_4_inputs is
begin
O <= (((I1 or I2) or I3 ) or I4 ) after 10 ns;
end behavioral;


library IEEE ;
use IEEE.std_logic_1164.all ;


entity or_gate_3_inputs is
port(I1, I2, I3 :in std_logic;
O:out std_logic);
end or_gate_3_inputs;
architecture behavioral of or_gate_3_inputs is
begin
O <= ((I1 or I2) or I3 ) after 10 ns;
end behavioral;



library IEEE ;
use IEEE.std_logic_1164.all ;




entity exor_gate is
port(I1, I2:in std_logic;
O:out std_logic);
end exor_gate;
architecture behavioral of exor_gate is
begin
O <= (I1 xor I2) after 10 ns;
end behavioral;