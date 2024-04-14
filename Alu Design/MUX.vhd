-- Quartus Prime VHDL Template
-- Unsigned Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is

	port 
	(
		A_MUX		: in unsigned (3 downto 0);
		B_MUX		: in unsigned (3 downto 0);
		SEL_MUX	: in unsigned (0 downto 0);
		Y_MUX	: out unsigned (3 downto 0)	
	);

end entity;


architecture rtl of MUX is
	
begin

	process(A_MUX,B_MUX,SEL_MUX) --a,b,SEL are  sensivity lists(when one of them changed processes triggered)
	
	begin

		if (SEL_MUX = "0") then
			Y_MUX <= A_MUX;
		else 
			Y_MUX <= B_MUX;
		end if;
		
	end process;

end rtl;
