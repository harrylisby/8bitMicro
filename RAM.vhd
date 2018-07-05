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

CONSTANT addrWidth : integer := 7;
CONSTANT dataWidth : integer := 8;

TYPE ramArray IS ARRAY (2**addrWidth-1 downto 0) of std_logic_vector (dataWidth-1 downto 0);
SIGNAL microRAM : ramArray; --Esta señal es un array que representa al type que creado
SIGNAL read_address: std_logic_vector(addr'range);
BEGIN

	PROCESS(clock)
	BEGIN
		IF clock'event AND clock = '1' THEN
			IF WR = '1' THEN
				IF(WR = '0') THEN 
				microRAM(conv_integer(ADDR)) <= DATA_IN;  --Si modo es write [wr=1], data in se escribeen addr
				ELSE
					DATA_OUT <= microRAM(conv_integer(ADDR)); --Si modo es read [wr=0], data out = word en addr
				END IF;
			END IF;
			read_address <= ADDR;
		END IF;
	END PROCESS;
	
	
END ARCHITECTURE;
