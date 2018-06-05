library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture breg_arch of testbench is
	-- signals
	signal clock: std_logic;
	signal write_enable: std_logic;
	signal reset: std_logic;
	signal out_reg_1: std_logic_vector(4 downto 0);
	signal out_reg_2: std_logic_vector(4 downto 0);
	signal out_data_1: std_logic_vector(31 downto 0);
	signal out_data_2: std_logic_vector(31 downto 0);
	signal in_reg: std_logic_vector(4 downto 0);
	signal in_data: std_logic_vector(31 downto 0);

	-- components
	component BREG
		generic (
			WSIZE: natural := 32
		);
		port (
			clk, wren, rst: in std_logic;
			radd1, radd2, wadd: in std_logic_vector(4 downto 0);
			wdata: in std_logic_vector(WSIZE-1 downto 0);
			r1, r2: out std_logic_vector(WSIZE-1 downto 0)
		);
	end component;

	begin
		i1: BREG
		port map (
			clk => clock,
			wren => write_enable,
			rst => reset,
			radd1 => out_reg_1,
			radd2 => out_reg_2,
			r1 => out_data_1,
			r2 => out_data_2,
			wadd => in_reg,
			wdata => in_data
		);

		init: process
		begin
			-- Testing register 0
			write_enable <= '1';
			in_reg <= "00000";
			in_data <= X"12345678";
			clock <= '1';
			wait for 5 ns;
			write_enable <= '0';
			clock <= '0';
			wait for 5 ns;
			out_reg_1 <= "00000";
			clock <= '1';
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
			assert(out_data_1 = std_logic_vector(to_signed(0, 32)));
			
			-- Testing reset
			clock <= '1';
			write_enable <= '1';
			in_reg <= "11111";
			in_data <= X"0000000A";
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
			clock <= '1';
			write_enable <= '0';
			out_reg_2 <= "11111";
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
			assert(out_data_2 = std_logic_vector(to_signed(10, 32)));
			
			clock <= '1';
			reset <= '1';
			wait for 5 ns;
			reset <= '0';
			clock <= '0';
			wait for 5 ns;
			clock <= '1';
			out_reg_1 <= "11111";
			wait for 5 ns;
			clock <= '0';
			wait for 5 ns;
			assert(out_data_1 = std_logic_vector(to_signed(0, 32)));
			
			-- TODO Test remaining registers
		end process init;
end breg_arch;
