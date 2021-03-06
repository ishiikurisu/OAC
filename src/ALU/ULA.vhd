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
		elsif opcode = "0001" then
			r := A or B;
		elsif opcode = "0010" then
			r := std_logic_vector(signed(A) + signed(B));
		elsif opcode = "0011" then
			r := std_logic_vector(unsigned(A) + unsigned(B));
		elsif opcode = "0100" then
			r := std_logic_vector(signed(A) - signed(B));
		elsif opcode = "0101" then
			r := std_logic_vector(unsigned(A) - unsigned(B));
		elsif opcode = "0110" then
			if signed(A) < signed(B) then
				r := X"00000001";
			else
				r := X"00000000";
			end if;
		elsif opcode = "0111" then
			if unsigned(A) < unsigned(B) then
				r := X"00000001";
			else
				r := X"00000000";
			end if;
		elsif opcode = "1000" then
			r := A nor B;
		elsif opcode = "1001" then
			r := A xor B;
		elsif opcode = "1010" then
			r := std_logic_vector(shift_left(unsigned(A), 
			                                 to_integer(unsigned(B))));
		elsif opcode = "1011" then
			r := std_logic_vector(shift_right(unsigned(A), 
			                                  to_integer(unsigned(B))));
		elsif opcode = "1100" then
			r := std_logic_vector(shift_right(signed(A), 
			                                  to_integer(unsigned(B))));
		elsif opcode = "1101" then
			r := std_logic_vector(rotate_left(unsigned(A), 
			                                  to_integer(unsigned(B))));
		elsif opcode = "1110" then 
			r := std_logic_vector(rotate_right(unsigned(A), 
			                                   to_integer(unsigned(B))));
		else
			r := std_logic_vector(to_signed(0, 32));
		end if;
			  
		Z <= r;
		if r = X"00000000" 
			then zero <= '1';
			else zero <= '0';
		end if;
		if opcode = "0010" then
			if ((signed(A) > to_signed(0, 32)) 
			and (signed(B) > to_signed(0, 32)) 
			and (signed(r) < signed(A)) 
			and (signed(r) < signed(B)))
			or ((signed(A) < to_signed(0, 32))
			and (signed(B) < to_signed(0, 32))
			and (signed(r) > signed(A))
			and (signed(r) > signed(B))) then
				ovfl <= '1';
			else
				ovfl <= '0';
			end if;
		elsif opcode = "0100" then
			if ((signed(A) < 0) 
			and (signed(B) > 0)
			and (signed(r) > signed(B)))
			or ((signed(A) > 0) 
			and (signed(B) < 0)
			and (signed(r) > signed(A))) then
				ovfl <= '1';
			else
				ovfl <= '0';
			end if;
		else
			ovfl <= '0';
		end if;
	end process;
end rtl;