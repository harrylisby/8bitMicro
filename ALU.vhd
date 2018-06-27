library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ALU_8 IS
	PORT (A,B: in std_logic_vector(7 downto 0);
			Op: in std_logic_vector(3 downto 0);
			Ci: in std_logic;
			Co, Zo: out std_logic;
			R: out std_logic_vector(7 downto 0)
			);
END ENTITY ALU_8;

ARCHITECTURE arch_ALU_8 OF ALU_8 IS
SIGNAL preR: std_logic_vector(8 downto 0);
SIGNAL preCo: std_logic;

BEGIN
	PROCESS(A,B,Op,Ci,preR,preCo)
	BEGIN
	preCo <= '0';
		CASE Op IS
			WHEN "0000" =>
					preR <= "000000000";
			WHEN "0001" =>
					preR <= "000000000";
			WHEN "0010" => --RLA
					preR(0) <= Ci;
					preR(1) <= A(0);
					preR(2) <= A(1);
					preR(3) <= A(2);
					preR(4) <= A(3);
					preR(5) <= A(4);
					preR(6) <= A(5);
					preR(7) <= A(6);
					preCo   <= A(7);
			WHEN "0011" => --RRA
					preCo   <= A(0);
					preR(0) <= A(1);
					preR(1) <= A(2);
					preR(2) <= A(3);
					preR(3) <= A(4);
					preR(4) <= A(5);
					preR(5) <= A(6);
					preR(6) <= A(7);
					preR(7) <= Ci;
			WHEN "0100" =>
					preR <= ('0' & (A AND B));
			WHEN "0101" =>
					preR <= ('0' & (A OR B));
			WHEN "0110" =>
					preR <= ('0' & (A XOR B));
			WHEN "0111" =>
					preR <= ('0' & (NOT A));
			WHEN "1000" =>
					preR <= ('0' & A);
			WHEN "1001" =>
					preR <= ('0' & B);
			WHEN "1010" =>
					preR <= A + "000000001";
					preCo <= preR(8);
			WHEN "1011" =>
					preR <= A - "000000001";
					preCo <= preR(8);
			WHEN "1100" =>
					preR <= A + B + Ci + "000000000";
					preCo <= preR(8);
			WHEN "1101" =>
					preR <= A - B - Ci + "000000000";
					preCo <= preR(8);
			WHEN "1110" =>
					preR <= "011111111";
			WHEN "1111" =>
					preR <= "011111111";
		END CASE;
		
		IF preR(7 downto 0) <= "00000000" THEN
			Zo <= '1';
		ELSE
			Zo <= '0';
		END IF;
		
		R <= preR(7 downto 0);
		Co <= preCo;
	END PROCESS;
END ARCHITECTURE arch_ALU_8;