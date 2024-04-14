library ieee;
use ieee.std_logic_1164.all;

entity sequence_detector is

	port(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture rtl of sequence_detector is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
	
		if reset = '1' then
			state <= s0;
			
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					if input = '1' then
						state <= s1;
					else
						state <= s0;
					end if;
				when s1=>
					if input = '1' then
						state <= s1;
					else
						state <= s2;
					end if;
				when s2=>
					if input = '1' then
						state <= s3;
					else
						state <= s0;
					end if;
				when s3 =>
					if input = '1' then
						state <= s1;
					else
						state <= s4;
					end if;
				when s4 =>
					if input = '1' then
						state <= s3;
					else
						state <= s0;
					end if;
					
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				output <= '0';
			when s1 =>
				output <= '0';
			when s2 =>
				output <= '0';
			when s3 =>
				output <= '1';
			when s4 =>
				output <= '1';
		end case;
	end process;

end rtl;
