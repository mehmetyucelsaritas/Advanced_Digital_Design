library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is

	port 
	(
		A		: in unsigned (2 downto 0);
		B		: in unsigned (2 downto 0);
		SEL	: in unsigned (3 downto 0);
		Y	   : out unsigned (3 downto 0);
		Y_LED : out std_logic_vector (6 downto 0)
	);

end ALU;


architecture rtl of ALU is
	
	component AU is
		port 
		(
			A_AU		: in unsigned (2 downto 0);
			B_AU		: in unsigned (2 downto 0);
			SEL_AU	: in unsigned (2 downto 0);
			Y_AU	: out unsigned (3 downto 0)	
		);
	end component;
	
	component LU is
		port 
		(
			A_LU		: in unsigned (2 downto 0);
			B_LU		: in unsigned (2 downto 0);
			SEL_LU	: in unsigned (2 downto 0);
			Y_LU	: out unsigned (3 downto 0)	
		);
	end component;
	
	component MUX is
		port 
		(
			A_MUX		: in unsigned (3 downto 0);
			B_MUX		: in unsigned (3 downto 0);
			SEL_MUX	: in unsigned (0 downto 0);
			Y_MUX	: out unsigned (3 downto 0)	
		);
	end component;
	
	component hex2led IS
		PORT (
			HEX : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END component;
	
	SIGNAL temp1: unsigned (3 downto 0);
	SIGNAL temp2: unsigned (3 downto 0);
	SIGNAL temp3: unsigned (3 downto 0);
	
begin
	
	--process(A,B,SEL) --a,b,SEL are  sensivity lists(when one of them changed processes triggered)
	--begin
		
	c1: AU port map(A_AU => A, B_AU => B, SEL_AU => SEL(2 downto 0), Y_AU => temp1);
	c2: LU port map(A_LU => A, B_LU => B, SEL_LU => SEL(2 downto 0), Y_LU => temp2);
	c3: MUX port map(A_MUX => temp1, B_MUX => temp2, SEL_MUX => SEL(3 downto 3),Y_MUX => temp3);
	Y <= temp3;
	c4: hex2led port map(HEX => std_logic_vector(temp3), LED => Y_LED);
		
	--end process;
   
end rtl;
