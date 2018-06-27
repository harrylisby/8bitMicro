library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY RAM IS
	PORT(	clock, WE: in std_logic;
			addr: in std_logic_vector(6 downto 0);
			datain: in std_logic_vector(7 downto 0);
			dataout: out std_logic_vector(7 downto 0)
			);
END ENTITY RAM;

ARCHITECTURE arch_RAM OF RAM IS
	
	TYPE ram_type IS ARRAY (0 to (2**addr'length)-1) OF std_logic_vector(datain'range);
	SIGNAL ram_s: ram_type;
	SIGNAL read_address: std_logic_vector(addr'range);

BEGIN
	PROCESS(clock) IS
	BEGIN
		IF clock'event AND clock = '1' THEN
			IF WE = '1' THEN
				ram_s(to_integer(unsigned(addr))) <= datain;
			END IF;
		read_address <= addr;
		END IF;
  END PROCESS;
dataout <= ram_s(to_integer(unsigned(read_address)));
END ARCHITECTURE arch_RAM;