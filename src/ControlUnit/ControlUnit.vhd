library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is
	generic (
		WSIZE: natural := 32
	);
	port (
		signal instruction: in std_logic_vector(WSIZE-1 downto 0);
		signal reg_dest,
		       jump,
				 branch,
				 mem_read,
				 mem_to_reg,
				 mem_write,
				 alu_src,
				 reg_write: out std_logic;
		signal alu_op: out std_logic_vector(3 downto 0)
	);
end ControlUnit;

architecture rtl of ControlUnit is
begin
	working: process(instruction)
	begin
		-- TODO Implement me!
	end process;
end rtl;
