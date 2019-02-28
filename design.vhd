library ieee;
use ieee.std_logic_1164.all;

entity design is 
	port(a : in std_logic_vector (3 downto 0);       -- input1 mux 1
	     b : in std_logic_vector (3 downto 0);   	 -- input2 mux 1
	     c : in std_logic_vector (3 downto 0);   	 -- input1 mux 2
	     d : in std_logic_vector (3 downto 0);   	 -- input2 mux 2
	     selector1 : in std_logic_vector(3 downto 0);-- selector mux 1
	     mout1 : inout std_logic_vector(3 downto 0); 			 -- output 1 mux 2
	     mout2 : inout std_logic_vector(3 downto 0);			 -- output 1 mux 2
	     seven_segment : out std_logic_vector (6 downto 0)); -- output bcd to 7 segment
	     
	     
end design;
architecture Behavioral of design is
begin
with selector1 select
	mout1 <= a when "0000",
		 b when "0001",
		'0' when others;
	mout2 <= c when "0010",
		 d when "0011",
		'0' when others;
process(mout1,mout2)
begin
case mout1 is
when "0000" => seven_segment <= "0000001";
when "0001" => seven_segment <= "1001111";
case mout2 is
when "0010" => seven_segment <= "0010010";
when "0011" => seven_segment <= "0000110";
end case;
end process;
end Behavioral;
