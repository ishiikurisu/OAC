library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BREG is
	generic(
		WSIZE: natural := 32
	);
	port (
		clk, wren, rst: in std_logic;
		radd1, radd2, wadd: in std_logic_vector(4 downto 0);
		wdata: in std_logic_vector(WSIZE-1 downto 0);
		r1, r2: out std_logic_vector(WSIZE-1 downto 0)
	);
end BREG;

architecture rtl of BREG is
begin
	working: process(clk, wren, rst, radd1, radd2, wadd, wdata)
	begin
		-- $0
		if radd1 = "00000" then
			r1 <= X"00000000";
		end if;
		if radd2 = "00000" then
			r2 <= X"00000000";
		end if;
		
		-- $1 until $31
		-- TODO Implement me!
	end process;
end rtl;