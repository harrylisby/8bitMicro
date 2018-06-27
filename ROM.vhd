library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ROM IS
  PORT( 	addr : in std_logic_vector(3 downto 0);
         data : out std_logic_vector(13 downto 0) );
END ENTITY ROM;

ARCHITECTURE ROM_ARCH OF ROM IS
BEGIN
	PROCESS(addr)
	BEGIN
		CASE(addr) IS
			WHEN "0000" => data <= "11100100001111";
			WHEN "0001" => data <= "11110000001100";
			WHEN "0010" => data <= "11010111110000";
			WHEN "0011" => data <= "11011000000011";
			WHEN "0100" => data <= "11010011111111";
			WHEN "0101" => data <= "11110001100100";
			WHEN "0110" => data <= "11110111001000";
			WHEN "0111" => data <= "11110001100100";
			WHEN "1000" => data <= "11010100001100";
			WHEN "1001" => data <= "11010000000000";
			WHEN "1010" => data <= "11100100010111";
			WHEN "1011" => data <= "11000000000000";
			WHEN "1100" => data <= "11000000000000";
			WHEN "1101" => data <= "11000000000000";
			WHEN "1110" => data <= "11000000000000";
			WHEN "1111" => data <= "11000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE;



  
	
