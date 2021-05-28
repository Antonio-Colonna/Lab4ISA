library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MBE is
	port(	A, B : IN std_logic_vector(31 downto 0);
			PROD : OUT std_logic_vector(63 downto 0));
END MBE;

architecture Structure of MBE is

component par_prod_gen is 
generic (N : integer := 32);
       port ( a: IN std_logic_vector (N-1 downto 0);
	          b_3 : IN std_logic_vector (2 downto 0);
			  S : OUT std_logic;
			  par_prod : OUT std_logic_vector (N downto 0)
			 );
end component;

component dadda_tree is
port(	pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16  : IN std_logic_vector(63 downto 0);
			sum : OUT std_logic_vector(63 downto 0));
end component;

signal multiplier : std_logic_vector(34 downto 0);
signal S: std_logic_vector (16 downto 0);
signal pp0_64, pp1_64, pp2_64, pp3_64, pp4_64, pp5_64, pp6_64, pp7_64, pp8_64, pp9_64, pp10_64, pp11_64, pp12_64, pp13_64, pp14_64, pp15_64, pp16_64 : std_logic_vector(63 downto 0);
type pp_33_vec is array (0 to 16) of std_logic_vector(32 downto 0);
signal pp_33: pp_33_vec;

begin 
-- completation of multiplier 
multiplier <= "00" & B & '0';

--Generation of 17 partial products and S
pp_gen: for i in 0 to 16 generate
signal b_3 : std_logic_vector(2 downto 0);
	begin
	b_3 <= multiplier(i*2+2 downto i*2);
	pp: par_prod_gen PORT MAP(A, b_3 , S(i), pp_33(i));
end generate;

-- Creation of the structure for the dadda_tree

--partial product 0
pp0_64(63 downto 0) <= pp_33(16)(31 downto 4) & not(S(0)) & S(0) & S(0) & pp_33(0)(32 downto 0);

--partial product 1
pp1_64(63 downto 0) <= not(S(15)) & pp_33(15)(32 downto 7) & '1' & not(S(1)) & pp_33(1)(32 downto 0) & '0' & S(0);

--partial product 2
pp2_64(63 downto 0) <= '0' & '1' & not(S(14)) & pp_33(14)(32 downto 11) & '1' & not(S(2)) & pp_33(2)(32 downto 0) & '0' & S(1) & "00";

--partial product 3
pp3_64(63 downto 0) <= "000" & '1' & not(S(13)) & pp_33(13)(32 downto 15) & '1' & not(S(3)) & pp_33(3)(32 downto 0) & '0' & S(2) & "0000";

--partial product 4
pp4_64(63 downto 59) <= (others => '0'); 
pp4_64(5 downto 0) <= (others => '0'); 
pp4_64(58 downto 6) <= '1' & not(S(12)) & pp_33(12)(32 downto 19) & '1' & not(S(4)) & pp_33(4)(32 downto 0) & '0' & S(3);

--partial product 5
pp5_64(63 downto 57) <= (others => '0'); 
pp5_64(7 downto 0) <= (others => '0');
pp5_64(56 downto 8) <= '1' & not(S(11)) & pp_33(11)(32 downto 23) & '1' & not(S(5)) & pp_33(5)(32 downto 0) & '0' & S(4);

--partial product 6
pp6_64(63 downto 55) <= (others => '0'); 
pp6_64(9 downto 0) <= (others => '0');
pp6_64(54 downto 10) <='1' & not(S(10)) & pp_33(10)(32 downto 27) & '1' & not(S(6)) & pp_33(6)(32 downto 0) & '0' & S(5);

--partial product 7
pp7_64(63 downto 53) <= (others => '0'); 
pp7_64(11 downto 0) <= (others => '0');
pp7_64(52 downto 12) <= '1' & not(S(9)) & pp_33(9)(32 downto 31) & '1' & not(S(7)) & pp_33(7)(32 downto 0) & '0' & S(6);

--partial product 8
pp8_64(63 downto 51) <= (others => '0');
pp8_64(13 downto 0) <= (others => '0');
pp8_64(50 downto 14) <= '1'& not(S(8)) & pp_33(8)(32 downto 0)& '0' & S(7);

--partial product 9
pp9_64(63 downto 49) <= (others => '0');
pp9_64(15 downto 0) <= (others => '0');
pp9_64(48 downto 16) <= pp_33(9)(30 downto 0)& '0' & S(8);

--partial product 10
pp10_64(63 downto 47) <= (others => '0');
pp10_64(17 downto 0) <= (others => '0');
pp10_64(46 downto 18) <= pp_33(10)(26 downto 0)& '0' & S(9);

--partial product 11
pp11_64(63 downto 45) <= (others => '0');
pp11_64(19 downto 0) <= (others => '0');
pp11_64(44 downto 20) <= pp_33(11)(22 downto 0)& '0' & S(10);

--partial product 12
pp12_64(63 downto 43) <= (others => '0');
pp12_64(21 downto 0) <= (others => '0');
pp12_64(42 downto 22) <= pp_33(12)(18 downto 0)& '0' & S(11);

--partial product 13
pp13_64(63 downto 41) <= (others => '0');
pp13_64(23 downto 0) <= (others => '0');
pp13_64(40 downto 24) <= pp_33(13)(14 downto 0)& '0' & S(12);

--partial product 14
pp14_64(63 downto 39) <= (others => '0');
pp14_64(25 downto 0) <= (others => '0');
pp14_64(38 downto 26) <= pp_33(14)(10 downto 0)& '0' & S(13);

--partial product 15
pp15_64(63 downto 37) <= (others => '0');
pp15_64(27 downto 0) <= (others => '0');
pp15_64(36 downto 28) <= pp_33(15)(6 downto 0)& '0' & S(14);

--partial product 16
pp16_64(63 downto 36) <= (others => '0');
pp16_64(29 downto 0) <= (others => '0');
pp16_64(35 downto 30) <= pp_33(16)(3 downto 0)& '0' & S(15);

--------------------------------------------------------------
--sum partial products
sum_dadda: dadda_tree port map (pp0_64, pp1_64, pp2_64, pp3_64, pp4_64, pp5_64, pp6_64, pp7_64, pp8_64, pp9_64, pp10_64, pp11_64, pp12_64, pp13_64, pp14_64, pp15_64, pp16_64, PROD);

end Structure;