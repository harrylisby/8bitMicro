library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ALU IS
	PORT(	A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		Ci: in std_logic;
		R: out std_logic_vector(7 downto 0);
		Zo: out std_logic;
		Co: out	std_logic;
		Op: in std_logic_vector(3 downto 0);
		HEX: out std_logic_vector(27 downto 0)
	);
END ENTITY;
	
ARCHITECTURE A_ALU OF ALU IS
							
SIGNAL preR: std_logic_vector(8 downto 0);
SIGNAL preCo: std_logic;

BEGIN
PROCESS(A,B,Ci,Op,preR,preCo)
BEGIN
	CASE Op IS
		WHEN "0000" =>
			preR <= "000000000";
			HEX <= "1000000100000010000001000000";
		WHEN "0001" =>
			preR <= "000000000";
			HEX <= "1000000100000010000001000000";
		WHEN "0010" =>
		--RLA <=					
			preR(0) <= Ci;
			preR(1) <= A(0);
			preR(2) <= A(1);
			preR(3) <= A(2);
			preR(4) <= A(3);
			preR(5) <= A(4);
			preR(6) <= A(5);
			preR(7) <= A(6);
			preCo   <= A(7);
			HEX <= "0101111100011111111110001000";
		WHEN "0011" =>
		--RRA =>
			preCo   <= A(0);
			preR(0) <= A(1);
			preR(1) <= A(2);
			preR(2) <= A(3);
			preR(3) <= A(4);
			preR(4) <= A(5);
			preR(5) <= A(6);
			preR(6) <= A(7);
			preR(7) <= Ci;
			HEX <= "0101111010111111111110001000";
		WHEN "0100" =>
		--A AND B
			preR(7 downto 0) <= A AND B;
			HEX <= "0001000111111101010110000011";
			
		WHEN "0101" =>
		--A OR B
			preR(7 downto 0) <= A OR B;
			HEX <= "0001000010001101011110000011";
			
		WHEN "0110" =>
		--A XOR B
			preR(7 downto 0) <= A XOR B;
			HEX <= "0001000000100101000110000011";
		WHEN "0111" =>
		--NOT A
			preR(7 downto 0) <= NOT A;
			HEX <= "0101011010001100001110001000";
			
		WHEN "1000" =>
		--A
			preR(7 downto 0) <= A;
			HEX <= "1111111111111111111110001000";
			
		WHEN "1001" =>
		--B
			preR(7 downto 0) <= B;
			HEX <= "1111111111111111111110000011";
		WHEN "1010" =>
		--A+1
			preR <= A+"000000001";
			preCo<= preR(8);
			HEX <= "1111111000100000011111111001";
			
		WHEN "1011" =>
		--A-1
			preR <= A-"000000001";
			preCo<= preR(8);
			HEX <= "1111111000100001111111111001";
			
		WHEN "1100" =>
		--A+B+Ci
			preR <= A + B + "000000000";
			preCo<= preR(8);
			HEX <= "1111111000100000011110000011";
			
		WHEN "1101" =>
		--A-B-Ci
			preR <= A - B + "000000000";
			preCo<= preR(8);
			HEX <= "1111111000100001111110000011";
			
		WHEN "1110" =>
			preR <= "011111111";
			HEX <= "1111001111100111110011111001";
		WHEN "1111" =>
			preR <= "011111111";
			HEX <= "1111001111100111110011111001";
		END CASE;
		
		IF preR(7 downto 0) = "00000000" THEN Zo <= '1';
		ELSE	Zo <= '0';
		END IF;
				
		R <= preR(7 downto 0);
		Co<= preCo;
END PROCESS;
END ARCHITECTURE;
			
