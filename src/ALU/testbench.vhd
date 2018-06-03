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
	signal opcode: std_logic_vector(3 downto 0);

	component ULA
		generic (
			WSIZE: natural := 32
		);
		port (
			opcode: in std_logic_vector(3 downto 0);
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
			-- Testing and / or
			opcode <= "0000";
			a <= X"AAAAAAAA"; b <= X"55555555";
			wait for 5 ns;
			assert(result = X"00000000");
			assert(zero = '1');

			opcode <= "0001";
			wait for 5 ns;
			assert(result = X"FFFFFFFF");
			assert(zero = '0');

			-- Testing add
			opcode <= "0010";
			a <= X"00000004"; b <= X"00000005";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(9, 32)));
			assert(zero = '0');
			assert(overflow = '0');

			a <= X"00000000"; b <= X"00000000";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(0, 32)));
			assert(zero = '1');
			assert(overflow = '0');

			a <= X"00000001"; b <= X"FFFFFFFF";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(0, 32)));
			assert(zero = '1');
			assert(overflow = '0');

			a <= X"7FFFFFFF"; b <= X"00000010";
			wait for 5 ns;
			assert(overflow = '1');

			-- Testing addu
			opcode <= "0011";
			a <= X"00000004"; b <= X"00000005";
			wait for 5 ns;
			assert(result = std_logic_vector(to_unsigned(9, 32)));
			assert(zero = '0');

			a <= X"10000000"; b <= X"00000000";
			wait for 5 ns;
			assert(result = X"10000000");

			-- Testing sub
			opcode <= "0100";
			a <= X"0000000A"; b <= X"00000005";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(5, 32)));
			assert(zero = '0');

			a <= X"00000000"; b <= X"00000001";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(-1, 32)));
			assert(zero = '0');

			a <= X"FFFFFFFF"; b <= X"FFFFFFFF";
			wait for 5 ns;
			assert(zero = '1');

			a <= X"80000000"; b <= X"00000010";
			wait for 5 ns;
			assert(overflow = '1');
			assert(zero = '0');

			-- Testing subu
			opcode <= "0101";
			a <= X"0000000A"; b <= X"00000005";
			wait for 5 ns;
			assert(result = X"00000005");

			a <= X"00000000"; b <= X"00000001";
			wait for 5 ns;
			assert(result = X"FFFFFFFF");

			-- Testing nor
			opcode <= "1000";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(-2, 32)));

			-- Testing xor
			opcode <= "1001";
			wait for 5 ns;
			assert(result = std_logic_vector(to_signed(1, 32)));

			-- Testing slt
			a <= X"00000000"; b <= X"FFFFFFFF";
			opcode <= "0110";
			wait for 5 ns;
			assert(result = X"00000000");
			assert(zero = '1');

			-- Testing sltu
			opcode <= "0111";
			wait for 5 ns;
			assert(result = X"00000001");
			assert(zero = '0');

			-- Testing sll
			opcode <= "1010";
			a <= X"0000FF00"; b <= X"00000008";
			wait for 5 ns;
			assert(result = X"00FF0000");

			-- Testing srl
			opcode <= "1011";
			wait for 5 ns;
			assert(result = X"000000FF");

			-- Testing sra
			opcode <= "1100";
			a <= X"F000000F";
			b <= X"00000008";
			wait for 5 ns;
			assert(result = X"FFF00000");

			-- Testing rtr
			opcode <= "1101";
			a <= X"FF00FF00";
			b <= X"00000008";
			wait for 5 ns;
			assert(result = X"00FF00FF");

			-- Testing rtl
			opcode <= "1110";
			a <= X"0000FFFF";
			wait for 5 ns;
			assert(result = X"FF0000FF");

		end process init;
end ula_arch;
