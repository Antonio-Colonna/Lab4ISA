library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dadda_tree is
port(	pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16  : IN std_logic_vector(63 downto 0);
			sum : OUT std_logic_vector(63 downto 0));
end dadda_tree;

architecture Structure of dadda_tree is

component ha is
	port(	A, B : IN std_logic;
			S, Cout : OUT std_logic);
end component;

component fa is
	port(	A, B, Cin : IN std_logic;
			S, Cout : OUT std_logic);
end component;

signal pp0_lv5, pp1_lv5, pp2_lv5, pp3_lv5, pp4_lv5, pp5_lv5, pp6_lv5, pp7_lv5, pp8_lv5, pp9_lv5, pp10_lv5, pp11_lv5, pp12_lv5 : std_logic_vector(63 downto 0);
signal pp0_lv4, pp1_lv4, pp2_lv4, pp3_lv4, pp4_lv4, pp5_lv4, pp6_lv4, pp7_lv4, pp8_lv4: std_logic_vector(63 downto 0); 
signal pp0_lv3, pp1_lv3, pp2_lv3, pp3_lv3, pp4_lv3, pp5_lv3 : std_logic_vector(63 downto 0); 
signal pp0_lv2, pp1_lv2, pp2_lv2, pp3_lv2 : std_logic_vector(63 downto 0); 
signal pp0_lv1, pp1_lv1, pp2_lv1 : std_logic_vector(63 downto 0); 
signal pp0_lv0, pp1_lv0 : std_logic_vector(64 downto 0); 
signal sum_int : std_logic_vector(64 downto 0); 


begin


-- level 6: 17pp -> 13pp     40 fa + 12 ha

-- 40 fa

fa_g1_lv6 : for i in 26 to 41 generate
fa_lv6_p0p1p2 : fa port map(pp0(i), pp1(i), pp2(i), pp0_lv5(i), pp1_lv5(i+1));
end generate;

fa_g2_lv6 : for i in 28 to 39 generate
fa_lv6_p3p4p5 : fa port map(pp3(i), pp4(i), pp5(i), pp2_lv5(i), pp3_lv5(i+1));
end generate;

fa_g3_lv6 : for i in 30 to 37 generate
fa_lv6_p6p7p8 : fa port map(pp6(i), pp7(i), pp8(i), pp4_lv5(i), pp5_lv5(i+1));
end generate;

fa_g4_lv6 : for i in 32 to 35 generate
fa_lv6_p9p10p11 : fa port map(pp9(i), pp10(i), pp11(i), pp6_lv5(i), pp7_lv5(i+1));
end generate;

-- 12 ha

ha1_lv6: ha  port map(pp0(24), pp1(24), pp0_lv5(24), pp0_lv5(25));

ha2_lv6: ha  port map(pp0(25), pp1(25), pp1_lv5(25), pp1_lv5(26));

ha3_lv6: ha  port map(pp3(26), pp4(26), pp2_lv5(26), pp2_lv5(27));

ha4_lv6: ha  port map(pp3(27), pp4(27), pp3_lv5(27), pp3_lv5(28));

ha5_lv6: ha  port map(pp6(28), pp7(28), pp4_lv5(28), pp4_lv5(29));

ha6_lv6: ha  port map(pp6(29), pp7(29), pp5_lv5(29), pp5_lv5(30));

ha7_lv6: ha  port map(pp9(30), pp10(30), pp6_lv5(30), pp6_lv5(31));

ha8_lv6: ha  port map(pp9(31), pp10(31), pp7_lv5(31), pp7_lv5(32));

ha9_lv6: ha  port map(pp9(36), pp10(36), pp6_lv5(36), pp6_lv5(37));

ha10_lv6: ha  port map(pp6(38), pp7(38), pp4_lv5(38), pp4_lv5(39));

ha11_lv6: ha  port map(pp3(40), pp4(40), pp2_lv5(40), pp2_lv5(41));

ha12_lv6: ha  port map(pp0(42), pp1(42), pp0_lv5(42), pp0_lv5(43));

-- completion level 5

pp0_lv5(23 downto 0) <= pp0(23 downto 0);
pp0_lv5(63 downto 44) <= pp0(63 downto 44);

pp1_lv5(23 downto 0) <= pp1(23 downto 0);
pp1_lv5(63 downto 43) <= pp1(63 downto 43);

