library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity par_prod_gen is 
generic (N : integer := 32);
       port ( a: IN std_logic_vector (N-1 downto 0);
	          b_3 : IN std_logic_vector (2 downto 0);
			  S : OUT std_logic;
			  par_prod : OUT std_logic_vector (N downto 0)
			 );
end par_prod_gen;

architecture behavior of par_prod_gen is
BEGIN

case_b_3 : process(a, b_3)
variable pp_t : std_logic_vector(N downto 0) := (others => '0');
variable sign : std_logic := '0';

begin
	case b_3 is
		when "000" => 	pp_t := (others => '0');
						sign := '0';
		when "001" => 	pp_t(N-1 downto 0) := a;		-- + a
						pp_t(N) := '0';
						sign := '0';
		when "010" => 	pp_t(N-1 downto 0) := a;		-- + a
						pp_t(N) := '0';
						sign := '0';
		when "011" => 	pp_t(N downto 1) := a;		-- + 2 * a
						pp_t(0) := '0';
						sign := '0';
		when "100" => 	pp_t(N downto 1) := a;		-- - 2 * a
						pp_t(0) := '0';
						pp_t := not(pp_temp);
						sign := '1';
		when "101" => 	pp_t(N-1 downto 0) := a;		-- - a
						pp_t(N) := '0';
						pp_t := not(pp_temp);
						sign := '1';
		when "110" => 	pp_t(N-1 downto 0) := a;		-- - a
						pp_t(N) := '0';
						pp_t := not(pp_temp);
						sign := '1';
		when "111" => 	pp_t := (others => '1');
						sign := '1';
		when others => 	pp_t := (others => '0');
	end case;
	
	par_prod <= pp_t;
	S <= sign;
	
end process case_b_3;

END behavior;
