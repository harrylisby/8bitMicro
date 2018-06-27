library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--ali
ENTITY ALU_CTRL IS
	PORT (clk: in std_logic;
			valueOutput: out std_logic_vector(7 downto 0);
			carryOut, Zout: out std_logic;
			currentState: out std_logic_vector(1 downto 0);
			rst: in std_logic := '0'
			);
END ENTITY;

ARCHITECTURE archALU_CTRL OF ALU_CTRL IS
TYPE tipo_estado IS (progMemRead, moveToRegisters, resultToW);
SIGNAL estado: tipo_estado := progMemRead;
SIGNAL p_estado: tipo_estado;

--ALU
SIGNAL regA, regB, regResult: std_logic_vector(7 downto 0);
SIGNAL regOp: std_logic_vector(3 downto 0);
SIGNAL regCo, regZo, carryIn: std_logic;
	
BEGIN
	XALU: ENTITY work.ALU_8 PORT MAP(A  => regA,
												B  => regB,
												Op => regOp,
												Ci => carryIn,
												Co => regCo,
												Zo => regZo,
												R  => regResult
												);

END ARCHITECTURE;


