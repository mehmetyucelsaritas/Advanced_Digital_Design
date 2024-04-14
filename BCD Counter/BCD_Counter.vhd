-- Quartus Prime VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCD_Counter is

	generic
	(
		MIN_COUNT : natural := 0;
		MAX_COUNT : natural := 9
	);

	port
	(
		clk	  : in std_logic;
		reset	  : in std_logic;
		q		  : out integer range MIN_COUNT to MAX_COUNT;
		q_led	  : out std_logic_vector (6 DOWNTO 0)
	);

end entity;

architecture rtl of BCD_Counter is
	
	component hex2led IS
		PORT (
			HEX : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			LED : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
		);
	END component;
	
	signal cnt : integer range MIN_COUNT to MAX_COUNT;
	signal temp : std_logic_vector (3 downto 0);
	
begin
	temp <= std_logic_vector(to_unsigned(cnt, temp'length));
	c1: hex2led port map(HEX => temp, LED => q_led);
	
	process (clk)
		
	begin
		if (rising_edge(clk)) then

			if reset = '1' or cnt >= 9 then
				-- Reset the counter to 0
				cnt <= 0;
			else 
				-- Increment the counter if counting is enabled			   
				cnt <= cnt + 1;
			end if;
			
		end if;
		
		-- Output the current count
		q <= cnt;
	end process;

end rtl;
