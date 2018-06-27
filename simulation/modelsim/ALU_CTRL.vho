-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "06/27/2018 17:42:27"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ALU_CTRL IS
    PORT (
	clk : IN std_logic;
	valueOutput : OUT std_logic_vector(7 DOWNTO 0);
	carryOut : OUT std_logic;
	Zout : OUT std_logic;
	currentState : OUT std_logic_vector(1 DOWNTO 0);
	rst : IN std_logic
	);
END ALU_CTRL;

-- Design Ports Information
-- valueOutput[0]	=>  Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[1]	=>  Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[2]	=>  Location: PIN_U19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[3]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[4]	=>  Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[5]	=>  Location: PIN_V19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[6]	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[7]	=>  Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- carryOut	=>  Location: PIN_R18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Zout	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- currentState[0]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- currentState[1]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- rst	=>  Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ALU_CTRL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_valueOutput : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_carryOut : std_logic;
SIGNAL ww_Zout : std_logic;
SIGNAL ww_currentState : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_rst : std_logic;
SIGNAL \estado.moveToRegisters~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \carryIn~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \regW[6]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \estado.resultToW~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Zout~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \XALU|Add4~2_combout\ : std_logic;
SIGNAL \XALU|Add0~6_combout\ : std_logic;
SIGNAL \XALU|Add0~10_combout\ : std_logic;
SIGNAL \XALU|Add2~14_combout\ : std_logic;
SIGNAL \XALU|Add1~12_combout\ : std_logic;
SIGNAL \XALU|Add4~15\ : std_logic;
SIGNAL \XALU|Add0~15\ : std_logic;
SIGNAL \XALU|Add1~15\ : std_logic;
SIGNAL \XALU|Add4~16_combout\ : std_logic;
SIGNAL \XALU|Add0~16_combout\ : std_logic;
SIGNAL \XALU|Add1~16_combout\ : std_logic;
SIGNAL \XALU|Mux7~3_combout\ : std_logic;
SIGNAL \XALU|LessThan0~1_combout\ : std_logic;
SIGNAL \XALU|Mux2~3_combout\ : std_logic;
SIGNAL \XALU|Mux10~0_combout\ : std_logic;
SIGNAL \XALU|Mux10~1_combout\ : std_logic;
SIGNAL \XALU|Mux10~2_combout\ : std_logic;
SIGNAL \XROM|Mux2~0_combout\ : std_logic;
SIGNAL \XROM|Mux0~0_combout\ : std_logic;
SIGNAL \XROM|Mux1~0_combout\ : std_logic;
SIGNAL \XALU|Mux1~0_combout\ : std_logic;
SIGNAL \XALU|Mux1~1_combout\ : std_logic;
SIGNAL \CoBuffer~combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \estado.moveToRegisters~clkctrl_outclk\ : std_logic;
SIGNAL \rst~combout\ : std_logic;
SIGNAL \prox_estado.progMemRead_594~combout\ : std_logic;
SIGNAL \estado.progMemRead~0_combout\ : std_logic;
SIGNAL \estado.progMemRead~regout\ : std_logic;
SIGNAL \prox_estado.moveToRegisters_588~combout\ : std_logic;
SIGNAL \estado.moveToRegisters~regout\ : std_logic;
SIGNAL \prox_estado.resultToW_582~combout\ : std_logic;
SIGNAL \estado.resultToW~regout\ : std_logic;
SIGNAL \Zout~0_combout\ : std_logic;
SIGNAL \Zout~0clkctrl_outclk\ : std_logic;
SIGNAL \regW[6]~0_combout\ : std_logic;
SIGNAL \regW[6]~0clkctrl_outclk\ : std_logic;
SIGNAL \XALU|Mux8~1_combout\ : std_logic;
SIGNAL \XALU|Mux2~1_combout\ : std_logic;
SIGNAL \carryIn~0_combout\ : std_logic;
SIGNAL \carryIn~0clkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \XROM|Mux6~0_combout\ : std_logic;
SIGNAL \XROM|Mux7~0_combout\ : std_logic;
SIGNAL \estado.resultToW~clkctrl_outclk\ : std_logic;
SIGNAL \XALU|Mux2~2_combout\ : std_logic;
SIGNAL \XALU|Mux0~0_combout\ : std_logic;
SIGNAL \XALU|Mux4~0_combout\ : std_logic;
SIGNAL \XROM|Mux3~0_combout\ : std_logic;
SIGNAL \XALU|Mux2~0_combout\ : std_logic;
SIGNAL \XALU|Mux4~3_combout\ : std_logic;
SIGNAL \XROM|Mux8~0_combout\ : std_logic;
SIGNAL \XROM|Mux9~0_combout\ : std_logic;
SIGNAL \XALU|Mux8~0_combout\ : std_logic;
SIGNAL \carryIn~combout\ : std_logic;
SIGNAL \XALU|Add4~1_cout\ : std_logic;
SIGNAL \XALU|Add4~3\ : std_logic;
SIGNAL \XALU|Add4~4_combout\ : std_logic;
SIGNAL \XROM|Mux10~0_combout\ : std_logic;
SIGNAL \XALU|Mux8~2_combout\ : std_logic;
SIGNAL \XALU|Add0~1\ : std_logic;
SIGNAL \XALU|Add0~2_combout\ : std_logic;
SIGNAL \XALU|Add1~1\ : std_logic;
SIGNAL \XALU|Add1~2_combout\ : std_logic;
SIGNAL \XALU|Mux8~3_combout\ : std_logic;
SIGNAL \XALU|Add2~1_cout\ : std_logic;
SIGNAL \XALU|Add2~3\ : std_logic;
SIGNAL \XALU|Add2~4_combout\ : std_logic;
SIGNAL \XALU|Mux8~4_combout\ : std_logic;
SIGNAL \XALU|Mux8~5_combout\ : std_logic;
SIGNAL \XALU|Mux8~6_combout\ : std_logic;
SIGNAL \XALU|Mux8~7_combout\ : std_logic;
SIGNAL \XALU|Add2~5\ : std_logic;
SIGNAL \XALU|Add2~7\ : std_logic;
SIGNAL \XALU|Add2~9\ : std_logic;
SIGNAL \XALU|Add2~11\ : std_logic;
SIGNAL \XALU|Add2~12_combout\ : std_logic;
SIGNAL \XALU|Mux4~4_combout\ : std_logic;
SIGNAL \XALU|Add4~12_combout\ : std_logic;
SIGNAL \XALU|Mux7~0_combout\ : std_logic;
SIGNAL \XALU|Add1~3\ : std_logic;
SIGNAL \XALU|Add1~4_combout\ : std_logic;
SIGNAL \XALU|Mux7~1_combout\ : std_logic;
SIGNAL \XALU|Add0~3\ : std_logic;
SIGNAL \XALU|Add0~4_combout\ : std_logic;
SIGNAL \XALU|Mux7~2_combout\ : std_logic;
SIGNAL \XALU|Mux7~4_combout\ : std_logic;
SIGNAL \XALU|Add2~6_combout\ : std_logic;
SIGNAL \XALU|Add4~5\ : std_logic;
SIGNAL \XALU|Add4~6_combout\ : std_logic;
SIGNAL \XALU|Mux7~5_combout\ : std_logic;
SIGNAL \XALU|Mux7~6_combout\ : std_logic;
SIGNAL \XALU|Add1~5\ : std_logic;
SIGNAL \XALU|Add1~7\ : std_logic;
SIGNAL \XALU|Add1~9\ : std_logic;
SIGNAL \XALU|Add1~10_combout\ : std_logic;
SIGNAL \XALU|Mux4~1_combout\ : std_logic;
SIGNAL \XALU|Mux4~2_combout\ : std_logic;
SIGNAL \XALU|Mux4~5_combout\ : std_logic;
SIGNAL \XALU|Mux4~6_combout\ : std_logic;
SIGNAL \XALU|Mux5~0_combout\ : std_logic;
SIGNAL \XALU|Mux5~1_combout\ : std_logic;
SIGNAL \XALU|Mux5~2_combout\ : std_logic;
SIGNAL \XALU|Mux5~3_combout\ : std_logic;
SIGNAL \XALU|Add0~5\ : std_logic;
SIGNAL \XALU|Add0~7\ : std_logic;
SIGNAL \XALU|Add0~8_combout\ : std_logic;
SIGNAL \XALU|Add1~8_combout\ : std_logic;
SIGNAL \XALU|Mux5~4_combout\ : std_logic;
SIGNAL \XALU|Add2~10_combout\ : std_logic;
SIGNAL \XALU|Add4~10_combout\ : std_logic;
SIGNAL \XALU|Mux5~5_combout\ : std_logic;
SIGNAL \XALU|Mux5~6_combout\ : std_logic;
SIGNAL \XALU|Mux5~7_combout\ : std_logic;
SIGNAL \XALU|Mux6~0_combout\ : std_logic;
SIGNAL \XALU|Add4~7\ : std_logic;
SIGNAL \XALU|Add4~8_combout\ : std_logic;
SIGNAL \XALU|Add1~6_combout\ : std_logic;
SIGNAL \XALU|Mux6~1_combout\ : std_logic;
SIGNAL \XALU|Mux6~2_combout\ : std_logic;
SIGNAL \XALU|Add2~8_combout\ : std_logic;
SIGNAL \XALU|Mux6~3_combout\ : std_logic;
SIGNAL \XALU|Mux6~4_combout\ : std_logic;
SIGNAL \XALU|Mux6~5_combout\ : std_logic;
SIGNAL \XALU|Mux6~6_combout\ : std_logic;
SIGNAL \XALU|Add4~9\ : std_logic;
SIGNAL \XALU|Add4~11\ : std_logic;
SIGNAL \XALU|Add4~13\ : std_logic;
SIGNAL \XALU|Add4~14_combout\ : std_logic;
SIGNAL \XALU|Mux3~3_combout\ : std_logic;
SIGNAL \XROM|Mux5~0_combout\ : std_logic;
SIGNAL \XALU|Mux3~1_combout\ : std_logic;
SIGNAL \XALU|Add0~9\ : std_logic;
SIGNAL \XALU|Add0~11\ : std_logic;
SIGNAL \XALU|Add0~12_combout\ : std_logic;
SIGNAL \XALU|Mux3~2_combout\ : std_logic;
SIGNAL \XALU|Mux3~4_combout\ : std_logic;
SIGNAL \XALU|Mux3~5_combout\ : std_logic;
SIGNAL \XALU|Add0~13\ : std_logic;
SIGNAL \XALU|Add0~14_combout\ : std_logic;
SIGNAL \XALU|Add1~11\ : std_logic;
SIGNAL \XALU|Add1~13\ : std_logic;
SIGNAL \XALU|Add1~14_combout\ : std_logic;
SIGNAL \XALU|Mux2~4_combout\ : std_logic;
SIGNAL \XALU|Mux2~5_combout\ : std_logic;
SIGNAL \XALU|Add2~13\ : std_logic;
SIGNAL \XALU|Add2~15\ : std_logic;
SIGNAL \XALU|Add2~16_combout\ : std_logic;
SIGNAL \XROM|Mux4~0_combout\ : std_logic;
SIGNAL \XALU|Mux2~6_combout\ : std_logic;
SIGNAL \XALU|Mux2~7_combout\ : std_logic;
SIGNAL \XALU|Mux2~8_combout\ : std_logic;
SIGNAL \XALU|Mux2~9_combout\ : std_logic;
SIGNAL \XALU|Mux3~0_combout\ : std_logic;
SIGNAL \XALU|Mux3~6_combout\ : std_logic;
SIGNAL \XALU|Mux9~0_combout\ : std_logic;
SIGNAL \XALU|Add0~0_combout\ : std_logic;
SIGNAL \XALU|Add1~0_combout\ : std_logic;
SIGNAL \XALU|Mux9~1_combout\ : std_logic;
SIGNAL \XALU|Mux9~2_combout\ : std_logic;
SIGNAL \XALU|Add2~2_combout\ : std_logic;
SIGNAL \XALU|Mux9~3_combout\ : std_logic;
SIGNAL \XALU|Mux9~4_combout\ : std_logic;
SIGNAL \XALU|Mux9~5_combout\ : std_logic;
SIGNAL \XALU|Mux9~6_combout\ : std_logic;
SIGNAL \XALU|LessThan0~0_combout\ : std_logic;
SIGNAL \XALU|LessThan0~2_combout\ : std_logic;
SIGNAL \Zout$latch~combout\ : std_logic;
SIGNAL regW : std_logic_vector(7 DOWNTO 0);
SIGNAL regS : std_logic_vector(3 DOWNTO 0);
SIGNAL regOp : std_logic_vector(3 DOWNTO 0);
SIGNAL regB : std_logic_vector(7 DOWNTO 0);
SIGNAL regAddress : std_logic_vector(3 DOWNTO 0);
SIGNAL W : std_logic_vector(7 DOWNTO 0);
SIGNAL PC : std_logic_vector(3 DOWNTO 0);
SIGNAL IR : std_logic_vector(13 DOWNTO 0);
SIGNAL \XALU|preR\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_estado.moveToRegisters~regout\ : std_logic;
SIGNAL \ALT_INV_clk~combout\ : std_logic;
SIGNAL \ALT_INV_rst~combout\ : std_logic;

