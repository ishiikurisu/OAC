library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture ula_arch of testbench is
	-- signals
	signal a: std_logic_vector(31 downto 0);
	signal b: std_logic_vector(31 downto 0);
	signal result: std_logic_vector(31 downto 0);
	signal zero: std_logic;
	signal overflow: std_logic;
	signal opcode: std_logic_vector(4 downto 0);
	
	component ULA
		port (
			opcode: in std_logic_vector(4 downto 0);
			A, B: in std_logic_vector(31 downto 0);
			Z: out std_logic_vector(31 downto 0);
			zero, ovfl: out std_logic
		);
	end component;
	
	begin
		i1: ULA
		port map (
			A => a,
			B => b,
			Z => result,
			zero => zero,
			ovfl => overflow,
			opcode => opcode
		);
		
		init: process
		begin
			a <= X"00000004"; b <= X"00000005";
			wait for 4 ps;
			assert(result = std_logic_vector(to_signed(9, 32)));
			
			a <= X"00000032"; b <= X"00000005";
			wait for 4 ps;
			a <= X"00000004"; b <= X"000000FF";
			wait for 4 ps;
		end process init;
end ula_arch;