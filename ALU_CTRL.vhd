library ieee;
use IEEE.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY ALU_CTRL IS
	PORT(
		clk: in	std_logic; --reloj maestro del sistema
		valueOutput: out std_logic_vector(7 downto 0):="00000000"; --resultado de operación
		Zout: out std_logic:='0'; --zout
		carryOut: out std_logic:='0'; --carry de salida 1 bit
		cState:	out std_logic_vector(1 downto 0):="00";
		HEXOUT:	out std_logic_vector(27 downto 0):="0000000000000000000000000000"; --leds salidas hex
		RST: in	std_logic:='0'
	);
END ENTITY;

ARCHITECTURE archALU_CTRL OF ALU_CTRL IS
--Estados
	TYPE status IS (progmemRead, moveToRegisters, resultToW);
--Signals para ALU
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
--Signals para ROM
	SIGNAL W: std_logic_vector(7 downto 0);
	SIGNAL regW: std_logic_vector(7 downto 0):="00000000";
	SIGNAL PC: std_logic_vector(3 downto 0);
	SIGNAL IR: std_logic_vector(13 downto 0):="00000000000000";
	SIGNAL S: std_logic_vector(3 downto 0):="0000";
	SIGNAL dB: std_logic_vector(7 downto 0):="00000000";
	SIGNAL dataReg: std_logic_vector(13 downto 0):="00000000000000";
	SIGNAL addrReg: std_logic_vector(3 downto 0):="0000";
--signals para RAM
	SIGNAL RWRR: std_logic; --ram write/read register
	SIGNAL RADDR: std_logic_vector(6 downto 0); --ram address register;
	SIGNAL RDIR: std_logic_vector(7 downto 0); --ram data in register;
	SIGNAL RDOR: std_logic_vector(7 downto 0); --ram data out register;
	
BEGIN

	XALU: ENTITY work.ALU PORT MAP(
					A => regW,
					B  => regB,
					Ci => carryInput,
					R => rValue,
					Zo => ZoReg,
					Co => CoReg,
					Op => opIn,
					HEX => hexReg
	);
											
	XROM: ENTITY work.ROM PORT MAP(
					addr => addrReg,
					data => dataReg
	);
						
	XRAM: ENTITY work.RAM PORT MAP(
					clock => clk,
					WR => RWRR,
					ADDR => RADDR,
					DATA_IN => RDIR,
					DATA_OUT => RDOR
	);

	PROCESS(state,carryInput,RST,PC,IR,dataReg,carryInput) --Revisar cuales deben estar realmente en sensibilidad
	BEGIN
		IF(rst='0') THEN
				PC<="0000";
				W<="00000000";
		ELSE
			CASE state IS	
				WHEN progmemRead =>
					addrReg <= PC;		-- introduce a PC [addr:ROM] el valor del contador addrReg
					IR <= dataReg;		-- lee de dataReg [data:ROM] la info y la introduce a IR
					CarryInput <= CoBuffer;	--escribe valor del buffer Co a Ci
					RWRR <= '1';
					
					nState <= moveToRegisters;

				WHEN moveToRegisters =>
					S <= IR(11 downto 8);		--separa instrucción y guarda en S
					--regB <= IR(7 downto 0);		--separa byte e introduce el byte en regB [B:ALU]

					IF IR(13 downto 12)="11" THEN
						regB <= IR(7 downto 0);	--escribe en regB el dato del bit 7 a 0 de IR
						
					ELSIF IR(13 downto 12)="00" THEN
						regB <= RDOR;	--escribe en regB la salida de la RAM
						
					ELSE
						regB <= "00000000";	--en otros casos escribe cero en regB
					END IF;
					
					regW <= W;						--mueve el valor de W a regW [A:ALU]
					opIn <= S;						--introduce a opIn [Op:ALU] la instrucción
					CoBuffer <= CoReg;	--escribe la salida Co a buffer Co 
					
					--MOVER CoBuffer a resultToW (?)
					RWRR <= '1';

					nState <= resultToW;

				WHEN resultToW =>
					--W <= rValue;	--mueve resultado, rValue [R:ALU] a W
					
					IF IR(13 downto 12)="11" THEN
						W <= rValue;
						RWRR <= '1';
					ELSIF IR(13 downto 12)="00" THEN
						IF IR(7)='0' THEN
							W <= rValue;
							RWRR <= '1';
						ELSE
							RWRR <= '0';
						END IF;
					ELSE
						RWRR <= '1';
					END IF;
					
					PC <= addrReg + '1';	--suma +1 a addrReg
					--agregar Z
					nState <= progmemRead;

			END CASE;
		END IF;
	END PROCESS;
	
	Zout <= ZoReg;
	CarryOut <= CoBuffer;
	valueOutput <= W;
	
	PROCESS(nState,clk,RST)
	BEGIN
		IF (RST = '0') THEN
			state <= progmemRead;
		ELSIF (clk'event AND clk = '0') THEN 
			state <= nState;
		END IF;
	END PROCESS;
END ARCHITECTURE;