pp2_lv5(25 downto 0) <= pp2(25 downto 0);
pp2_lv5(63 downto 42) <= pp2(63 downto 42);

pp3_lv5(25 downto 0) <= pp3(25 downto 0);
pp3_lv5(63 downto 41) <= pp3(63 downto 41);

pp4_lv5(25 downto 0) <= pp4(25 downto 0);
pp4_lv5(63 downto 41) <= pp4(63 downto 41);

pp5_lv5(27 downto 0) <= pp5(27 downto 0);
pp5_lv5(63 downto 40) <= pp5(63 downto 40);

pp6_lv5(27 downto 0) <= pp6(27 downto 0);
pp6_lv5(63 downto 39) <= pp6(63 downto 39);

pp7_lv5(27 downto 0) <= pp7(27 downto 0);
pp7_lv5(63 downto 39) <= pp7(63 downto 39);

pp8_lv5(29 downto 0) <= pp8(29 downto 0);
pp8_lv5(63 downto 38) <= pp8(63 downto 38);

pp9_lv5(29 downto 0) <= pp9(29 downto 0);
pp9_lv5(63 downto 37) <= pp9(63 downto 37);

pp10_lv5(29 downto 0) <= pp10(29 downto 0);
pp10_lv5(63 downto 37) <= pp10(63 downto 37);

pp11_lv5(31 downto 0) <= pp11(31 downto 0);
pp11_lv5(63 downto 36) <= pp11(63 downto 36);

pp12_lv5(63 downto 44) <= pp12(63 downto 44);
pp12_lv5(43) <= pp0(43);
pp12_lv5(42 downto 0) <= pp12(42 downto 0);

pp1_lv5(24) <= pp13(24);

pp3_lv5(26) <= pp13(26);
pp4_lv5(26) <= pp14(26);

pp4_lv5(27) <= pp13(27);

pp5_lv5(28) <= pp13(28);
pp6_lv5(28) <= pp14(28);
pp7_lv5(28) <= pp15(28);

pp6_lv5(29) <= pp13(29);
pp7_lv5(29) <= pp14(29);

pp7_lv5(30) <= pp13(30);
pp8_lv5(30) <= pp14(30);
pp9_lv5(30) <= pp15(30);
pp10_lv5(30) <= pp16(30);

pp8_lv5(36 downto 31) <= pp13(36 downto 31);
pp9_lv5(36 downto 31) <= pp14(36 downto 31);
pp10_lv5(36 downto 31) <= pp15(36 downto 31);

pp11_lv5(35 downto 32) <= pp16(35 downto 32);

pp7_lv5(37) <= pp13(37);
pp8_lv5(37) <= pp14(37);

pp6_lv5(38) <= pp13(38);
pp7_lv5(38) <= pp14(38);

pp5_lv5(39) <= pp13(39);

pp4_lv5(40) <= pp13(40);

-- level 5: 13pp -> 9pp     104 fa + 12 ha

-- 104 fa
fa_g1_lv5 : for i in 18 to 49 generate
fa_lv5_p0p1p2 : fa port map(pp0_lv5(i), pp1_lv5(i), pp2_lv5(i), pp0_lv4(i), pp1_lv4(i+1));
end generate;

fa_g2_lv5 : for i in 20 to 47 generate
fa_lv5_p3p4p5 : fa port map(pp3_lv5(i), pp4_lv5(i), pp5_lv5(i), pp2_lv4(i), pp3_lv4(i+1));
end generate;

fa_g3_lv5 : for i in 22 to 45 generate
fa_lv5_p6p7p8 : fa port map(pp6_lv5(i), pp7_lv5(i), pp8_lv5(i), pp4_lv4(i), pp5_lv4(i+1));
end generate;

fa_g4_lv5 : for i in 24 to 43 generate
fa_lv5_p9p10p11 : fa port map(pp9_lv5(i), pp10_lv5(i), pp11_lv5(i), pp6_lv4(i), pp7_lv4(i+1));
end generate;

-- 12 ha

ha1_lv5: ha  port map(pp0_lv5(16), pp1_lv5(16), pp0_lv4(16), pp0_lv4(17));

ha2_lv5: ha  port map(pp0_lv5(17), pp1_lv5(17), pp1_lv4(17), pp1_lv4(18));

