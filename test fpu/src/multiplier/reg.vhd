library ieee;
use ieee.std_logic_1164.all;

entity reg is
generic(N : integer := 32);
port (
	clk : IN std_logic;			
	D : IN std_logic_vector (N - 1  downto 0);	
	Q : OUT std_logic_vector (N - 1 downto 0)	
	);
end reg;

architecture Behavioral of reg is 
begin
process(clk)
begin 	
	if (rising_edge(clk)) then
			Q <= D; 
	end if; 
end process;

end Behavioral;  
