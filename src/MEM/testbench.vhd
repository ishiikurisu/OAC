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
	component InstructionMemory
		generic (
			WSIZE: natural := 32
		);
		port (
			address: in std_logic_vector(7 downto 0);
			outlet: out std_logic_vector(WSIZE-1 downto 0);
			wPC, m1, clk: in std_logic
		);
	end component;

	begin
		i1: InstructionMemory
		port map (
			clk => clock,
			address => address,
			outlet => data,
			m1 => pc_input,
			wPC => write_pc
		);

		init: process
		begin
			-- Testing clock just to compile this thing.
			clock <= '1';
			wait for 5 ns;
			assert(data = X"FFFFFFFF");
			clock <= '0';
			wait for 5 ns;
			assert(data = X"00000000");
			-- DO NOT FORGET TO DELETE THE ABOVE CODE
			
			
			-- TODO Come up with tests
		end process init;
end breg_arch;