ha3_lv5: ha  port map(pp3_lv5(18), pp4_lv5(18), pp2_lv4(18), pp2_lv4(19));

ha4_lv5: ha  port map(pp3_lv5(19), pp4_lv5(19), pp3_lv4(19), pp3_lv4(20));

ha5_lv5: ha  port map(pp6_lv5(20), pp7_lv5(20), pp4_lv4(20), pp4_lv4(21));

ha6_lv5: ha  port map(pp6_lv5(21), pp7_lv5(21), pp5_lv4(21), pp5_lv4(22));

ha7_lv5: ha  port map(pp9_lv5(22), pp10_lv5(22), pp6_lv4(22), pp6_lv4(23));

ha8_lv5: ha  port map(pp9_lv5(23), pp10_lv5(23), pp7_lv4(23), pp7_lv4(24));

ha9_lv5: ha  port map(pp9_lv5(44), pp10_lv5(44), pp6_lv4(44), pp6_lv4(45));

ha10_lv5: ha  port map(pp6_lv5(46), pp7_lv5(46), pp4_lv4(46), pp4_lv4(47));

ha11_lv5: ha  port map(pp3_lv5(48), pp4_lv5(48), pp2_lv4(48), pp2_lv4(49));

ha12_lv5: ha  port map(pp0_lv5(50), pp1_lv5(50), pp0_lv4(50), pp0_lv4(51));

-- completion level 4

pp0_lv4(15 downto 0) <= pp0_lv5(15 downto 0);
pp0_lv4(63 downto 52) <= pp0_lv5(63 downto 52);

pp1_lv4(15 downto 0) <= pp1_lv5(15 downto 0);
pp1_lv4(63 downto 51) <= pp1_lv5(63 downto 51);

pp2_lv4(17 downto 0) <= pp2_lv5(17 downto 0);
pp2_lv4(63 downto 50) <= pp2_lv5(63 downto 50);

pp3_lv4(17 downto 0) <= pp3_lv5(17 downto 0);
pp3_lv4(63 downto 49) <= pp3_lv5(63 downto 49);

pp4_lv4(17 downto 0) <= pp4_lv5(17 downto 0);
pp4_lv4(63 downto 49) <= pp4_lv5(63 downto 49);

pp5_lv4(19 downto 0) <= pp5_lv5(19 downto 0);
pp5_lv4(63 downto 48) <= pp5_lv5(63 downto 48);

pp6_lv4(19 downto 0) <= pp6_lv5(19 downto 0);
pp6_lv4(63 downto 47) <= pp6_lv5(63 downto 47);

pp7_lv4(19 downto 0) <= pp7_lv5(19 downto 0);
pp7_lv4(63 downto 47) <= pp7_lv5(63 downto 47);

pp8_lv4(21 downto 0) <= pp8_lv5(21 downto 0);
pp8_lv4(63 downto 52) <= pp8_lv5(63 downto 52);
pp8_lv4(50 downto 46) <= pp8_lv5(50 downto 46);
pp8_lv4(51) <= pp0_lv5(51);

pp1_lv4(16) <= pp9_lv5(16);

pp3_lv4(18) <= pp9_lv5(18);
pp4_lv4(18) <= pp10_lv5(18);

pp4_lv4(19) <= pp9_lv5(19);

pp5_lv4(20) <= pp9_lv5(20);
pp6_lv4(20) <= pp10_lv5(20);
pp7_lv4(20) <= pp11_lv5(20);

pp6_lv4(21) <= pp9_lv5(21);
pp7_lv4(21) <= pp10_lv5(21);

pp7_lv4(22) <= pp11_lv5(22);
pp8_lv4(22) <= pp12_lv5(22);

pp8_lv4(23) <= pp11_lv5(23);

pp8_lv4(43 downto 24) <= pp12_lv5(43 downto 24);

pp8_lv4(44) <= pp11_lv5(44);

pp7_lv4(45) <= pp9_lv5(45);
pp8_lv4(45) <= pp10_lv5(45);

pp6_lv4(46) <= pp9_lv5(46);
pp7_lv4(46) <= pp10_lv5(46);

pp5_lv4(47) <= pp9_lv5(47);

pp4_lv4(48) <= pp9_lv5(48);

