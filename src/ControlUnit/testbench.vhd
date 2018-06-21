library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture breg_arch of testbench is
	-- signals
	signal clock: std_logic;
	signal write_pc: std_logic;
	signal pc_input: std_logic;
	signal address: std_logic_vector(7 downto 0);
	signal data: std_logic_vector(31 downto 0);

	-- components
	component ControlUnit
		generic (
			WSIZE: natural := 32
		);
		port (
		);
	end component;

	begin
	i1: ControlUnit
	port map (
	);

	-- unit tests
	init: process
	begin

	end process init;
end breg_arch;
