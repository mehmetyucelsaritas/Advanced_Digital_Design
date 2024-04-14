-- Quartus Prime VHDL Template
-- Unsigned Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LU is

	port 
	(
		A_LU		: in unsigned (2 downto 0);
		B_LU		: in unsigned (2 downto 0);
		SEL_LU	: in unsigned (2 downto 0);
		Y_LU	: out unsigned (3 downto 0)	
	);

end entity;


architecture rtl of LU is
	SIGNAL TEMP: unsigned (7 DOWNTO 0);
	SIGNAL A_TEMP: unsigned (3 DOWNTO 0);
	SIGNAL B_TEMP: unsigned (3 DOWNTO 0);
	
begin

	process(A_LU,B_LU,SEL_LU) --a,b,SEL are  sensivity lists(when one of them changed processes triggered)
	
	begin
		A_TEMP <= "0" & A_LU;
		B_TEMP <= "0" & B_LU;
		-- add if "add_sub" is 1, else subtract
		if (SEL_LU = "000") then
			Y_LU <= NOT A_TEMP;
		elsif (SEL_LU = "001") then
			Y_LU <= NOT B_TEMP;
		elsif (SEL_LU = "010") then
			Y_LU <= A_TEMP AND B_TEMP;
		elsif (SEL_LU = "011") then
			Y_LU <= A_TEMP OR B_TEMP;
		elsif (SEL_LU = "100") then
			Y_LU <= A_TEMP XNOR B_TEMP;
		elsif (SEL_LU = "101") then
			Y_LU <= A_TEMP XOR B_TEMP;
		elsif (SEL_LU = "110") then
			Y_LU <= A_TEMP NOR B_TEMP;
		else 
			Y_LU <= A_TEMP NAND B_TEMP;
		end if;
		
	end process;

end rtl;
