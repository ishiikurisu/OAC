library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture breg_arch of testbench is
	-- signals
	signal instruction: std_logic_vector(31 downto 0);
	signal reg_dest: std_logic;
	signal jump: std_logic;
	signal branch: std_logic;
	signal mem_read: std_logic;
	signal mem_to_reg: std_logic;
	signal mem_write: std_logic;
	signal reg_write: std_logic;
	signal alu_src: std_logic;
	signal alu_op: std_logic_vector(3 downto 0);

	-- components
	component ControlUnit
		generic (
			WSIZE: natural := 32
		);
		port (
			instruction: in std_logic_vector(31 downto 0);
			reg_dest,
			jump,
			branch,
			mem_read,
			mem_to_reg,
			mem_write,
			alu_src,
			reg_write: out std_logic;
			alu_op: out std_logic_vector(3 downto 0)
		);
	end component;

	begin
	i1: ControlUnit
	port map (
		instruction => instruction,
		reg_dest => reg_dest,
		jump => jump,
		branch => branch,
		mem_read => mem_read,
		mem_to_reg => mem_to_reg,
		mem_write => mem_write,
		alu_src => alu_src,
		reg_write => reg_write,
		alu_op => alu_op
	);

	-- unit tests
	init: process
	begin
		-- TODO Come up with some good tests
		instruction <= X"00000000";
		wait for 40 ns;
		assert(jump = '0');
		assert(branch = '0');
		assert(mem_read = '0');
	end process init;
end breg_arch;
