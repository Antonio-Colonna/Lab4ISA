library ieee;
use ieee.std_logic_1164.all;

entity reg_bit is
port (clk : IN std_logic;			
	  D : IN std_logic;	
	  Q : OUT std_logic	
	  );
end reg_bit;

architecture Behavioral of reg_bit is 
begin

process(clk)
begin 	
	if (rising_edge(clk)) then	
			Q <= D; 
	end if; 
end process;

end Behavioral;  