-- level 4: 9pp -> 6pp     120 fa + 9 ha

-- 120 fa

fa_g1_lv4 : for i in 12 to 55 generate
fa_lv4_p0p1p2 : fa port map(pp0_lv4(i), pp1_lv4(i), pp2_lv4(i), pp0_lv3(i), pp1_lv3(i+1));
end generate;

fa_g2_lv4 : for i in 14 to 53 generate
fa_lv4_p3p4p5 : fa port map(pp3_lv4(i), pp4_lv4(i), pp5_lv4(i), pp2_lv3(i), pp3_lv3(i+1));
end generate;

fa_g3_lv4 : for i in 16 to 51 generate
fa_lv4_p6p7p8 : fa port map(pp6_lv4(i), pp7_lv4(i), pp8_lv4(i), pp4_lv3(i), pp5_lv3(i+1));
end generate;

-- 9 ha

ha1_lv4: ha  port map(pp0_lv4(10), pp1_lv4(10), pp0_lv3(10), pp0_lv3(11));

ha2_lv4: ha  port map(pp0_lv4(11), pp1_lv4(11), pp1_lv3(11), pp1_lv3(12));

ha3_lv4: ha  port map(pp3_lv4(12), pp4_lv4(12), pp2_lv3(12), pp2_lv3(13));

ha4_lv4: ha  port map(pp3_lv4(13), pp4_lv4(13), pp3_lv3(13), pp3_lv3(14));

ha5_lv4: ha  port map(pp6_lv4(14), pp7_lv4(14), pp4_lv3(14), pp4_lv3(15));

ha6_lv4: ha  port map(pp6_lv4(15), pp7_lv4(15), pp5_lv3(15), pp5_lv3(16));

ha7_lv4: ha  port map(pp6_lv4(52), pp7_lv4(52), pp4_lv3(52), pp4_lv3(53));

ha8_lv4: ha  port map(pp3_lv4(54), pp4_lv4(54), pp2_lv3(54), pp2_lv3(55));

ha9_lv4: ha  port map(pp0_lv4(56), pp1_lv4(56), pp0_lv3(56), pp0_lv3(57));

-- completion level 3

pp0_lv3(9 downto 0) <= pp0_lv4(9 downto 0);
pp0_lv3(63 downto 58) <= pp0_lv4(63 downto 58);

pp1_lv3(9 downto 0) <= pp1_lv4(9 downto 0);
pp1_lv3(63 downto 57) <= pp1_lv4(63 downto 57);

pp2_lv3(11 downto 0) <= pp2_lv4(11 downto 0);
pp2_lv3(63 downto 56) <= pp2_lv4(63 downto 56);

pp3_lv3(11 downto 0) <= pp3_lv4(11 downto 0);
pp3_lv3(63 downto 55) <= pp3_lv4(63 downto 55);

pp4_lv3(11 downto 0) <= pp4_lv4(11 downto 0);
pp4_lv3(63 downto 55) <= pp4_lv4(63 downto 55);

pp5_lv3(13 downto 0) <= pp5_lv4(13 downto 0);
pp5_lv3(63 downto 58) <= pp5_lv4(63 downto 58);
pp5_lv3(56 downto 54) <= pp5_lv4(56 downto 54);
pp5_lv3(57) <= pp0_lv4(57);

pp1_lv3(10) <= pp6_lv4(10);

pp3_lv3(12) <= pp7_lv4(12);

pp4_lv3(13 downto 12) <= pp6_lv4(13 downto 12);

pp5_lv3(14) <= pp8_lv4(14);

pp5_lv3(53) <= pp6_lv4(53);

pp4_lv3(54) <= pp6_lv4(54);

-- level 3 : 6pp -> 4pp     100 fa + 6 ha

-- 100 fa

fa_g1_lv3 : for i in 8 to 59 generate
fa_lv3_p0p1p2 : fa port map(pp0_lv3(i), pp1_lv3(i), pp2_lv3(i), pp0_lv2(i), pp1_lv2(i+1));
end generate;

fa_g2_lv3 : for i in 10 to 57 generate
fa_lv3_p3p4p5 : fa port map(pp3_lv3(i), pp4_lv3(i), pp5_lv3(i), pp2_lv2(i), pp3_lv2(i+1));
end generate;

