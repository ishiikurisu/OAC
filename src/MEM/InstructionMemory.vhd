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
		wPC, m1, clk: in std_logic
	);
end InstructionMemory;

architecture rtl of InstructionMemory is
	signal dummy_inlet: std_logic_vector(WSIZE-1 downto 0);

	component RAM
		port (
			address: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			clock: IN STD_LOGIC  := '1';
			data: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren: IN STD_LOGIC ;
			q: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	end component;
	begin
		-- connection to FPGA memory
		ram_memory: RAM
		port map(
			address => address,
			clock => clk,
			q => outlet,
			wren => wPC,
			data => dummy_inlet
		);
		
		-- loop
		working: process(address, wPC, m1, clk)
		begin
		end process;
end rtl;
