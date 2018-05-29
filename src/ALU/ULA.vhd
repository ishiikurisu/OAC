library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA is
	port (
		opcode: in std_logic_vector(4 downto 0);
		A, B: in std_logic_vector(31 downto 0);
		Z: out std_logic_vector(31 downto 0);
		zero, ovfl: out std_logic
	);
end ULA;

architecture rtl of ULA is
begin
	Z <= std_logic_vector(signed(A) + signed(B));
end rtl;