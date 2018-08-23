library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ROM IS
  PORT( addr : in std_logic_vector(3 downto 0);
        data : out std_logic_vector(13 downto 0) );
END ENTITY ROM;

ARCHITECTURE ROM_ARCH OF ROM IS
BEGIN
	PROCESS(addr)
	BEGIN
		CASE(addr) IS		
			WHEN "0000" => data <= "11100100000000"; -- 0000
			WHEN "0001" => data <= "00100010010100"; -- 0001
			WHEN "0010" => data <= "11100101100100"; -- 0010
			WHEN "0011" => data <= "00100010010101"; -- 0011
			WHEN "0100" => data <= "01011000010100"; -- 0100
			WHEN "0101" => data <= "01010110010100"; -- 0101
			WHEN "0110" => data <= "01010100010100"; -- 0110
			WHEN "0111" => data <= "01001100010101"; -- 0111
			WHEN "1000" => data <= "00001110010101"; -- 1000
			WHEN "1001" => data <= "11100110000000"; -- 1001
			WHEN "1010" => data <= "00010110010101"; -- 1010
			WHEN "1011" => data <= "01101110010101"; -- 1011
			WHEN "1100" => data <= "11100100110010"; -- 1100
			WHEN "1101" => data <= "00100010010100"; -- 1101
			WHEN "1110" => data <= "11100111100000"; -- 1110
			WHEN "1111" => data <= "11110000000001"; -- 1111
			
		
--			WHEN "0000" => data <= "11100100010100";
--			WHEN "0001" => data <= "00100010000101";
--			WHEN "0010" => data <= "11100100001111";
--			WHEN "0011" => data <= "00100010000110";
--			WHEN "0100" => data <= "11110000001010";
--			WHEN "0101" => data <= "00100010000111";
--			WHEN "0110" => data <= "11110000010100";
--			WHEN "0111" => data <= "00100010001000";
--			WHEN "1000" => data <= "00100100000111";
--			WHEN "1001" => data <= "00110000000111";
--			WHEN "1010" => data <= "00100100000111";
--			WHEN "1011" => data <= "00110010000110";
--			WHEN "1100" => data <= "00100100000110";
--			WHEN "1101" => data <= "11000000000000";
--			WHEN "1110" => data <= "11000000000000";
--			WHEN "1111" => data <= "11000000000000";
		END CASE;
	END PROCESS;
END ARCHITECTURE;



  
	
