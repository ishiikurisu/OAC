library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
	generic(
		WSIZE: natural := 32
	);
	port (
		signal opcode: in std_logic_vector(3 downto 0);
		signal A, B: in std_logic_vector(WSIZE-1 downto 0);
		signal Z: out std_logic_vector(WSIZE-1 downto 0);
		signal zero, ovfl: out std_logic
	);
end ULA;

architecture rtl of ULA is
begin
	working: process(opcode, A, B)
		variable r: std_logic_vector(WSIZE-1 downto 0);
	begin
		if opcode = "0000" then
			r := A and B;
		else if opcode = "0001" then
			r := A or B;
		else if opcode = "0010" then
			r := std_logic_vector(signed(A) + signed(B));
		else
			r := std_logic_vector(to_signed(0, 32));
		end if; end if; end if; -- This looks horrible! Can this be better?
			  
		Z <= r;
		if r = X"00000000" 
			then zero <= '1';
			else zero <= '0';
		end if;
		ovfl <= '0';
	end process;
end rtl;