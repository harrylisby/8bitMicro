library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ROM IS
	PORT(	address : in std_logic_vector(3 downto 0);
			data : out std_logic_vector(13 downto 0)
			);
END ENTITY ROM;

ARCHITECTURE arch_ROM OF ROM IS
BEGIN
	PROCESS(address)
	BEGIN
		CASE address IS
			WHEN "0000" => data <= "00100100001111";
			WHEN "0001" => data <= "00110000001100";
			WHEN "0010" => data <= "00010111110000";
			WHEN "0011" => data <= "00011000000011";
			WHEN "0100" => data <= "00010011111111";
			WHEN "0101" => data <= "00110001100100";
			WHEN "0110" => data <= "00110111001000";
			WHEN "0111" => data <= "00110001100100";
			WHEN "1000" => data <= "00010100001100";
			WHEN "1001" => data <= "00010000000000";
			WHEN "1010" => data <= "00100100010111";
			WHEN "1011" => data <= "00000000000000";
			WHEN "1100" => data <= "00000000000000";
			WHEN "1101" => data <= "00000000000000";
			WHEN "1110" => data <= "00000000000000";
			WHEN "1111" => data <= "00000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE arch_ROM;



  
	