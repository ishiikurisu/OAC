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
				 reg_write,
				 unknown_instruction: out std_logic;
		signal alu_op: out std_logic_vector(3 downto 0)
	);
end ControlUnit;

architecture rtl of ControlUnit is
begin
	working: process(instruction)
		variable opcode: std_logic_vector(5 downto 0);
		variable funct: std_logic_vector(5 downto 0);
	begin
		opcode := instruction(31 downto 26);
		funct := instruction(5 downto 0);
		if opcode = "000000" then
			if funct = X"20" then -- add
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0010";
				unknown_instruction <= '0';
			elsif funct = X"21" then -- addu
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0011";
				unknown_instruction <= '0';
			elsif funct = "011000" then -- and
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0000";
				unknown_instruction <= '0';
			elsif funct = "001000" then -- jr
				reg_dest <= '-';
				jump <= '1';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '0';
				alu_op <= "1111";
				unknown_instruction <= '0';
			elsif funct = X"27" then -- nor
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "1000";
				unknown_instruction <= '0';
			elsif funct = X"25" then -- or
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "1000";
				unknown_instruction <= '0';
			elsif funct = X"2A" then -- slt
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0110";
				unknown_instruction <= '0';
			elsif funct = "000000" then -- sll
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "1010";
				unknown_instruction <= '0';
			elsif funct = "000010" then -- srl
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "1011";
				unknown_instruction <= '0';
			elsif funct = "000011" then -- sra
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "1100";
				unknown_instruction <= '0';
			elsif funct = X"22" then -- sub
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0100";
				unknown_instruction <= '0';
			elsif funct = X"23" then -- subu
				reg_dest <= '1';
				jump <= '0';
				branch <= '0';
				mem_read <= '0';
				mem_to_reg <= '0';
				mem_write <= '0';
				alu_src <= '0';
				reg_write <= '1';
				alu_op <= "0101";
				unknown_instruction <= '0';
			else -- unknown funct
				unknown_instruction <= '1';
			end if;
		elsif opcode = "001000" then -- addi
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "0010";
			unknown_instruction <= '0';
		elsif opcode = "001001" then -- addiu
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "0011";
			unknown_instruction <= '0';
		elsif opcode = "001100" then -- andi
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "0000";
			unknown_instruction <= '0';
		elsif (opcode = "000100") or (opcode = "000101") then -- beq, bne
			reg_dest <= '-';
			jump <= '1';
			branch <= '1';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '0';
			reg_write <= '0';
			alu_op <= "1111";
			unknown_instruction <= '0';
		elsif (opcode = "000010") or (opcode = "000011") then -- j, jal
			reg_dest <= '-';
			jump <= '1';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '0';
			reg_write <= '0';
			alu_op <= "1111";
			unknown_instruction <= '0';
		elsif opcode = "001111" then -- lui
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "1111";
			unknown_instruction <= '0';
		elsif opcode = "010111" then -- lw
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '1';
			mem_to_reg <= '1';
			mem_write <= '0';
			alu_src <= '0';
			reg_write <= '0';
			alu_op <= "1111";
			unknown_instruction <= '0';
		elsif opcode = X"D" then -- ori
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "0001";
			unknown_instruction <= '0';
		elsif opcode = X"A" then -- slti
			reg_dest <= '0';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '0';
			alu_src <= '1';
			reg_write <= '1';
			alu_op <= "0110";
			unknown_instruction <= '0';
		elsif opcode = X"2B" then -- sw
			reg_dest <= '-';
			jump <= '0';
			branch <= '0';
			mem_read <= '0';
			mem_to_reg <= '0';
			mem_write <= '1';
			alu_src <= '0';
			reg_write <= '0';
			alu_op <= "1111";
			unknown_instruction <= '0';
		else -- unknown opcode
			unknown_instruction <= '1';
		end if;
	end process;
end rtl;
