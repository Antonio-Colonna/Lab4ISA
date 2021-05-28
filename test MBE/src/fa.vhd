library ieee;
use ieee.std_logic_1164.all;

entity fa is
	port(	A, B, Cin : IN std_logic;
			S, Cout : OUT std_logic);
end fa;

architecture Structure OF fa IS
begin

S <= A XOR B XOR Cin;
Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);

end Structure;