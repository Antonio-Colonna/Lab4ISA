library ieee;
use ieee.std_logic_1164.all;

entity ha is
	port(	A, B : IN std_logic;
			S, Cout : OUT std_logic);
end ha;

architecture Structure OF ha IS
begin

S <= A XOR B ;
Cout <= A AND B;

end Structure;