-- 6 ha

ha1_lv3: ha  port map(pp0_lv3(6), pp1_lv3(6), pp0_lv2(6), pp0_lv2(7));

ha2_lv3: ha  port map(pp0_lv3(7), pp1_lv3(7), pp1_lv2(7), pp1_lv2(8));

ha3_lv3: ha  port map(pp3_lv3(8), pp4_lv3(8), pp2_lv2(8), pp2_lv2(9));

ha4_lv3: ha  port map(pp3_lv3(9), pp4_lv3(9), pp3_lv2(9), pp3_lv2(10));

ha5_lv3: ha  port map(pp3_lv3(58), pp4_lv3(58), pp2_lv2(58), pp2_lv2(59));

ha6_lv3: ha  port map(pp0_lv3(60), pp1_lv3(60), pp0_lv2(60), pp0_lv2(61));

-- completion level 2

pp0_lv2(5 downto 0) <= pp0_lv3(5 downto 0);
pp0_lv2(63 downto 62) <= pp0_lv3(63 downto 62);

pp1_lv2(5 downto 0) <= pp1_lv3(5 downto 0);
pp1_lv2(63 downto 61) <= pp1_lv3(63 downto 61);

pp2_lv2(7 downto 0) <= pp2_lv3(7 downto 0);
pp2_lv2(63 downto 60) <= pp2_lv3(63 downto 60);

pp3_lv2(7 downto 0) <= pp3_lv3(7 downto 0);
pp3_lv2(63 downto 62) <= pp3_lv3(63 downto 62);
pp3_lv2(60 downto 59) <= pp3_lv3(60 downto 59);
pp3_lv2(61) <= pp0_lv3(61);

pp1_lv2(6) <= pp4_lv3(6) ;

pp3_lv2(8) <= pp5_lv3(8) ;

-- level 2 : 4pp -> 3pp     56 fa + 3 ha
-- 56 fa
fa_g1_lv2 : for i in 6 to 61 generate
fa_lv2_p0p1p2 : fa port map(pp0_lv2(i), pp1_lv2(i), pp2_lv2(i), pp0_lv1(i), pp1_lv1(i+1));
end generate;

-- 3 ha

ha1_lv2: ha  port map(pp0_lv2(4), pp1_lv2(4), pp0_lv1(4), pp0_lv1(5));

ha2_lv2: ha  port map(pp0_lv2(5), pp1_lv2(5), pp1_lv1(5), pp1_lv1(6));

ha3_lv2: ha  port map(pp0_lv2(62), pp1_lv2(62), pp0_lv1(62), pp0_lv1(63));

-- completion level 1

pp0_lv1(3 downto 0) <= pp0_lv2(3 downto 0);
pp1_lv1(63) <= pp0_lv2(63);

pp1_lv1(3 downto 0) <= pp1_lv2(3 downto 0);
pp2_lv1(63) <= pp1_lv2(63);

pp2_lv1(62) <= pp2_lv2(62);

pp2_lv1(61 downto 6) <= pp3_lv2(61 downto 6);

pp2_lv1(5 downto 0) <= pp2_lv2(5 downto 0);

pp1_lv1(4) <= pp3_lv2(4);

-- level 1 : 3pp -> 2pp     60 fa + 2 ha
-- 60 fa
fa_g1_lv1 : for i in 4 to 63 generate
fa_lv1_p0p1p2 : fa port map(pp0_lv1(i), pp1_lv1(i), pp2_lv1(i), pp0_lv0(i), pp1_lv0(i+1));
end generate;

-- 2 ha

ha1_lv1: ha  port map(pp0_lv1(2), pp1_lv1(2), pp0_lv0(2), pp0_lv0(3));

ha2_lv1: ha  port map(pp0_lv1(3), pp1_lv1(3), pp1_lv0(3), pp1_lv0(4));

-- completion level 0

pp0_lv0(1 downto 0) <= pp0_lv1(1 downto 0);
pp1_lv0(1 downto 0) <= pp1_lv1(1 downto 0);

pp1_lv0(2) <= pp2_lv1(2);

pp0_lv0(64) <= '0';

--final sum

sum_int <= unsigned(pp0_lv0) + unsigned(pp1_lv0) ;
sum <= sum_int(63 downto 0);

end Structure;