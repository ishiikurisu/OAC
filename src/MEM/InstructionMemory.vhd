library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
	generic (
		WSIZE: natural := 32
	);
	port (
		address: in std_logic_vector(7 downto 0);
		outlet: out std_logic_vector(WSIZE-1 downto 0);
		wPC, m1, clk: in std_logic;
	);
end InstructionMemory;

architecture rtl of InstructionMemory is
begin
	working: process(address, outlet, wPC, m1, clk)
		-- TODO Implement me!
	end process;
end InstructionMemory;
