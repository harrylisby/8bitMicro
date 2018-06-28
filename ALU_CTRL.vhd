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
SIGNAL prox_estado: tipo_estado;

--ALU
SIGNAL regB, regResult: std_logic_vector(7 downto 0);
SIGNAL regOp: std_logic_vector(3 downto 0);
SIGNAL regCo, regZo, carryIn: std_logic;

--ROM
SIGNAL W: std_logic_vector(7 downto 0);
SIGNAL regW, regdB: std_logic_vector(7 downto 0) := "00000000";
SIGNAL regS, regAddress: std_logic_vector(3 downto 0) := "0000";
SIGNAL PC: std_logic_vector(3 downto 0);
SIGNAL IR: std_logic_vector(13 downto 0) := "00000000000000";
SIGNAL regData: std_logic_vector(13 downto 0) := "00000000000000";

--RAM
SIGNAL regWE: std_logic;
SIGNAL regAddr: std_logic_vector(6 downto 0);
SIGNAL regdIN, regdOUT: std_logic_vector(7 downto 0);

BEGIN
	XALU: ENTITY work.ALU_8 PORT MAP(A  => regW,
												B  => regB,
												Op => regOp,
												Ci => carryIn,
												Co => regCo,
												Zo => regZo,
												R  => regResult
												);
	
	XROM: ENTITY work.ROM PORT MAP(	address 	=> regAddress,
												data 		=> regData);

	XRAM: ENTITY work.RAM PORT MAP(	clock		=> clk,
												WE			=>	regWE,
												addr		=>	regAddr,
												datain	=>	regdIN,
												dataout	=>	regdOUT
												);
	
	dpe:
	PROCESS(estado, carryIn, rst, PC, IR, regData)
	BEGIN
		IF(rst = '0') THEN
			PC <= "0000";
			W <= "00000000";
		--	regCo <= '0';
		ELSE
			CASE(estado) IS
				WHEN progMemRead =>
				
					regAddress <= PC;
					IR <= regData;
					regWE <= '1'; --para que no escriba
					prox_estado <= moveToRegisters;
					
				WHEN moveToRegisters =>
				
					regS <= IR(11 downto 8);
						IF IR(13 downto 12) = "11" THEN
							regB <= IR(7 downto 0);
						ELSIF IR(13 downto 12) = "00" THEN
							regB <= regdOUT;
						ELSE
							regB <= "00000000";
						END IF;
					regW <= W;
					regOp <= regS;
					PC <= regAddress + '1';
					regWE <= '1';
					prox_estado <= resultToW;
					
				WHEN resultToW =>
					
					IF IR(13 downto 12) = "11" THEN
						W <= regResult;
						regWE <= '1';
					ELSIF IR(13 downto 12) = "00" THEN
						IF IR(7) = '0' THEN
							W <= regResult;
							regWE <= '1';
						ELSE
							regWE <= '0';
						END IF;
					ELSE
						regWE <= '1';
					END IF;
					carryOut <= regCo;
					Zout <= regZo;
					prox_estado <= progMemRead;
					
			END CASE;
		END IF;
	END PROCESS dpe;
	
	ds:
	PROCESS(estado)
	BEGIN
		CASE estado IS
			WHEN progMemRead =>
				currentState <= "01";
			WHEN moveToRegisters =>
				currentState <= "10";
			WHEN resultToW =>
				currentState <= "11";
		END CASE;
	END PROCESS ds;
	
	flipflop:
	PROCESS(clk, prox_estado, rst)
	BEGIN
		IF(rst = '0') THEN
			estado <= progMemRead;
		ELSIF(clk'event AND clk = '0') THEN
			estado <= prox_estado;
		END IF;
	END PROCESS flipflop;
END ARCHITECTURE;


