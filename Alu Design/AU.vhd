-- Quartus Prime VHDL Template
-- Unsigned Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AU is

	port 
	(
		A_AU		: in unsigned (2 downto 0);
		B_AU		: in unsigned (2 downto 0);
		SEL_AU	: in unsigned (2 downto 0);
		Y_AU	: out unsigned (3 downto 0)	
	);

end entity;


architecture rtl of AU is
	SIGNAL TEMP: unsigned (7 DOWNTO 0);
	SIGNAL A_TEMP: unsigned (3 DOWNTO 0);
	SIGNAL B_TEMP: unsigned (3 DOWNTO 0);
	
begin

	process(A_AU,B_AU,SEL_AU) --a,b,SEL are  sensivity lists(when one of them changed processes triggered)
	
	begin
		A_TEMP <= "0" & A_AU;
		B_TEMP <= "0" & B_AU;
		-- add if "add_sub" is 1, else subtract
		if (SEL_AU = "000") then
			Y_AU <= A_TEMP;
		elsif (SEL_AU = "001") then
			Y_AU <= A_TEMP + 1;
		elsif (SEL_AU = "010") then
			Y_AU <= A_TEMP - 1;
		elsif (SEL_AU = "011") then
			Y_AU <= B_TEMP;	
		elsif (SEL_AU = "100") then
		   Y_AU <= A_TEMP + B_TEMP;
		elsif (SEL_AU = "101") then
			Y_AU <= A_TEMP - B_TEMP;
		elsif (SEL_AU = "110") then
			TEMP <= A_TEMP*B_TEMP;
			Y_AU <= TEMP(3 DOWNTO 0);
		else
			Y_AU <= "0000";	
		end if;
		
	end process;

end rtl;
