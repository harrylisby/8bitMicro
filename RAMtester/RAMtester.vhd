library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

ENTITY RAMtester IS
PORT(DATAIN: IN std_logic_vector(7 DOWNTO 0);
     DATAOUT: OUT std_logic_vector(7 DOWNTO 0);
	  ALOUT: OUT std_logic_vector(6 DOWNTO 0);
	  clkout, nweout, dleout: OUT std_logic;
	  clk, nWE, ALE, DLE: IN std_logic);
--   KEY0 KEY3 KEY1 KEY2
 END ENTITY;
 
 
 ARCHITECTURE behavioral OF RAMtester IS
 
 signal MAR: std_logic_vector(6 DOWNTO 0);
 signal MBR: std_logic_vector(7 DOWNTO 0);
 
 BEGIN
	u0: ENTITY work.single_port_ram PORT MAP(data => MBR,
											addr => TO_INTEGER(UNSIGNED(MAR)),
											we => nWE,
											clk => clk,
											q => DATAOUT);
						
			
	address_latch:
	PROCESS(DATAIN, ALE)
	BEGIN
		IF falling_edge(ALE) THEN
			MAR <= DATAIN(6 DOWNTO 0);
		END IF;
	END PROCESS;

	data_latch:
	PROCESS(DATAIN, DLE)
	BEGIN
		IF falling_edge(DLE) THEN
			MBR <= DATAIN;
		END IF;
	END PROCESS;
	
	ALOUT <= MAR;
	nweout <= nWE;
	clkout <= clk;
	dleout <= DLE;
END ARCHITECTURE;
		