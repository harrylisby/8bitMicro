library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY ALU_CTRL IS
	PORT(
		clk: in	std_logic; --reloj maestro del sistema
		valueOutput: out std_logic_vector(7 downto 0); --resultado de operación
		Zout: out std_logic; --zout
		carryOut: out std_logic; --carry de salida 1 bit
		cState:	out std_logic_vector(1 downto 0);
		HEXOUT:	out std_logic_vector(27 downto 0); --leds salidas hex
		RST: in	std_logic
	);
END ENTITY;

ARCHITECTURE archALU_CTRL OF ALU_CTRL IS
	
	TYPE status IS (progmemRead, moveToRegisters, resultToW);
	
	SIGNAL state:status:=progmemRead;
	SIGNAL nState:status;
	SIGNAL regA: std_logic_vector(7 downto 0);
	SIGNAL regB: std_logic_vector(7 downto 0);
	SIGNAL rValue: std_logic_vector(7 downto 0);
	SIGNAL ZoReg: std_logic;
	SIGNAL CoReg: std_logic;
	SIGNAL CoBuffer: std_logic:='0';
	SIGNAL opIn: std_logic_vector(3 downto 0);
	SIGNAL hexReg: std_logic_vector(27 downto 0);
	SIGNAL CarryInput: std_logic;
	
	SIGNAL W: std_logic_vector(7 downto 0);
	SIGNAL regW: std_logic_vector(7 downto 0):="00000000";
	SIGNAL PC: std_logic_vector(3 downto 0);
	SIGNAL IR: std_logic_vector(11 downto 0):="000000000000";
	SIGNAL S: std_logic_vector(3 downto 0):="0000";
	SIGNAL dB: std_logic_vector(7 downto 0):="00000000";
	SIGNAL dataReg: std_logic_vector(11 downto 0):="000000000000";
	SIGNAL addrReg: std_logic_vector(3 downto 0):="0000";
	
BEGIN

	XALU: ENTITY work.ALU PORT MAP(	A => regW,
					B  => regB,
					Ci => carryInput,
					R => rValue,
					Zo => ZoReg,
					Co => CoReg,
					Op => opIn,
					HEX => hexReg
				      );
											
	XROM: ENTITY work.ROM PORT MAP(	addr => addrReg,
					data => dataReg
				      );

	PROCESS(state,carryInput,RST,PC)
	BEGIN
		IF(rst='0') THEN
				PC<="0000";
				W<="00000000";
		ELSE
			CASE state IS	
				WHEN progmemRead =>
					addrReg <= PC;		-- introduce a PC [addr:ROM] el valor del contador addrReg
					IR <= dataReg;		-- lee de dataReg [data:ROM] la info y la introduce a IR
					nState <= moveToRegisters;
					CarryInput <= CoBuffer;

				WHEN moveToRegisters =>
					S <= IR(11 downto 8);		--separa instrucción y guarda en S
					regB <= IR(7 downto 0);		--separa byte e introduce el byte en regB [B:ALU]
					regW <= W;						--mueve el valor de W a regW [A:ALU]
					opIn <= S;						--introduce a opIn [Op:ALU] la instrucción
					nState <= resultToW;
					CoBuffer <= CoReg;

				WHEN resultToW =>
					W <= rValue;					--mueve resultado, rValue [R:ALU] a W
					nState <= progmemRead;
					PC <= addrReg + '1';			--suma +1 a addrReg
			END CASE;
		END IF;
	END PROCESS;
	
	Zout <= ZoReg;
	CarryOut <= CoBuffer;
	valueOutput <= W;
	
	PROCESS(rValue,state,ZoReg,CoReg,hexReg)
	BEGIN
		CASE state IS
			WHEN progmemRead =>
				HEXOUT<="1000001000100010001111111001";
				cState<="01";
			WHEN moveToRegisters =>
				HEXOUT<="1000001000100010001110100100";
				cState<="10";
			WHEN resultToW =>
				HEXOUT<="0101111000011000100101111111";
				cState<="11";
		END CASE;
	END PROCESS;
	
--	PROCESS(RST)
--	BEGIN
--		IF (RST = '0') THEN
--			W <= "00000000";
--			PC <= "0000";
--			state <= progmemRead;
--		END IF;
--	END PROCESS;
	
	
	PROCESS(nState,clk,RST)
	BEGIN
		IF (RST = '0') THEN
			state <= progmemRead;
		ELSIF (clk'event AND clk = '0') THEN 
			state <= nState;
		END IF;
	END PROCESS;
END ARCHITECTURE;


