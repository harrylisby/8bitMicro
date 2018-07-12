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
			WHEN "0000" => data <= "11100100010100";
			WHEN "0001" => data <= "00100010000101";
			WHEN "0010" => data <= "11100100001111";
			WHEN "0011" => data <= "00100000000110";
			WHEN "0100" => data <= "11110000001010";
			WHEN "0101" => data <= "00100000000111";
			WHEN "0110" => data <= "11110000010100";
			WHEN "0111" => data <= "00100000001000";
			WHEN "1000" => data <= "00100100000111";
			WHEN "1001" => data <= "00110000000111";
			WHEN "1010" => data <= "00100100000111";
			WHEN "1011" => data <= "00110010000110";
			WHEN "1100" => data <= "00100100000110";
			WHEN "1101" => data <= "00100110001000";
			WHEN "1110" => data <= "11000000000000";
			WHEN "1111" => data <= "11000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE;



  
	
