library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY RAM IS
	PORT(
			clock: in std_logic;
			WR : in std_logic;
			ADDR : in std_logic_vector(6 downto 0);
			DATA_IN : in std_logic_vector(7 downto 0);
			DATA_OUT : out std_logic_vector(7 downto 0)
	);
END ENTITY RAM;

ARCHITECTURE aRAM OF RAM IS 
TYPE ramArray IS ARRAY (0 TO 127) OF std_logic_vector (7 DOWNTO 0);
SIGNAL microRAM : ramArray; --Esta señal es un array que representa al type que creado
--SIGNAL read_address: std_logic_vector(addr'range);
BEGIN
	PROCESS(clock) BEGIN
		IF (rising_edge(clock)) THEN
			IF WR = '0' THEN
				microRAM(to_integer(unsigned(ADDR)))<=DATA_IN;
			ELSE
				DATA_OUT<=microRAM(to_integer(unsigned(ADDR)));
			END IF;
			--read_address <= ADDR;
		END IF;
	END PROCESS;
	
	
END ARCHITECTURE;