BEGIN

ww_clk <= clk;
valueOutput <= ww_valueOutput;
carryOut <= ww_carryOut;
Zout <= ww_Zout;
currentState <= ww_currentState;
ww_rst <= rst;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\estado.moveToRegisters~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \estado.moveToRegisters~regout\);

\carryIn~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \carryIn~0_combout\);

\regW[6]~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \regW[6]~0_combout\);

\estado.resultToW~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \estado.resultToW~regout\);

\Zout~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Zout~0_combout\);
\ALT_INV_estado.moveToRegisters~regout\ <= NOT \estado.moveToRegisters~regout\;
\ALT_INV_clk~combout\ <= NOT \clk~combout\;
\ALT_INV_rst~combout\ <= NOT \rst~combout\;

-- Location: LCCOMB_X45_Y9_N2
\XALU|Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~2_combout\ = (regB(1) & ((regW(0) & (!\XALU|Add4~1_cout\)) # (!regW(0) & ((\XALU|Add4~1_cout\) # (GND))))) # (!regB(1) & ((regW(0) & (\XALU|Add4~1_cout\ & VCC)) # (!regW(0) & (!\XALU|Add4~1_cout\))))
-- \XALU|Add4~3\ = CARRY((regB(1) & ((!\XALU|Add4~1_cout\) # (!regW(0)))) # (!regB(1) & (!regW(0) & !\XALU|Add4~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regW(0),
	datad => VCC,
	cin => \XALU|Add4~1_cout\,
	combout => \XALU|Add4~2_combout\,
	cout => \XALU|Add4~3\);

-- Location: LCCOMB_X47_Y10_N20
\XALU|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~6_combout\ = (regW(3) & (!\XALU|Add0~5\)) # (!regW(3) & ((\XALU|Add0~5\) # (GND)))
-- \XALU|Add0~7\ = CARRY((!\XALU|Add0~5\) # (!regW(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datad => VCC,
	cin => \XALU|Add0~5\,
	combout => \XALU|Add0~6_combout\,
	cout => \XALU|Add0~7\);

-- Location: LCCOMB_X47_Y10_N24
\XALU|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~10_combout\ = (regW(5) & (!\XALU|Add0~9\)) # (!regW(5) & ((\XALU|Add0~9\) # (GND)))
-- \XALU|Add0~11\ = CARRY((!\XALU|Add0~9\) # (!regW(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(5),
	datad => VCC,
	cin => \XALU|Add0~9\,
	combout => \XALU|Add0~10_combout\,
	cout => \XALU|Add0~11\);

-- Location: LCCOMB_X46_Y9_N14
\XALU|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~14_combout\ = (regB(6) & ((regW(6) & (\XALU|Add2~13\ & VCC)) # (!regW(6) & (!\XALU|Add2~13\)))) # (!regB(6) & ((regW(6) & (!\XALU|Add2~13\)) # (!regW(6) & ((\XALU|Add2~13\) # (GND)))))
-- \XALU|Add2~15\ = CARRY((regB(6) & (!regW(6) & !\XALU|Add2~13\)) # (!regB(6) & ((!\XALU|Add2~13\) # (!regW(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(6),
	datab => regW(6),
	datad => VCC,
	cin => \XALU|Add2~13\,
	combout => \XALU|Add2~14_combout\,
	cout => \XALU|Add2~15\);

-- Location: LCCOMB_X48_Y10_N16
\XALU|Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~12_combout\ = (regW(6) & ((GND) # (!\XALU|Add1~11\))) # (!regW(6) & (\XALU|Add1~11\ $ (GND)))
-- \XALU|Add1~13\ = CARRY((regW(6)) # (!\XALU|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(6),
	datad => VCC,
	cin => \XALU|Add1~11\,
	combout => \XALU|Add1~12_combout\,
	cout => \XALU|Add1~13\);

-- Location: LCCOMB_X45_Y9_N14
\XALU|Add4~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~14_combout\ = (regB(6) & ((regW(6) & (!\XALU|Add4~13\)) # (!regW(6) & ((\XALU|Add4~13\) # (GND))))) # (!regB(6) & ((regW(6) & (\XALU|Add4~13\ & VCC)) # (!regW(6) & (!\XALU|Add4~13\))))
-- \XALU|Add4~15\ = CARRY((regB(6) & ((!\XALU|Add4~13\) # (!regW(6)))) # (!regB(6) & (!regW(6) & !\XALU|Add4~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(6),
	datab => regW(6),
	datad => VCC,
	cin => \XALU|Add4~13\,
	combout => \XALU|Add4~14_combout\,
	cout => \XALU|Add4~15\);

-- Location: LCCOMB_X47_Y10_N28
\XALU|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~14_combout\ = (regW(7) & (!\XALU|Add0~13\)) # (!regW(7) & ((\XALU|Add0~13\) # (GND)))
-- \XALU|Add0~15\ = CARRY((!\XALU|Add0~13\) # (!regW(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(7),
	datad => VCC,
	cin => \XALU|Add0~13\,
	combout => \XALU|Add0~14_combout\,
	cout => \XALU|Add0~15\);

-- Location: LCCOMB_X48_Y10_N18
\XALU|Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~14_combout\ = (regW(7) & (\XALU|Add1~13\ & VCC)) # (!regW(7) & (!\XALU|Add1~13\))
-- \XALU|Add1~15\ = CARRY((!regW(7) & !\XALU|Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(7),
	datad => VCC,
	cin => \XALU|Add1~13\,
	combout => \XALU|Add1~14_combout\,
	cout => \XALU|Add1~15\);

-- Location: LCCOMB_X45_Y9_N16
\XALU|Add4~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~16_combout\ = regB(7) $ (\XALU|Add4~15\ $ (regW(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(7),
	datad => regW(7),
	cin => \XALU|Add4~15\,
	combout => \XALU|Add4~16_combout\);

-- Location: LCCOMB_X47_Y10_N30
\XALU|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~16_combout\ = !\XALU|Add0~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \XALU|Add0~15\,
	combout => \XALU|Add0~16_combout\);

-- Location: LCCOMB_X48_Y10_N20
\XALU|Add1~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~16_combout\ = !\XALU|Add1~15\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \XALU|Add1~15\,
	combout => \XALU|Add1~16_combout\);

-- Location: LCCOMB_X45_Y10_N24
\XALU|Mux7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~3_combout\ = (regOp(1) & (regW(2) $ (((regOp(0)) # (regB(2)))))) # (!regOp(1) & ((regW(2) & ((regOp(0)) # (regB(2)))) # (!regW(2) & (regOp(0) & regB(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regW(2),
	datac => regOp(0),
	datad => regB(2),
	combout => \XALU|Mux7~3_combout\);

-- Location: LCCOMB_X47_Y9_N16
\XALU|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~1_combout\ = (\XALU|Mux4~6_combout\) # (\XALU|Mux5~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \XALU|Mux4~6_combout\,
	datad => \XALU|Mux5~7_combout\,
	combout => \XALU|LessThan0~1_combout\);

-- Location: LCCOMB_X46_Y10_N24
\XALU|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~3_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (\carryIn~combout\)) # (!regOp(0) & ((regW(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \carryIn~combout\,
	datab => \XALU|Mux0~0_combout\,
	datac => regW(6),
	datad => regOp(0),
	combout => \XALU|Mux2~3_combout\);

-- Location: LCCOMB_X45_Y10_N26
\XALU|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~0_combout\ = (\XALU|preR\(8) & (regOp(3) & (regOp(1) $ (regOp(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(2),
	datac => \XALU|preR\(8),
	datad => regOp(3),
	combout => \XALU|Mux10~0_combout\);

-- Location: LCCOMB_X44_Y9_N24
\XALU|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~1_combout\ = (regOp(0) & (regW(0))) # (!regOp(0) & ((regW(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(0),
	datac => regW(0),
	datad => regW(7),
	combout => \XALU|Mux10~1_combout\);

-- Location: LCCOMB_X44_Y9_N22
\XALU|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~2_combout\ = (\XALU|Mux10~0_combout\) # ((\XALU|Mux0~0_combout\ & \XALU|Mux10~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XALU|Mux10~0_combout\,
	datac => \XALU|Mux0~0_combout\,
	datad => \XALU|Mux10~1_combout\,
	combout => \XALU|Mux10~2_combout\);

-- Location: LCCOMB_X44_Y10_N0
\XROM|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux2~0_combout\ = (regAddress(1) & (!regAddress(3) & (regAddress(0) & !regAddress(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(3),
	datac => regAddress(0),
	datad => regAddress(2),
	combout => \XROM|Mux2~0_combout\);

-- Location: LCCOMB_X43_Y9_N18
\XROM|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux0~0_combout\ = (regAddress(3) & (((regAddress(2)) # (regAddress(0))) # (!regAddress(1)))) # (!regAddress(3) & ((regAddress(1) & (!regAddress(2))) # (!regAddress(1) & (regAddress(2) & !regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(3),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(0),
	combout => \XROM|Mux0~0_combout\);

-- Location: LCCOMB_X43_Y9_N28
\XROM|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux1~0_combout\ = (regAddress(3) & (!regAddress(1) & (!regAddress(2)))) # (!regAddress(3) & ((regAddress(1)) # ((regAddress(2)) # (regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(3),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(0),
	combout => \XROM|Mux1~0_combout\);

-- Location: LCCOMB_X48_Y10_N26
\XALU|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux1~0_combout\ = (!regOp(2) & ((regOp(0) & ((!\XALU|Add1~16_combout\))) # (!regOp(0) & (\XALU|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regOp(2),
	datac => \XALU|Add0~16_combout\,
	datad => \XALU|Add1~16_combout\,
	combout => \XALU|Mux1~0_combout\);

-- Location: LCCOMB_X48_Y10_N28
\XALU|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux1~1_combout\ = (regOp(1) & \XALU|Mux1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => regOp(1),
	datad => \XALU|Mux1~0_combout\,
	combout => \XALU|Mux1~1_combout\);

-- Location: LCCOMB_X47_Y9_N4
\W[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(0) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux9~6_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.resultToW~clkctrl_outclk\,
	datab => W(0),
	datac => \XALU|Mux9~6_combout\,
	datad => \rst~combout\,
	combout => W(0));

-- Location: LCCOMB_X44_Y9_N6
CoBuffer : cycloneii_lcell_comb
-- Equation(s):
-- \CoBuffer~combout\ = (GLOBAL(\Zout~0clkctrl_outclk\) & ((\XALU|Mux10~2_combout\))) # (!GLOBAL(\Zout~0clkctrl_outclk\) & (\CoBuffer~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CoBuffer~combout\,
	datab => \XALU|Mux10~2_combout\,
	datad => \Zout~0clkctrl_outclk\,
	combout => \CoBuffer~combout\);

-- Location: LCCOMB_X45_Y10_N20
\IR[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(9) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\XROM|Mux2~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XROM|Mux2~0_combout\,
	datac => IR(9),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(9));

-- Location: LCCOMB_X43_Y9_N16
\IR[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(11) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (!\XROM|Mux0~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XROM|Mux0~0_combout\,
	datac => IR(11),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(11));

-- Location: LCCOMB_X43_Y9_N14
\IR[10]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(10) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\XROM|Mux1~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XROM|Mux1~0_combout\,
	datac => IR(10),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(10));

-- Location: LCCOMB_X48_Y10_N2
\XALU|preR[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|preR\(8) = (\XALU|Mux0~0_combout\ & (\XALU|preR\(8))) # (!\XALU|Mux0~0_combout\ & ((\XALU|Mux1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XALU|preR\(8),
	datac => \XALU|Mux0~0_combout\,
	datad => \XALU|Mux1~1_combout\,
	combout => \XALU|preR\(8));

-- Location: LCCOMB_X49_Y10_N6
\PC[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(0) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((!regAddress(0)))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PC(0),
	datab => regAddress(0),
	datac => \estado.moveToRegisters~clkctrl_outclk\,
	datad => \rst~combout\,
	combout => PC(0));

-- Location: PIN_R22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G4
\estado.moveToRegisters~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \estado.moveToRegisters~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \estado.moveToRegisters~clkctrl_outclk\);

-- Location: PIN_R21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rst,
	combout => \rst~combout\);

-- Location: LCCOMB_X49_Y10_N8
\prox_estado.progMemRead_594\ : cycloneii_lcell_comb
-- Equation(s):
-- \prox_estado.progMemRead_594~combout\ = (\rst~combout\ & ((\estado.resultToW~regout\))) # (!\rst~combout\ & (\prox_estado.progMemRead_594~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \prox_estado.progMemRead_594~combout\,
	datad => \estado.resultToW~regout\,
	combout => \prox_estado.progMemRead_594~combout\);

-- Location: LCCOMB_X49_Y9_N30
\estado.progMemRead~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado.progMemRead~0_combout\ = !\prox_estado.progMemRead_594~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \prox_estado.progMemRead_594~combout\,
	combout => \estado.progMemRead~0_combout\);

-- Location: LCFF_X49_Y9_N31
\estado.progMemRead\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	datain => \estado.progMemRead~0_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.progMemRead~regout\);

-- Location: LCCOMB_X49_Y9_N20
\prox_estado.moveToRegisters_588\ : cycloneii_lcell_comb
-- Equation(s):
-- \prox_estado.moveToRegisters_588~combout\ = (\rst~combout\ & ((!\estado.progMemRead~regout\))) # (!\rst~combout\ & (\prox_estado.moveToRegisters_588~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \prox_estado.moveToRegisters_588~combout\,
	datac => \rst~combout\,
	datad => \estado.progMemRead~regout\,
	combout => \prox_estado.moveToRegisters_588~combout\);

-- Location: LCFF_X49_Y10_N31
\estado.moveToRegisters\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	sdata => \prox_estado.moveToRegisters_588~combout\,
	aclr => \ALT_INV_rst~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.moveToRegisters~regout\);

-- Location: LCCOMB_X49_Y10_N0
\prox_estado.resultToW_582\ : cycloneii_lcell_comb
-- Equation(s):
-- \prox_estado.resultToW_582~combout\ = (\rst~combout\ & ((\estado.moveToRegisters~regout\))) # (!\rst~combout\ & (\prox_estado.resultToW_582~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datac => \prox_estado.resultToW_582~combout\,
	datad => \estado.moveToRegisters~regout\,
	combout => \prox_estado.resultToW_582~combout\);

-- Location: LCFF_X49_Y10_N1
\estado.resultToW\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	datain => \prox_estado.resultToW_582~combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.resultToW~regout\);

-- Location: LCCOMB_X49_Y10_N30
\Zout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Zout~0_combout\ = (\rst~combout\ & \estado.resultToW~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datad => \estado.resultToW~regout\,
	combout => \Zout~0_combout\);

-- Location: CLKCTRL_G6
\Zout~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Zout~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Zout~0clkctrl_outclk\);

-- Location: LCCOMB_X44_Y9_N14
\regW[6]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \regW[6]~0_combout\ = (\estado.moveToRegisters~regout\ & \rst~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \estado.moveToRegisters~regout\,
	datad => \rst~combout\,
	combout => \regW[6]~0_combout\);

-- Location: CLKCTRL_G14
\regW[6]~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \regW[6]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \regW[6]~0clkctrl_outclk\);

-- Location: LCCOMB_X44_Y9_N18
\regS[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(3) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (IR(11))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IR(11),
	datab => regS(3),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regS(3));

-- Location: LCCOMB_X44_Y9_N20
\regOp[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regOp(3) = (\regW[6]~0_combout\ & ((regS(3)))) # (!\regW[6]~0_combout\ & (regOp(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(3),
	datac => \regW[6]~0_combout\,
	datad => regS(3),
	combout => regOp(3));

-- Location: LCCOMB_X45_Y10_N10
\regS[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (IR(9))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IR(9),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => regS(1),
	combout => regS(1));

-- Location: LCCOMB_X45_Y10_N16
\regOp[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regOp(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(1)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => regS(1),
	combout => regOp(1));

-- Location: LCCOMB_X44_Y9_N10
\regS[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(2) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (IR(10))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IR(10),
	datac => regS(2),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regS(2));

-- Location: LCCOMB_X44_Y9_N2
\regOp[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regOp(2) = (\regW[6]~0_combout\ & ((regS(2)))) # (!\regW[6]~0_combout\ & (regOp(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(2),
	datac => \regW[6]~0_combout\,
	datad => regS(2),
	combout => regOp(2));

-- Location: LCCOMB_X48_Y9_N24
\XALU|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~1_combout\ = (regOp(3) & (regOp(1) & regOp(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(3),
	datac => regOp(1),
	datad => regOp(2),
	combout => \XALU|Mux8~1_combout\);

-- Location: LCCOMB_X49_Y9_N16
\XALU|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~1_combout\ = (regOp(3) & regOp(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => regOp(3),
	datad => regOp(2),
	combout => \XALU|Mux2~1_combout\);

-- Location: LCCOMB_X47_Y9_N22
\W[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(6) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux3~6_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.resultToW~clkctrl_outclk\,
	datab => W(6),
	datac => \rst~combout\,
	datad => \XALU|Mux3~6_combout\,
	combout => W(6));

-- Location: LCCOMB_X47_Y10_N8
\regW[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(6) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(6)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(6),
	datac => W(6),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(6));

-- Location: LCCOMB_X49_Y9_N22
\carryIn~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \carryIn~0_combout\ = (\rst~combout\ & !\estado.progMemRead~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \estado.progMemRead~regout\,
	combout => \carryIn~0_combout\);

-- Location: CLKCTRL_G5
\carryIn~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \carryIn~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \carryIn~0clkctrl_outclk\);

-- Location: LCCOMB_X49_Y10_N12
\regAddress[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(0) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (PC(0))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((regAddress(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PC(0),
	datac => regAddress(0),
	datad => \carryIn~0clkctrl_outclk\,
	combout => regAddress(0));

-- Location: LCCOMB_X49_Y10_N4
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = regAddress(1) $ (regAddress(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => regAddress(1),
	datad => regAddress(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X49_Y10_N18
\PC[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(1) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~0_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.moveToRegisters~clkctrl_outclk\,
	datab => PC(1),
	datac => \Add0~0_combout\,
	datad => \rst~combout\,
	combout => PC(1));

-- Location: LCCOMB_X49_Y10_N24
\regAddress[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(1) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (PC(1))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((regAddress(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => PC(1),
	datac => regAddress(1),
	datad => \carryIn~0clkctrl_outclk\,
	combout => regAddress(1));

-- Location: LCCOMB_X49_Y10_N16
\Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = regAddress(2) $ (((regAddress(1) & regAddress(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(2),
	datac => regAddress(1),
	datad => regAddress(0),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X49_Y10_N28
\PC[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(2) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~1_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.moveToRegisters~clkctrl_outclk\,
	datab => PC(2),
	datac => \Add0~1_combout\,
	datad => \rst~combout\,
	combout => PC(2));

-- Location: LCCOMB_X49_Y10_N14
\regAddress[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(2) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (PC(2))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((regAddress(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => PC(2),
	datac => regAddress(2),
	datad => \carryIn~0clkctrl_outclk\,
	combout => regAddress(2));

-- Location: LCCOMB_X49_Y10_N20
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = regAddress(3) $ (((regAddress(1) & (regAddress(2) & regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(3),
	datac => regAddress(2),
	datad => regAddress(0),
	combout => \Add0~2_combout\);

-- Location: LCCOMB_X49_Y10_N22
\PC[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(3) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~2_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.moveToRegisters~clkctrl_outclk\,
	datab => PC(3),
	datac => \Add0~2_combout\,
	datad => \rst~combout\,
	combout => PC(3));

-- Location: LCCOMB_X49_Y10_N2
\regAddress[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(3) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((PC(3)))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (regAddress(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(3),
	datac => PC(3),
	datad => \carryIn~0clkctrl_outclk\,
	combout => regAddress(3));

-- Location: LCCOMB_X49_Y10_N26
\XROM|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux6~0_combout\ = (!regAddress(3) & (regAddress(2) $ (((regAddress(1) & !regAddress(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(0),
	datac => regAddress(3),
	datad => regAddress(2),
	combout => \XROM|Mux6~0_combout\);

-- Location: LCCOMB_X46_Y10_N28
\IR[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(5) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((\XROM|Mux6~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(5),
	datac => \XROM|Mux6~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(5));

-- Location: LCCOMB_X46_Y10_N20
\regB[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(5) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(5)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(5),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(5),
	combout => regB(5));

-- Location: LCCOMB_X49_Y10_N10
\XROM|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux7~0_combout\ = (!regAddress(0) & ((regAddress(1) & ((!regAddress(2)))) # (!regAddress(1) & (!regAddress(3) & regAddress(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(0),
	datac => regAddress(3),
	datad => regAddress(2),
	combout => \XROM|Mux7~0_combout\);

-- Location: LCCOMB_X49_Y9_N26
\IR[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(4) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((\XROM|Mux7~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(4),
	datac => \XROM|Mux7~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(4));

-- Location: LCCOMB_X49_Y9_N24
\regB[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(4) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(4)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(4),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(4),
	combout => regB(4));

-- Location: CLKCTRL_G7
\estado.resultToW~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \estado.resultToW~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \estado.resultToW~clkctrl_outclk\);

-- Location: LCCOMB_X49_Y9_N6
\XALU|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~2_combout\ = (!regOp(3) & !regOp(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => regOp(3),
	datad => regOp(2),
	combout => \XALU|Mux2~2_combout\);

-- Location: LCCOMB_X45_Y10_N2
\XALU|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux0~0_combout\ = (!regOp(3) & (!regOp(2) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(3),
	datab => regOp(2),
	datac => regOp(1),
	combout => \XALU|Mux0~0_combout\);

-- Location: LCCOMB_X48_Y9_N8
\XALU|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & ((regW(6)))) # (!regOp(0) & (regW(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(4),
	datac => regW(6),
	datad => \XALU|Mux0~0_combout\,
	combout => \XALU|Mux4~0_combout\);

-- Location: LCCOMB_X43_Y9_N30
\XROM|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux3~0_combout\ = (regAddress(0)) # ((regAddress(2) & ((regAddress(3)) # (!regAddress(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(3),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(0),
	combout => \XROM|Mux3~0_combout\);

-- Location: LCCOMB_X43_Y9_N20
\IR[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(8) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (!\XROM|Mux3~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XROM|Mux3~0_combout\,
	datac => IR(8),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(8));

-- Location: LCCOMB_X44_Y9_N28
\regS[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(0) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(8)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regS(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regS(0),
	datac => IR(8),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regS(0));

-- Location: LCCOMB_X44_Y9_N0
\regOp[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regOp(0) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(0)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regOp(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(0),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => regS(0),
	combout => regOp(0));

-- Location: LCCOMB_X48_Y9_N10
\XALU|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~0_combout\ = (regOp(3) & ((regOp(0)) # (!regOp(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(2),
	datab => regOp(3),
	datad => regOp(0),
	combout => \XALU|Mux2~0_combout\);

-- Location: LCCOMB_X46_Y10_N4
\XALU|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~3_combout\ = (regW(5) & (regOp(1) $ (((regOp(0)) # (regB(5)))))) # (!regW(5) & ((regOp(0) & ((regB(5)) # (regOp(1)))) # (!regOp(0) & (regB(5) & regOp(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datab => regOp(0),
	datac => regB(5),
	datad => regOp(1),
	combout => \XALU|Mux4~3_combout\);

-- Location: LCCOMB_X45_Y10_N4
\XROM|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux8~0_combout\ = (regAddress(2) & (((regAddress(3)) # (regAddress(0))))) # (!regAddress(2) & ((regAddress(1)) # ((regAddress(3) & regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(2),
	datab => regAddress(1),
	datac => regAddress(3),
	datad => regAddress(0),
	combout => \XROM|Mux8~0_combout\);

-- Location: LCCOMB_X45_Y10_N22
\IR[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(3) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((!\XROM|Mux8~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(3),
	datac => \XROM|Mux8~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(3));

-- Location: LCCOMB_X45_Y10_N18
\regB[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(3) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(3)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regB(3),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(3),
	combout => regB(3));

-- Location: LCCOMB_X44_Y9_N8
\XROM|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux9~0_combout\ = (regAddress(3) & (((regAddress(0)) # (regAddress(2))))) # (!regAddress(3) & (regAddress(1) & ((!regAddress(2)) # (!regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(0),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux9~0_combout\);

-- Location: LCCOMB_X45_Y9_N28
\IR[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(2) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (!\XROM|Mux9~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XROM|Mux9~0_combout\,
	datac => IR(2),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(2));

-- Location: LCCOMB_X45_Y9_N22
\regB[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(2) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(2)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regB(2),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(2),
	combout => regB(2));

-- Location: LCCOMB_X47_Y10_N6
\regW[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(0) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (W(0))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regW(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(0),
	datac => regW(0),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(0));

-- Location: LCCOMB_X47_Y10_N0
\XALU|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (regW(2))) # (!regOp(0) & ((regW(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datab => \XALU|Mux0~0_combout\,
	datac => regOp(0),
	datad => regW(0),
	combout => \XALU|Mux8~0_combout\);

-- Location: LCCOMB_X44_Y9_N30
carryIn : cycloneii_lcell_comb
-- Equation(s):
-- \carryIn~combout\ = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\CoBuffer~combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((\carryIn~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CoBuffer~combout\,
	datac => \carryIn~0clkctrl_outclk\,
	datad => \carryIn~combout\,
	combout => \carryIn~combout\);

-- Location: LCCOMB_X45_Y9_N0
\XALU|Add4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~1_cout\ = CARRY(!\carryIn~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \carryIn~combout\,
	datad => VCC,
	cout => \XALU|Add4~1_cout\);

-- Location: LCCOMB_X45_Y9_N4
\XALU|Add4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~4_combout\ = ((regB(1) $ (regW(1) $ (\XALU|Add4~3\)))) # (GND)
-- \XALU|Add4~5\ = CARRY((regB(1) & (regW(1) & !\XALU|Add4~3\)) # (!regB(1) & ((regW(1)) # (!\XALU|Add4~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regW(1),
	datad => VCC,
	cin => \XALU|Add4~3\,
	combout => \XALU|Add4~4_combout\,
	cout => \XALU|Add4~5\);

-- Location: LCCOMB_X43_Y9_N24
\XROM|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux10~0_combout\ = (regAddress(1) & ((regAddress(2)) # (regAddress(3) $ (!regAddress(0))))) # (!regAddress(1) & ((regAddress(3)) # ((regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(3),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(0),
	combout => \XROM|Mux10~0_combout\);

-- Location: LCCOMB_X45_Y9_N30
\IR[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(1) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((!\XROM|Mux10~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(1),
	datac => \XROM|Mux10~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(1));

-- Location: LCCOMB_X45_Y9_N24
\regB[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(1)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(1),
	combout => regB(1));

-- Location: LCCOMB_X46_Y9_N22
\XALU|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~2_combout\ = (regOp(0) & ((regB(1)) # ((regOp(1))))) # (!regOp(0) & (((!regOp(1) & regW(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regB(1),
	datac => regOp(1),
	datad => regW(1),
	combout => \XALU|Mux8~2_combout\);

-- Location: LCCOMB_X47_Y10_N14
\XALU|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~0_combout\ = regW(0) $ (VCC)
-- \XALU|Add0~1\ = CARRY(regW(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(0),
	datad => VCC,
	combout => \XALU|Add0~0_combout\,
	cout => \XALU|Add0~1\);

-- Location: LCCOMB_X47_Y10_N16
\XALU|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~2_combout\ = (regW(1) & (!\XALU|Add0~1\)) # (!regW(1) & ((\XALU|Add0~1\) # (GND)))
-- \XALU|Add0~3\ = CARRY((!\XALU|Add0~1\) # (!regW(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(1),
	datad => VCC,
	cin => \XALU|Add0~1\,
	combout => \XALU|Add0~2_combout\,
	cout => \XALU|Add0~3\);

-- Location: LCCOMB_X48_Y10_N4
\XALU|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~0_combout\ = regW(0) $ (VCC)
-- \XALU|Add1~1\ = CARRY(regW(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(0),
	datad => VCC,
	combout => \XALU|Add1~0_combout\,
	cout => \XALU|Add1~1\);

-- Location: LCCOMB_X48_Y10_N6
\XALU|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~2_combout\ = (regW(1) & (\XALU|Add1~1\ & VCC)) # (!regW(1) & (!\XALU|Add1~1\))
-- \XALU|Add1~3\ = CARRY((!regW(1) & !\XALU|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(1),
	datad => VCC,
	cin => \XALU|Add1~1\,
	combout => \XALU|Add1~2_combout\,
	cout => \XALU|Add1~3\);

-- Location: LCCOMB_X46_Y9_N24
\XALU|Mux8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~3_combout\ = (regOp(1) & ((\XALU|Mux8~2_combout\ & ((\XALU|Add1~2_combout\))) # (!\XALU|Mux8~2_combout\ & (\XALU|Add0~2_combout\)))) # (!regOp(1) & (\XALU|Mux8~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Add0~2_combout\,
	datad => \XALU|Add1~2_combout\,
	combout => \XALU|Mux8~3_combout\);

-- Location: LCCOMB_X46_Y9_N0
\XALU|Add2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~1_cout\ = CARRY(\carryIn~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \carryIn~combout\,
	datad => VCC,
	cout => \XALU|Add2~1_cout\);

-- Location: LCCOMB_X46_Y9_N2
\XALU|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~2_combout\ = (regB(1) & ((regW(0) & (\XALU|Add2~1_cout\ & VCC)) # (!regW(0) & (!\XALU|Add2~1_cout\)))) # (!regB(1) & ((regW(0) & (!\XALU|Add2~1_cout\)) # (!regW(0) & ((\XALU|Add2~1_cout\) # (GND)))))
-- \XALU|Add2~3\ = CARRY((regB(1) & (!regW(0) & !\XALU|Add2~1_cout\)) # (!regB(1) & ((!\XALU|Add2~1_cout\) # (!regW(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regW(0),
	datad => VCC,
	cin => \XALU|Add2~1_cout\,
	combout => \XALU|Add2~2_combout\,
	cout => \XALU|Add2~3\);

-- Location: LCCOMB_X46_Y9_N4
\XALU|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~4_combout\ = ((regB(1) $ (regW(1) $ (!\XALU|Add2~3\)))) # (GND)
-- \XALU|Add2~5\ = CARRY((regB(1) & ((regW(1)) # (!\XALU|Add2~3\))) # (!regB(1) & (regW(1) & !\XALU|Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regW(1),
	datad => VCC,
	cin => \XALU|Add2~3\,
	combout => \XALU|Add2~4_combout\,
	cout => \XALU|Add2~5\);

-- Location: LCCOMB_X46_Y9_N26
\XALU|Mux8~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~4_combout\ = (regOp(1) & (regW(1) $ (((regOp(0)) # (regB(1)))))) # (!regOp(1) & ((regOp(0) & ((regB(1)) # (regW(1)))) # (!regOp(0) & (regB(1) & regW(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regB(1),
	datac => regOp(1),
	datad => regW(1),
	combout => \XALU|Mux8~4_combout\);

-- Location: LCCOMB_X46_Y9_N28
\XALU|Mux8~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~5_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & (\XALU|Add2~4_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux8~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add2~4_combout\,
	datad => \XALU|Mux8~4_combout\,
	combout => \XALU|Mux8~5_combout\);

-- Location: LCCOMB_X46_Y9_N18
\XALU|Mux8~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~6_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux8~5_combout\ & (\XALU|Add4~4_combout\)) # (!\XALU|Mux8~5_combout\ & ((\XALU|Mux8~3_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux8~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Add4~4_combout\,
	datac => \XALU|Mux8~3_combout\,
	datad => \XALU|Mux8~5_combout\,
	combout => \XALU|Mux8~6_combout\);

-- Location: LCCOMB_X47_Y9_N12
\XALU|Mux8~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~7_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux8~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux8~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~1_combout\,
	datac => \XALU|Mux8~0_combout\,
	datad => \XALU|Mux8~6_combout\,
	combout => \XALU|Mux8~7_combout\);

-- Location: LCCOMB_X46_Y9_N30
\W[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(1) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux8~7_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(1),
	datab => \XALU|Mux8~7_combout\,
	datac => \estado.resultToW~clkctrl_outclk\,
	datad => \rst~combout\,
	combout => W(1));

-- Location: LCCOMB_X47_Y10_N12
\regW[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(1)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(1),
	datac => W(1),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(1));

-- Location: LCCOMB_X46_Y9_N6
\XALU|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~6_combout\ = (regW(2) & ((regB(2) & (\XALU|Add2~5\ & VCC)) # (!regB(2) & (!\XALU|Add2~5\)))) # (!regW(2) & ((regB(2) & (!\XALU|Add2~5\)) # (!regB(2) & ((\XALU|Add2~5\) # (GND)))))
-- \XALU|Add2~7\ = CARRY((regW(2) & (!regB(2) & !\XALU|Add2~5\)) # (!regW(2) & ((!\XALU|Add2~5\) # (!regB(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datab => regB(2),
	datad => VCC,
	cin => \XALU|Add2~5\,
	combout => \XALU|Add2~6_combout\,
	cout => \XALU|Add2~7\);

-- Location: LCCOMB_X46_Y9_N8
\XALU|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~8_combout\ = ((regW(3) $ (regB(3) $ (!\XALU|Add2~7\)))) # (GND)
-- \XALU|Add2~9\ = CARRY((regW(3) & ((regB(3)) # (!\XALU|Add2~7\))) # (!regW(3) & (regB(3) & !\XALU|Add2~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datab => regB(3),
	datad => VCC,
	cin => \XALU|Add2~7\,
	combout => \XALU|Add2~8_combout\,
	cout => \XALU|Add2~9\);

-- Location: LCCOMB_X46_Y9_N10
\XALU|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~10_combout\ = (regB(4) & ((regW(4) & (\XALU|Add2~9\ & VCC)) # (!regW(4) & (!\XALU|Add2~9\)))) # (!regB(4) & ((regW(4) & (!\XALU|Add2~9\)) # (!regW(4) & ((\XALU|Add2~9\) # (GND)))))
-- \XALU|Add2~11\ = CARRY((regB(4) & (!regW(4) & !\XALU|Add2~9\)) # (!regB(4) & ((!\XALU|Add2~9\) # (!regW(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(4),
	datab => regW(4),
	datad => VCC,
	cin => \XALU|Add2~9\,
	combout => \XALU|Add2~10_combout\,
	cout => \XALU|Add2~11\);

-- Location: LCCOMB_X46_Y9_N12
\XALU|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~12_combout\ = ((regB(5) $ (regW(5) $ (!\XALU|Add2~11\)))) # (GND)
-- \XALU|Add2~13\ = CARRY((regB(5) & ((regW(5)) # (!\XALU|Add2~11\))) # (!regB(5) & (regW(5) & !\XALU|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(5),
	datab => regW(5),
	datad => VCC,
	cin => \XALU|Add2~11\,
	combout => \XALU|Add2~12_combout\,
	cout => \XALU|Add2~13\);

-- Location: LCCOMB_X47_Y9_N2
\XALU|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~4_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\) # ((\XALU|Add2~12_combout\)))) # (!\XALU|Mux2~1_combout\ & (!\XALU|Mux2~0_combout\ & (\XALU|Mux4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux4~3_combout\,
	datad => \XALU|Add2~12_combout\,
	combout => \XALU|Mux4~4_combout\);

-- Location: LCCOMB_X45_Y9_N12
\XALU|Add4~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~12_combout\ = ((regW(5) $ (regB(5) $ (\XALU|Add4~11\)))) # (GND)
-- \XALU|Add4~13\ = CARRY((regW(5) & ((!\XALU|Add4~11\) # (!regB(5)))) # (!regW(5) & (!regB(5) & !\XALU|Add4~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datab => regB(5),
	datad => VCC,
	cin => \XALU|Add4~11\,
	combout => \XALU|Add4~12_combout\,
	cout => \XALU|Add4~13\);

-- Location: LCCOMB_X47_Y10_N10
\XALU|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (regW(3))) # (!regOp(0) & ((regW(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datab => \XALU|Mux0~0_combout\,
	datac => regOp(0),
	datad => regW(1),
	combout => \XALU|Mux7~0_combout\);

-- Location: LCCOMB_X48_Y10_N8
\XALU|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~4_combout\ = (regW(2) & ((GND) # (!\XALU|Add1~3\))) # (!regW(2) & (\XALU|Add1~3\ $ (GND)))
-- \XALU|Add1~5\ = CARRY((regW(2)) # (!\XALU|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(2),
	datad => VCC,
	cin => \XALU|Add1~3\,
	combout => \XALU|Add1~4_combout\,
	cout => \XALU|Add1~5\);

-- Location: LCCOMB_X45_Y10_N14
\XALU|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~1_combout\ = (regOp(0) & (((regOp(1)) # (regB(2))))) # (!regOp(0) & (regW(2) & (!regOp(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(2),
	datac => regOp(1),
	datad => regB(2),
	combout => \XALU|Mux7~1_combout\);

-- Location: LCCOMB_X47_Y10_N18
\XALU|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~4_combout\ = (regW(2) & (\XALU|Add0~3\ $ (GND))) # (!regW(2) & (!\XALU|Add0~3\ & VCC))
-- \XALU|Add0~5\ = CARRY((regW(2) & !\XALU|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datad => VCC,
	cin => \XALU|Add0~3\,
	combout => \XALU|Add0~4_combout\,
	cout => \XALU|Add0~5\);

-- Location: LCCOMB_X48_Y10_N0
\XALU|Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~2_combout\ = (regOp(1) & ((\XALU|Mux7~1_combout\ & (\XALU|Add1~4_combout\)) # (!\XALU|Mux7~1_combout\ & ((\XALU|Add0~4_combout\))))) # (!regOp(1) & (((\XALU|Mux7~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Add1~4_combout\,
	datac => \XALU|Mux7~1_combout\,
	datad => \XALU|Add0~4_combout\,
	combout => \XALU|Mux7~2_combout\);

-- Location: LCCOMB_X48_Y10_N30
\XALU|Mux7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~4_combout\ = (\XALU|Mux2~1_combout\ & (((\XALU|Mux2~0_combout\)))) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\ & ((\XALU|Mux7~2_combout\))) # (!\XALU|Mux2~0_combout\ & (\XALU|Mux7~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux7~3_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Mux2~0_combout\,
	datad => \XALU|Mux7~2_combout\,
	combout => \XALU|Mux7~4_combout\);

-- Location: LCCOMB_X45_Y9_N6
\XALU|Add4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~6_combout\ = (regW(2) & ((regB(2) & (!\XALU|Add4~5\)) # (!regB(2) & (\XALU|Add4~5\ & VCC)))) # (!regW(2) & ((regB(2) & ((\XALU|Add4~5\) # (GND))) # (!regB(2) & (!\XALU|Add4~5\))))
-- \XALU|Add4~7\ = CARRY((regW(2) & (regB(2) & !\XALU|Add4~5\)) # (!regW(2) & ((regB(2)) # (!\XALU|Add4~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datab => regB(2),
	datad => VCC,
	cin => \XALU|Add4~5\,
	combout => \XALU|Add4~6_combout\,
	cout => \XALU|Add4~7\);

-- Location: LCCOMB_X48_Y10_N22
\XALU|Mux7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~5_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux7~4_combout\ & ((\XALU|Add4~6_combout\))) # (!\XALU|Mux7~4_combout\ & (\XALU|Add2~6_combout\)))) # (!\XALU|Mux2~1_combout\ & (\XALU|Mux7~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux7~4_combout\,
	datac => \XALU|Add2~6_combout\,
	datad => \XALU|Add4~6_combout\,
	combout => \XALU|Mux7~5_combout\);

-- Location: LCCOMB_X47_Y9_N30
\XALU|Mux7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~6_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux7~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux7~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~1_combout\,
	datac => \XALU|Mux7~0_combout\,
	datad => \XALU|Mux7~5_combout\,
	combout => \XALU|Mux7~6_combout\);

-- Location: LCCOMB_X46_Y9_N20
\W[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(2) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux7~6_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(2),
	datab => \estado.resultToW~clkctrl_outclk\,
	datac => \rst~combout\,
	datad => \XALU|Mux7~6_combout\,
	combout => W(2));

-- Location: LCCOMB_X46_Y10_N0
\regW[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(2) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(2)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(2),
	datac => W(2),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(2));

-- Location: LCCOMB_X48_Y10_N10
\XALU|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~6_combout\ = (regW(3) & (\XALU|Add1~5\ & VCC)) # (!regW(3) & (!\XALU|Add1~5\))
-- \XALU|Add1~7\ = CARRY((!regW(3) & !\XALU|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(3),
	datad => VCC,
	cin => \XALU|Add1~5\,
	combout => \XALU|Add1~6_combout\,
	cout => \XALU|Add1~7\);

-- Location: LCCOMB_X48_Y10_N12
\XALU|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~8_combout\ = (regW(4) & ((GND) # (!\XALU|Add1~7\))) # (!regW(4) & (\XALU|Add1~7\ $ (GND)))
-- \XALU|Add1~9\ = CARRY((regW(4)) # (!\XALU|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(4),
	datad => VCC,
	cin => \XALU|Add1~7\,
	combout => \XALU|Add1~8_combout\,
	cout => \XALU|Add1~9\);

-- Location: LCCOMB_X48_Y10_N14
\XALU|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~10_combout\ = (regW(5) & (\XALU|Add1~9\ & VCC)) # (!regW(5) & (!\XALU|Add1~9\))
-- \XALU|Add1~11\ = CARRY((!regW(5) & !\XALU|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datad => VCC,
	cin => \XALU|Add1~9\,
	combout => \XALU|Add1~10_combout\,
	cout => \XALU|Add1~11\);

-- Location: LCCOMB_X46_Y10_N10
\XALU|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~1_combout\ = (regOp(1) & (((regOp(0))))) # (!regOp(1) & ((regOp(0) & ((regB(5)))) # (!regOp(0) & (regW(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datab => regOp(1),
	datac => regB(5),
	datad => regOp(0),
	combout => \XALU|Mux4~1_combout\);

-- Location: LCCOMB_X47_Y10_N4
\XALU|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~2_combout\ = (regOp(1) & ((\XALU|Mux4~1_combout\ & ((\XALU|Add1~10_combout\))) # (!\XALU|Mux4~1_combout\ & (\XALU|Add0~10_combout\)))) # (!regOp(1) & (((\XALU|Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add0~10_combout\,
	datab => regOp(1),
	datac => \XALU|Add1~10_combout\,
	datad => \XALU|Mux4~1_combout\,
	combout => \XALU|Mux4~2_combout\);

-- Location: LCCOMB_X47_Y9_N24
\XALU|Mux4~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux4~4_combout\ & (\XALU|Add4~12_combout\)) # (!\XALU|Mux4~4_combout\ & ((\XALU|Mux4~2_combout\))))) # (!\XALU|Mux2~0_combout\ & (\XALU|Mux4~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux4~4_combout\,
	datac => \XALU|Add4~12_combout\,
	datad => \XALU|Mux4~2_combout\,
	combout => \XALU|Mux4~5_combout\);

-- Location: LCCOMB_X47_Y9_N14
\XALU|Mux4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~6_combout\ = (\XALU|Mux4~0_combout\) # ((\XALU|Mux8~1_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux4~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux4~0_combout\,
	datac => \XALU|Mux4~5_combout\,
	datad => \XALU|Mux8~1_combout\,
	combout => \XALU|Mux4~6_combout\);

-- Location: LCCOMB_X48_Y9_N14
\W[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(5) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux4~6_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.resultToW~clkctrl_outclk\,
	datab => W(5),
	datac => \rst~combout\,
	datad => \XALU|Mux4~6_combout\,
	combout => W(5));

-- Location: LCCOMB_X47_Y10_N2
\regW[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(5) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(5)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(5),
	datac => W(5),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(5));

-- Location: LCCOMB_X48_Y9_N26
\XALU|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (regW(5))) # (!regOp(0) & ((regW(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \XALU|Mux0~0_combout\,
	datac => regW(5),
	datad => regW(3),
	combout => \XALU|Mux5~0_combout\);

-- Location: LCCOMB_X49_Y9_N28
\XALU|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~1_combout\ = (regOp(1) & (regW(4) $ (((regB(4)) # (regOp(0)))))) # (!regOp(1) & ((regB(4) & ((regOp(0)) # (regW(4)))) # (!regB(4) & (regOp(0) & regW(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(4),
	datab => regOp(0),
	datac => regOp(1),
	datad => regW(4),
	combout => \XALU|Mux5~1_combout\);

-- Location: LCCOMB_X49_Y9_N10
\XALU|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~2_combout\ = (!\XALU|Mux2~2_combout\ & ((\XALU|Mux2~1_combout\) # ((\XALU|Mux2~0_combout\) # (\XALU|Mux5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Mux2~0_combout\,
	datad => \XALU|Mux5~1_combout\,
	combout => \XALU|Mux5~2_combout\);

-- Location: LCCOMB_X49_Y9_N8
\XALU|Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~3_combout\ = (regOp(1) & (((regOp(0))))) # (!regOp(1) & ((regOp(0) & (regB(4))) # (!regOp(0) & ((regW(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(4),
	datab => regOp(1),
	datac => regOp(0),
	datad => regW(4),
	combout => \XALU|Mux5~3_combout\);

-- Location: LCCOMB_X47_Y10_N22
\XALU|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~8_combout\ = (regW(4) & (\XALU|Add0~7\ $ (GND))) # (!regW(4) & (!\XALU|Add0~7\ & VCC))
-- \XALU|Add0~9\ = CARRY((regW(4) & !\XALU|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(4),
	datad => VCC,
	cin => \XALU|Add0~7\,
	combout => \XALU|Add0~8_combout\,
	cout => \XALU|Add0~9\);

-- Location: LCCOMB_X48_Y9_N20
\XALU|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~4_combout\ = (regOp(1) & ((\XALU|Mux5~3_combout\ & ((\XALU|Add1~8_combout\))) # (!\XALU|Mux5~3_combout\ & (\XALU|Add0~8_combout\)))) # (!regOp(1) & (\XALU|Mux5~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Mux5~3_combout\,
	datac => \XALU|Add0~8_combout\,
	datad => \XALU|Add1~8_combout\,
	combout => \XALU|Mux5~4_combout\);

-- Location: LCCOMB_X45_Y9_N10
\XALU|Add4~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~10_combout\ = (regW(4) & ((regB(4) & (!\XALU|Add4~9\)) # (!regB(4) & (\XALU|Add4~9\ & VCC)))) # (!regW(4) & ((regB(4) & ((\XALU|Add4~9\) # (GND))) # (!regB(4) & (!\XALU|Add4~9\))))
-- \XALU|Add4~11\ = CARRY((regW(4) & (regB(4) & !\XALU|Add4~9\)) # (!regW(4) & ((regB(4)) # (!\XALU|Add4~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datab => regB(4),
	datad => VCC,
	cin => \XALU|Add4~9\,
	combout => \XALU|Add4~10_combout\,
	cout => \XALU|Add4~11\);

-- Location: LCCOMB_X48_Y9_N6
\XALU|Mux5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Add4~10_combout\))) # (!\XALU|Mux2~0_combout\ & (\XALU|Add2~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datac => \XALU|Add2~10_combout\,
	datad => \XALU|Add4~10_combout\,
	combout => \XALU|Mux5~5_combout\);

-- Location: LCCOMB_X48_Y9_N28
\XALU|Mux5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~6_combout\ = (\XALU|Mux2~1_combout\ & (((\XALU|Mux5~5_combout\)))) # (!\XALU|Mux2~1_combout\ & (((\XALU|Mux5~4_combout\)) # (!\XALU|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Mux5~4_combout\,
	datad => \XALU|Mux5~5_combout\,
	combout => \XALU|Mux5~6_combout\);

-- Location: LCCOMB_X48_Y9_N30
\XALU|Mux5~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~7_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux5~0_combout\) # ((\XALU|Mux5~2_combout\ & \XALU|Mux5~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux8~1_combout\,
	datab => \XALU|Mux5~0_combout\,
	datac => \XALU|Mux5~2_combout\,
	datad => \XALU|Mux5~6_combout\,
	combout => \XALU|Mux5~7_combout\);

-- Location: LCCOMB_X49_Y9_N12
\W[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(4) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux5~7_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(4),
	datab => \rst~combout\,
	datac => \XALU|Mux5~7_combout\,
	datad => \estado.resultToW~clkctrl_outclk\,
	combout => W(4));

-- Location: LCCOMB_X48_Y9_N0
\regW[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(4) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(4)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(4),
	datac => W(4),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(4));

-- Location: LCCOMB_X48_Y9_N4
\XALU|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (regW(4))) # (!regOp(0) & ((regW(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(4),
	datac => regW(2),
	datad => \XALU|Mux0~0_combout\,
	combout => \XALU|Mux6~0_combout\);

-- Location: LCCOMB_X45_Y9_N8
\XALU|Add4~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~8_combout\ = ((regB(3) $ (regW(3) $ (\XALU|Add4~7\)))) # (GND)
-- \XALU|Add4~9\ = CARRY((regB(3) & (regW(3) & !\XALU|Add4~7\)) # (!regB(3) & ((regW(3)) # (!\XALU|Add4~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(3),
	datab => regW(3),
	datad => VCC,
	cin => \XALU|Add4~7\,
	combout => \XALU|Add4~8_combout\,
	cout => \XALU|Add4~9\);

-- Location: LCCOMB_X48_Y9_N22
\XALU|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~1_combout\ = (regOp(0) & ((regB(3)) # ((regOp(1))))) # (!regOp(0) & (((!regOp(1) & regW(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regB(3),
	datac => regOp(1),
	datad => regW(3),
	combout => \XALU|Mux6~1_combout\);

-- Location: LCCOMB_X48_Y9_N16
\XALU|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~2_combout\ = (regOp(1) & ((\XALU|Mux6~1_combout\ & ((\XALU|Add1~6_combout\))) # (!\XALU|Mux6~1_combout\ & (\XALU|Add0~6_combout\)))) # (!regOp(1) & (((\XALU|Mux6~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add0~6_combout\,
	datab => regOp(1),
	datac => \XALU|Add1~6_combout\,
	datad => \XALU|Mux6~1_combout\,
	combout => \XALU|Mux6~2_combout\);

-- Location: LCCOMB_X45_Y10_N12
\XALU|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~3_combout\ = (regOp(1) & (regW(3) $ (((regOp(0)) # (regB(3)))))) # (!regOp(1) & ((regOp(0) & ((regB(3)) # (regW(3)))) # (!regOp(0) & (regB(3) & regW(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regB(3),
	datac => regOp(1),
	datad => regW(3),
	combout => \XALU|Mux6~3_combout\);

-- Location: LCCOMB_X49_Y9_N18
\XALU|Mux6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~4_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & (\XALU|Add2~8_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux6~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add2~8_combout\,
	datad => \XALU|Mux6~3_combout\,
	combout => \XALU|Mux6~4_combout\);

-- Location: LCCOMB_X48_Y9_N18
\XALU|Mux6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux6~4_combout\ & (\XALU|Add4~8_combout\)) # (!\XALU|Mux6~4_combout\ & ((\XALU|Mux6~2_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux6~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Add4~8_combout\,
	datac => \XALU|Mux6~2_combout\,
	datad => \XALU|Mux6~4_combout\,
	combout => \XALU|Mux6~5_combout\);

-- Location: LCCOMB_X48_Y9_N12
\XALU|Mux6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~6_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux6~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux6~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux8~1_combout\,
	datab => \XALU|Mux2~2_combout\,
	datac => \XALU|Mux6~0_combout\,
	datad => \XALU|Mux6~5_combout\,
	combout => \XALU|Mux6~6_combout\);

-- Location: LCCOMB_X49_Y9_N14
\W[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(3) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux6~6_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(3),
	datab => \rst~combout\,
	datac => \estado.resultToW~clkctrl_outclk\,
	datad => \XALU|Mux6~6_combout\,
	combout => W(3));

-- Location: LCCOMB_X46_Y10_N2
\regW[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(3) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(3)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(3),
	datac => W(3),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(3));

-- Location: LCCOMB_X46_Y10_N26
\XALU|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~3_combout\ = (regOp(1) & (regW(6) $ (((regB(6)) # (regOp(0)))))) # (!regOp(1) & ((regB(6) & ((regW(6)) # (regOp(0)))) # (!regB(6) & (regW(6) & regOp(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(6),
	datab => regOp(1),
	datac => regW(6),
	datad => regOp(0),
	combout => \XALU|Mux3~3_combout\);

-- Location: LCCOMB_X45_Y10_N0
\XROM|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux5~0_combout\ = (!regAddress(3) & ((regAddress(2)) # ((regAddress(1) & !regAddress(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(2),
	datab => regAddress(1),
	datac => regAddress(3),
	datad => regAddress(0),
	combout => \XROM|Mux5~0_combout\);

-- Location: LCCOMB_X45_Y10_N28
\IR[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(6) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\XROM|Mux5~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XROM|Mux5~0_combout\,
	datac => IR(6),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(6));

-- Location: LCCOMB_X45_Y10_N8
\regB[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(6) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(6)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regB(6),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(6),
	combout => regB(6));

-- Location: LCCOMB_X45_Y10_N6
\XALU|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~1_combout\ = (regOp(0) & ((regB(6)) # ((regOp(1))))) # (!regOp(0) & (((!regOp(1) & regW(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regB(6),
	datac => regOp(1),
	datad => regW(6),
	combout => \XALU|Mux3~1_combout\);

-- Location: LCCOMB_X47_Y10_N26
\XALU|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~12_combout\ = (regW(6) & (\XALU|Add0~11\ $ (GND))) # (!regW(6) & (!\XALU|Add0~11\ & VCC))
-- \XALU|Add0~13\ = CARRY((regW(6) & !\XALU|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(6),
	datad => VCC,
	cin => \XALU|Add0~11\,
	combout => \XALU|Add0~12_combout\,
	cout => \XALU|Add0~13\);

-- Location: LCCOMB_X48_Y9_N2
\XALU|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~2_combout\ = (regOp(1) & ((\XALU|Mux3~1_combout\ & (\XALU|Add1~12_combout\)) # (!\XALU|Mux3~1_combout\ & ((\XALU|Add0~12_combout\))))) # (!regOp(1) & (((\XALU|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add1~12_combout\,
	datab => regOp(1),
	datac => \XALU|Mux3~1_combout\,
	datad => \XALU|Add0~12_combout\,
	combout => \XALU|Mux3~2_combout\);

-- Location: LCCOMB_X47_Y9_N10
\XALU|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~4_combout\ = (\XALU|Mux2~1_combout\ & (((\XALU|Mux2~0_combout\)))) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\ & ((\XALU|Mux3~2_combout\))) # (!\XALU|Mux2~0_combout\ & (\XALU|Mux3~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux3~3_combout\,
	datac => \XALU|Mux2~0_combout\,
	datad => \XALU|Mux3~2_combout\,
	combout => \XALU|Mux3~4_combout\);

-- Location: LCCOMB_X47_Y9_N20
\XALU|Mux3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~5_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux3~4_combout\ & ((\XALU|Add4~14_combout\))) # (!\XALU|Mux3~4_combout\ & (\XALU|Add2~14_combout\)))) # (!\XALU|Mux2~1_combout\ & (((\XALU|Mux3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add2~14_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add4~14_combout\,
	datad => \XALU|Mux3~4_combout\,
	combout => \XALU|Mux3~5_combout\);

-- Location: LCCOMB_X45_Y9_N26
\XALU|Mux2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~4_combout\ = (regOp(0) & ((regB(7)) # ((regOp(1))))) # (!regOp(0) & (((!regOp(1) & regW(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(7),
	datab => regOp(0),
	datac => regOp(1),
	datad => regW(7),
	combout => \XALU|Mux2~4_combout\);

-- Location: LCCOMB_X46_Y10_N14
\XALU|Mux2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~5_combout\ = (regOp(1) & ((\XALU|Mux2~4_combout\ & ((\XALU|Add1~14_combout\))) # (!\XALU|Mux2~4_combout\ & (\XALU|Add0~14_combout\)))) # (!regOp(1) & (((\XALU|Mux2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Add0~14_combout\,
	datac => \XALU|Add1~14_combout\,
	datad => \XALU|Mux2~4_combout\,
	combout => \XALU|Mux2~5_combout\);

-- Location: LCCOMB_X46_Y9_N16
\XALU|Add2~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~16_combout\ = regB(7) $ (\XALU|Add2~15\ $ (!regW(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regB(7),
	datad => regW(7),
	cin => \XALU|Add2~15\,
	combout => \XALU|Add2~16_combout\);

-- Location: LCCOMB_X44_Y9_N4
\XROM|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux4~0_combout\ = (!regAddress(0) & (!regAddress(3) & ((regAddress(1)) # (regAddress(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(0),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux4~0_combout\);

-- Location: LCCOMB_X45_Y9_N18
\IR[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(7) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((\XROM|Mux4~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(7),
	datac => \XROM|Mux4~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(7));

-- Location: LCCOMB_X45_Y9_N20
\regB[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- regB(7) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(7)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regB(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(7),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(7),
	combout => regB(7));

-- Location: LCCOMB_X46_Y10_N8
\XALU|Mux2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~6_combout\ = (regW(7) & (regOp(1) $ (((regB(7)) # (regOp(0)))))) # (!regW(7) & ((regOp(1) & ((regB(7)) # (regOp(0)))) # (!regOp(1) & (regB(7) & regOp(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(7),
	datab => regOp(1),
	datac => regB(7),
	datad => regOp(0),
	combout => \XALU|Mux2~6_combout\);

-- Location: LCCOMB_X46_Y10_N6
\XALU|Mux2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~7_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & (\XALU|Add2~16_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add2~16_combout\,
	datad => \XALU|Mux2~6_combout\,
	combout => \XALU|Mux2~7_combout\);

-- Location: LCCOMB_X46_Y10_N12
\XALU|Mux2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~8_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux2~7_combout\ & (\XALU|Add4~16_combout\)) # (!\XALU|Mux2~7_combout\ & ((\XALU|Mux2~5_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux2~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add4~16_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux2~5_combout\,
	datad => \XALU|Mux2~7_combout\,
	combout => \XALU|Mux2~8_combout\);

-- Location: LCCOMB_X46_Y10_N18
\XALU|Mux2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~9_combout\ = (\XALU|Mux2~3_combout\) # ((\XALU|Mux8~1_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~3_combout\,
	datab => \XALU|Mux2~2_combout\,
	datac => \XALU|Mux8~1_combout\,
	datad => \XALU|Mux2~8_combout\,
	combout => \XALU|Mux2~9_combout\);

-- Location: LCCOMB_X46_Y10_N30
\W[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(7) = (\rst~combout\ & ((GLOBAL(\estado.resultToW~clkctrl_outclk\) & ((\XALU|Mux2~9_combout\))) # (!GLOBAL(\estado.resultToW~clkctrl_outclk\) & (W(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~combout\,
	datab => W(7),
	datac => \estado.resultToW~clkctrl_outclk\,
	datad => \XALU|Mux2~9_combout\,
	combout => W(7));

-- Location: LCCOMB_X46_Y10_N22
\regW[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(7) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (W(7))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regW(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => W(7),
	datac => regW(7),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regW(7));

-- Location: LCCOMB_X48_Y10_N24
\XALU|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & ((regW(7)))) # (!regOp(0) & (regW(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \XALU|Mux0~0_combout\,
	datac => regW(5),
	datad => regW(7),
	combout => \XALU|Mux3~0_combout\);

-- Location: LCCOMB_X47_Y9_N18
\XALU|Mux3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~6_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux3~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux3~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~1_combout\,
	datac => \XALU|Mux3~5_combout\,
	datad => \XALU|Mux3~0_combout\,
	combout => \XALU|Mux3~6_combout\);

-- Location: LCCOMB_X44_Y9_N16
\XALU|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~0_combout\ = (\XALU|Mux0~0_combout\ & ((regOp(0) & (regW(1))) # (!regOp(0) & ((\carryIn~combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux0~0_combout\,
	datab => regOp(0),
	datac => regW(1),
	datad => \carryIn~combout\,
	combout => \XALU|Mux9~0_combout\);

-- Location: LCCOMB_X44_Y9_N26
\XALU|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~1_combout\ = (regOp(0) & ((regB(1)) # ((regOp(1))))) # (!regOp(0) & (((regW(0) & !regOp(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regOp(0),
	datac => regW(0),
	datad => regOp(1),
	combout => \XALU|Mux9~1_combout\);

-- Location: LCCOMB_X45_Y10_N30
\XALU|Mux9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~2_combout\ = (regOp(1) & ((\XALU|Mux9~1_combout\ & ((\XALU|Add1~0_combout\))) # (!\XALU|Mux9~1_combout\ & (\XALU|Add0~0_combout\)))) # (!regOp(1) & (((\XALU|Mux9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Add0~0_combout\,
	datac => \XALU|Add1~0_combout\,
	datad => \XALU|Mux9~1_combout\,
	combout => \XALU|Mux9~2_combout\);

-- Location: LCCOMB_X44_Y9_N12
\XALU|Mux9~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~3_combout\ = (regW(0) & (regOp(1) $ (((regB(1)) # (regOp(0)))))) # (!regW(0) & ((regB(1) & ((regOp(0)) # (regOp(1)))) # (!regB(1) & (regOp(0) & regOp(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regB(1),
	datab => regOp(0),
	datac => regW(0),
	datad => regOp(1),
	combout => \XALU|Mux9~3_combout\);

-- Location: LCCOMB_X47_Y9_N26
\XALU|Mux9~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~4_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\) # ((\XALU|Add2~2_combout\)))) # (!\XALU|Mux2~1_combout\ & (!\XALU|Mux2~0_combout\ & ((\XALU|Mux9~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Add2~2_combout\,
	datad => \XALU|Mux9~3_combout\,
	combout => \XALU|Mux9~4_combout\);

-- Location: LCCOMB_X46_Y10_N16
\XALU|Mux9~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux9~4_combout\ & (\XALU|Add4~2_combout\)) # (!\XALU|Mux9~4_combout\ & ((\XALU|Mux9~2_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux9~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add4~2_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux9~2_combout\,
	datad => \XALU|Mux9~4_combout\,
	combout => \XALU|Mux9~5_combout\);

-- Location: LCCOMB_X47_Y9_N8
\XALU|Mux9~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~6_combout\ = (\XALU|Mux8~1_combout\) # ((\XALU|Mux9~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux9~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~1_combout\,
	datac => \XALU|Mux9~0_combout\,
	datad => \XALU|Mux9~5_combout\,
	combout => \XALU|Mux9~6_combout\);

-- Location: LCCOMB_X47_Y9_N0
\XALU|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~0_combout\ = (\XALU|Mux8~7_combout\) # ((\XALU|Mux6~6_combout\) # ((\XALU|Mux9~6_combout\) # (\XALU|Mux7~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux8~7_combout\,
	datab => \XALU|Mux6~6_combout\,
	datac => \XALU|Mux9~6_combout\,
	datad => \XALU|Mux7~6_combout\,
	combout => \XALU|LessThan0~0_combout\);

-- Location: LCCOMB_X47_Y9_N28
\XALU|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~2_combout\ = (\XALU|LessThan0~1_combout\) # ((\XALU|Mux3~6_combout\) # ((\XALU|Mux2~9_combout\) # (\XALU|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|LessThan0~1_combout\,
	datab => \XALU|Mux3~6_combout\,
	datac => \XALU|Mux2~9_combout\,
	datad => \XALU|LessThan0~0_combout\,
	combout => \XALU|LessThan0~2_combout\);

-- Location: LCCOMB_X47_Y9_N6
\Zout$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Zout$latch~combout\ = (GLOBAL(\Zout~0clkctrl_outclk\) & ((!\XALU|LessThan0~2_combout\))) # (!GLOBAL(\Zout~0clkctrl_outclk\) & (\Zout$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Zout$latch~combout\,
	datac => \Zout~0clkctrl_outclk\,
	datad => \XALU|LessThan0~2_combout\,
	combout => \Zout$latch~combout\);

-- Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(0));

-- Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(1));

-- Location: PIN_U19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(2));

-- Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(3));

-- Location: PIN_T18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(4));

-- Location: PIN_V19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(5));

-- Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(6));

-- Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\valueOutput[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_valueOutput(7));

-- Location: PIN_R18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\carryOut~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_carryOut);

-- Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Zout~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \Zout$latch~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Zout);

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\currentState[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \ALT_INV_estado.moveToRegisters~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_currentState(0));

-- Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\currentState[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \estado.progMemRead~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_currentState(1));
END structure;


