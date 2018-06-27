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

-- DATE "06/27/2018 14:17:22"

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
-- valueOutput[0]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[1]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[2]	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[3]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[4]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[5]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[6]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- valueOutput[7]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- carryOut	=>  Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Zout	=>  Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- currentState[0]	=>  Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- currentState[1]	=>  Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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
SIGNAL \W[0]~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Zout~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \XALU|Add4~4_combout\ : std_logic;
SIGNAL \XALU|Add0~6_combout\ : std_logic;
SIGNAL \XALU|Add0~15\ : std_logic;
SIGNAL \XALU|Add1~15\ : std_logic;
SIGNAL \XALU|Add0~16_combout\ : std_logic;
SIGNAL \XALU|Add1~16_combout\ : std_logic;
SIGNAL \XALU|Mux10~0_combout\ : std_logic;
SIGNAL \XALU|Mux10~1_combout\ : std_logic;
SIGNAL \XALU|Mux10~2_combout\ : std_logic;
SIGNAL \XROM|Mux0~0_combout\ : std_logic;
SIGNAL \XROM|Mux4~0_combout\ : std_logic;
SIGNAL \XALU|Mux1~0_combout\ : std_logic;
SIGNAL \XALU|Mux1~1_combout\ : std_logic;
SIGNAL \CoBuffer~combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
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
SIGNAL \carryIn~0_combout\ : std_logic;
SIGNAL \carryIn~0clkctrl_outclk\ : std_logic;
SIGNAL \estado.moveToRegisters~clkctrl_outclk\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \XROM|Mux1~0_combout\ : std_logic;
SIGNAL \regW[6]~0clkctrl_outclk\ : std_logic;
SIGNAL \XROM|Mux2~0_combout\ : std_logic;
SIGNAL \XALU|Mux8~2_combout\ : std_logic;
SIGNAL \carryIn~combout\ : std_logic;
SIGNAL \W[0]~0_combout\ : std_logic;
SIGNAL \W[0]~0clkctrl_outclk\ : std_logic;
SIGNAL \XROM|Mux3~0_combout\ : std_logic;
SIGNAL \XALU|Mux8~0_combout\ : std_logic;
SIGNAL \XALU|Mux4~0_combout\ : std_logic;
SIGNAL \XALU|Mux2~1_combout\ : std_logic;
SIGNAL \XALU|Mux4~3_combout\ : std_logic;
SIGNAL \XALU|Mux2~0_combout\ : std_logic;
SIGNAL \XALU|Mux8~5_combout\ : std_logic;
SIGNAL \XALU|Add4~1_cout\ : std_logic;
SIGNAL \XALU|Add4~2_combout\ : std_logic;
SIGNAL \XALU|Add0~0_combout\ : std_logic;
SIGNAL \XALU|Mux9~1_combout\ : std_logic;
SIGNAL \XALU|Add1~0_combout\ : std_logic;
SIGNAL \XALU|Mux9~2_combout\ : std_logic;
SIGNAL \XALU|Add2~0_combout\ : std_logic;
SIGNAL \XALU|Mux9~3_combout\ : std_logic;
SIGNAL \XALU|Mux9~4_combout\ : std_logic;
SIGNAL \XALU|Mux9~5_combout\ : std_logic;
SIGNAL \XALU|Mux9~0_combout\ : std_logic;
SIGNAL \XALU|Mux9~6_combout\ : std_logic;
SIGNAL \XALU|Add2~1\ : std_logic;
SIGNAL \XALU|Add2~2_combout\ : std_logic;
SIGNAL \XALU|Mux8~6_combout\ : std_logic;
SIGNAL \XALU|Add0~1\ : std_logic;
SIGNAL \XALU|Add0~2_combout\ : std_logic;
SIGNAL \XALU|Mux8~3_combout\ : std_logic;
SIGNAL \XALU|Add1~1\ : std_logic;
SIGNAL \XALU|Add1~2_combout\ : std_logic;
SIGNAL \XALU|Mux8~4_combout\ : std_logic;
SIGNAL \XALU|Mux8~7_combout\ : std_logic;
SIGNAL \XALU|Mux2~2_combout\ : std_logic;
SIGNAL \XALU|Add4~3\ : std_logic;
SIGNAL \XALU|Add4~5\ : std_logic;
SIGNAL \XALU|Add4~7\ : std_logic;
SIGNAL \XALU|Add4~8_combout\ : std_logic;
SIGNAL \XALU|Mux6~3_combout\ : std_logic;
SIGNAL \XALU|Add2~6_combout\ : std_logic;
SIGNAL \XALU|Mux6~4_combout\ : std_logic;
SIGNAL \XALU|Add1~3\ : std_logic;
SIGNAL \XALU|Add1~5\ : std_logic;
SIGNAL \XALU|Add1~6_combout\ : std_logic;
SIGNAL \XALU|Mux6~1_combout\ : std_logic;
SIGNAL \XALU|Mux6~2_combout\ : std_logic;
SIGNAL \XALU|Mux6~5_combout\ : std_logic;
SIGNAL \XALU|Mux6~0_combout\ : std_logic;
SIGNAL \XALU|Mux6~6_combout\ : std_logic;
SIGNAL \XALU|Mux7~0_combout\ : std_logic;
SIGNAL \XALU|Add2~4_combout\ : std_logic;
SIGNAL \XALU|Add4~6_combout\ : std_logic;
SIGNAL \XALU|Mux7~3_combout\ : std_logic;
SIGNAL \XALU|Add1~4_combout\ : std_logic;
SIGNAL \XALU|Add0~3\ : std_logic;
SIGNAL \XALU|Add0~4_combout\ : std_logic;
SIGNAL \XALU|Mux7~1_combout\ : std_logic;
SIGNAL \XALU|Mux7~2_combout\ : std_logic;
SIGNAL \XALU|Mux7~4_combout\ : std_logic;
SIGNAL \XALU|Mux7~5_combout\ : std_logic;
SIGNAL \XALU|Mux7~6_combout\ : std_logic;
SIGNAL \XALU|Mux8~1_combout\ : std_logic;
SIGNAL \XALU|Mux8~8_combout\ : std_logic;
SIGNAL \XALU|Add2~3\ : std_logic;
SIGNAL \XALU|Add2~5\ : std_logic;
SIGNAL \XALU|Add2~7\ : std_logic;
SIGNAL \XALU|Add2~9\ : std_logic;
SIGNAL \XALU|Add2~10_combout\ : std_logic;
SIGNAL \XALU|Mux4~4_combout\ : std_logic;
SIGNAL \XALU|Add4~9\ : std_logic;
SIGNAL \XALU|Add4~11\ : std_logic;
SIGNAL \XALU|Add4~12_combout\ : std_logic;
SIGNAL \XALU|Mux5~0_combout\ : std_logic;
SIGNAL \XALU|Add4~10_combout\ : std_logic;
SIGNAL \XALU|Add2~8_combout\ : std_logic;
SIGNAL \XALU|Mux5~3_combout\ : std_logic;
SIGNAL \XALU|Add0~5\ : std_logic;
SIGNAL \XALU|Add0~7\ : std_logic;
SIGNAL \XALU|Add0~8_combout\ : std_logic;
SIGNAL \XALU|Mux5~1_combout\ : std_logic;
SIGNAL \XALU|Add1~7\ : std_logic;
SIGNAL \XALU|Add1~8_combout\ : std_logic;
SIGNAL \XALU|Mux5~2_combout\ : std_logic;
SIGNAL \XALU|Mux5~4_combout\ : std_logic;
SIGNAL \XALU|Mux5~5_combout\ : std_logic;
SIGNAL \XALU|Mux5~6_combout\ : std_logic;
SIGNAL \XALU|Add1~9\ : std_logic;
SIGNAL \XALU|Add1~10_combout\ : std_logic;
SIGNAL \XALU|Add0~9\ : std_logic;
SIGNAL \XALU|Add0~10_combout\ : std_logic;
SIGNAL \XALU|Mux4~1_combout\ : std_logic;
SIGNAL \XALU|Mux4~2_combout\ : std_logic;
SIGNAL \XALU|Mux4~5_combout\ : std_logic;
SIGNAL \XALU|Mux4~6_combout\ : std_logic;
SIGNAL \XALU|Mux3~0_combout\ : std_logic;
SIGNAL \XALU|Add2~11\ : std_logic;
SIGNAL \XALU|Add2~12_combout\ : std_logic;
SIGNAL \XALU|Mux3~3_combout\ : std_logic;
SIGNAL \XALU|Add1~11\ : std_logic;
SIGNAL \XALU|Add1~12_combout\ : std_logic;
SIGNAL \XALU|Add0~11\ : std_logic;
SIGNAL \XALU|Add0~12_combout\ : std_logic;
SIGNAL \XALU|Mux3~1_combout\ : std_logic;
SIGNAL \XALU|Mux3~2_combout\ : std_logic;
SIGNAL \XALU|Mux3~4_combout\ : std_logic;
SIGNAL \XALU|Add4~13\ : std_logic;
SIGNAL \XALU|Add4~14_combout\ : std_logic;
SIGNAL \XALU|Mux3~5_combout\ : std_logic;
SIGNAL \XALU|Mux3~6_combout\ : std_logic;
SIGNAL \XALU|Mux2~3_combout\ : std_logic;
SIGNAL \XALU|Add4~15\ : std_logic;
SIGNAL \XALU|Add4~16_combout\ : std_logic;
SIGNAL \XALU|Add2~13\ : std_logic;
SIGNAL \XALU|Add2~14_combout\ : std_logic;
SIGNAL \XALU|Mux2~6_combout\ : std_logic;
SIGNAL \XALU|Mux2~7_combout\ : std_logic;
SIGNAL \XALU|Add1~13\ : std_logic;
SIGNAL \XALU|Add1~14_combout\ : std_logic;
SIGNAL \XALU|Add0~13\ : std_logic;
SIGNAL \XALU|Add0~14_combout\ : std_logic;
SIGNAL \XALU|Mux2~4_combout\ : std_logic;
SIGNAL \XALU|Mux2~5_combout\ : std_logic;
SIGNAL \XALU|Mux2~8_combout\ : std_logic;
SIGNAL \XALU|Mux2~9_combout\ : std_logic;
SIGNAL \XALU|LessThan0~0_combout\ : std_logic;
SIGNAL \XALU|LessThan0~1_combout\ : std_logic;
SIGNAL \XALU|LessThan0~2_combout\ : std_logic;
SIGNAL \Zout$latch~combout\ : std_logic;
SIGNAL regW : std_logic_vector(7 DOWNTO 0);
SIGNAL regS : std_logic_vector(3 DOWNTO 0);
SIGNAL regOp : std_logic_vector(3 DOWNTO 0);
SIGNAL regAddress : std_logic_vector(3 DOWNTO 0);
SIGNAL W : std_logic_vector(7 DOWNTO 0);
SIGNAL PC : std_logic_vector(3 DOWNTO 0);
SIGNAL IR : std_logic_vector(13 DOWNTO 0);
SIGNAL \XALU|preR\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ALT_INV_clk~combout\ : std_logic;
SIGNAL \ALT_INV_rst~combout\ : std_logic;
SIGNAL \ALT_INV_estado.moveToRegisters~regout\ : std_logic;

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

\W[0]~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \W[0]~0_combout\);

\Zout~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Zout~0_combout\);
\ALT_INV_clk~combout\ <= NOT \clk~combout\;
\ALT_INV_rst~combout\ <= NOT \rst~combout\;
\ALT_INV_estado.moveToRegisters~regout\ <= NOT \estado.moveToRegisters~regout\;

-- Location: LCCOMB_X45_Y11_N4
\XALU|Add4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~4_combout\ = (regW(1) & ((GND) # (!\XALU|Add4~3\))) # (!regW(1) & (\XALU|Add4~3\ $ (GND)))
-- \XALU|Add4~5\ = CARRY((regW(1)) # (!\XALU|Add4~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(1),
	datad => VCC,
	cin => \XALU|Add4~3\,
	combout => \XALU|Add4~4_combout\,
	cout => \XALU|Add4~5\);

-- Location: LCCOMB_X47_Y11_N20
\XALU|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~6_combout\ = (regW(3) & (!\XALU|Add0~5\)) # (!regW(3) & ((\XALU|Add0~5\) # (GND)))
-- \XALU|Add0~7\ = CARRY((!\XALU|Add0~5\) # (!regW(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(3),
	datad => VCC,
	cin => \XALU|Add0~5\,
	combout => \XALU|Add0~6_combout\,
	cout => \XALU|Add0~7\);

-- Location: LCCOMB_X47_Y11_N28
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

-- Location: LCCOMB_X48_Y11_N18
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

-- Location: LCCOMB_X47_Y11_N30
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

-- Location: LCCOMB_X48_Y11_N20
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

-- Location: LCCOMB_X44_Y10_N18
\XALU|Mux10~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~0_combout\ = (regOp(3) & (\XALU|preR\(8) & (regOp(2) $ (regOp(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(2),
	datab => regOp(3),
	datac => regOp(1),
	datad => \XALU|preR\(8),
	combout => \XALU|Mux10~0_combout\);

-- Location: LCCOMB_X45_Y11_N22
\XALU|Mux10~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~1_combout\ = (regOp(0) & ((regW(0)))) # (!regOp(0) & (regW(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(7),
	datac => regW(0),
	datad => regOp(0),
	combout => \XALU|Mux10~1_combout\);

-- Location: LCCOMB_X44_Y10_N26
\XALU|Mux10~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux10~2_combout\ = (\XALU|Mux10~0_combout\) # ((\XALU|Mux10~1_combout\ & \XALU|Mux8~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux10~1_combout\,
	datab => \XALU|Mux8~0_combout\,
	datad => \XALU|Mux10~0_combout\,
	combout => \XALU|Mux10~2_combout\);

-- Location: LCCOMB_X49_Y11_N14
\XROM|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux0~0_combout\ = (regAddress(1) & ((regAddress(2) & ((regAddress(3)))) # (!regAddress(2) & ((regAddress(0)) # (!regAddress(3)))))) # (!regAddress(1) & ((regAddress(3)) # ((!regAddress(0) & regAddress(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux0~0_combout\);

-- Location: LCCOMB_X49_Y11_N26
\XROM|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux4~0_combout\ = (!regAddress(0) & (!regAddress(3) & ((regAddress(1)) # (regAddress(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux4~0_combout\);

-- Location: LCCOMB_X48_Y11_N26
\XALU|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux1~0_combout\ = (!regOp(2) & ((regOp(0) & ((!\XALU|Add1~16_combout\))) # (!regOp(0) & (\XALU|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(2),
	datab => regOp(0),
	datac => \XALU|Add0~16_combout\,
	datad => \XALU|Add1~16_combout\,
	combout => \XALU|Mux1~0_combout\);

-- Location: LCCOMB_X48_Y11_N0
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

-- Location: LCCOMB_X44_Y10_N8
CoBuffer : cycloneii_lcell_comb
-- Equation(s):
-- \CoBuffer~combout\ = (GLOBAL(\Zout~0clkctrl_outclk\) & (\XALU|Mux10~2_combout\)) # (!GLOBAL(\Zout~0clkctrl_outclk\) & ((\CoBuffer~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XALU|Mux10~2_combout\,
	datac => \CoBuffer~combout\,
	datad => \Zout~0clkctrl_outclk\,
	combout => \CoBuffer~combout\);

-- Location: LCCOMB_X49_Y10_N24
\IR[11]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(11) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (!\XROM|Mux0~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XROM|Mux0~0_combout\,
	datac => IR(11),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(11));

-- Location: LCCOMB_X48_Y11_N2
\XALU|preR[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|preR\(8) = (\XALU|Mux8~0_combout\ & (\XALU|preR\(8))) # (!\XALU|Mux8~0_combout\ & ((\XALU|Mux1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XALU|Mux8~0_combout\,
	datac => \XALU|preR\(8),
	datad => \XALU|Mux1~1_combout\,
	combout => \XALU|preR\(8));

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

-- Location: LCCOMB_X49_Y10_N20
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

-- Location: LCCOMB_X49_Y10_N2
\estado.progMemRead~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \estado.progMemRead~0_combout\ = !\prox_estado.progMemRead_594~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \prox_estado.progMemRead_594~combout\,
	combout => \estado.progMemRead~0_combout\);

-- Location: LCFF_X49_Y10_N3
\estado.progMemRead\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	datain => \estado.progMemRead~0_combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.progMemRead~regout\);

-- Location: LCCOMB_X49_Y10_N4
\prox_estado.moveToRegisters_588\ : cycloneii_lcell_comb
-- Equation(s):
-- \prox_estado.moveToRegisters_588~combout\ = (\rst~combout\ & ((!\estado.progMemRead~regout\))) # (!\rst~combout\ & (\prox_estado.moveToRegisters_588~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \prox_estado.moveToRegisters_588~combout\,
	datab => \rst~combout\,
	datad => \estado.progMemRead~regout\,
	combout => \prox_estado.moveToRegisters_588~combout\);

-- Location: LCFF_X49_Y10_N5
\estado.moveToRegisters\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	datain => \prox_estado.moveToRegisters_588~combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.moveToRegisters~regout\);

-- Location: LCCOMB_X49_Y10_N18
\prox_estado.resultToW_582\ : cycloneii_lcell_comb
-- Equation(s):
-- \prox_estado.resultToW_582~combout\ = (\rst~combout\ & (\estado.moveToRegisters~regout\)) # (!\rst~combout\ & ((\prox_estado.resultToW_582~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \estado.moveToRegisters~regout\,
	datac => \rst~combout\,
	datad => \prox_estado.resultToW_582~combout\,
	combout => \prox_estado.resultToW_582~combout\);

-- Location: LCFF_X49_Y10_N19
\estado.resultToW\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~combout\,
	datain => \prox_estado.resultToW_582~combout\,
	aclr => \ALT_INV_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \estado.resultToW~regout\);

-- Location: LCCOMB_X49_Y10_N28
\Zout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Zout~0_combout\ = (\rst~combout\ & \estado.resultToW~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rst~combout\,
	datad => \estado.resultToW~regout\,
	combout => \Zout~0_combout\);

-- Location: CLKCTRL_G7
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

-- Location: LCCOMB_X49_Y10_N16
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

-- Location: LCCOMB_X49_Y10_N30
\carryIn~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \carryIn~0_combout\ = (\rst~combout\ & !\estado.progMemRead~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~combout\,
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

-- Location: CLKCTRL_G15
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

-- Location: LCCOMB_X49_Y11_N0
\PC[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(0) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (!regAddress(0))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((PC(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => PC(0),
	datac => \estado.moveToRegisters~clkctrl_outclk\,
	datad => \rst~combout\,
	combout => PC(0));

-- Location: LCCOMB_X49_Y11_N8
\regAddress[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(0) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((PC(0)))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (regAddress(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(0),
	datac => \carryIn~0clkctrl_outclk\,
	datad => PC(0),
	combout => regAddress(0));

-- Location: LCCOMB_X49_Y11_N10
\Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = regAddress(0) $ (regAddress(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => regAddress(0),
	datad => regAddress(1),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X49_Y11_N6
\PC[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(1) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~0_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PC(1),
	datab => \rst~combout\,
	datac => \estado.moveToRegisters~clkctrl_outclk\,
	datad => \Add0~0_combout\,
	combout => PC(1));

-- Location: LCCOMB_X49_Y11_N2
\regAddress[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(1) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((PC(1)))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (regAddress(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(1),
	datac => \carryIn~0clkctrl_outclk\,
	datad => PC(1),
	combout => regAddress(1));

-- Location: LCCOMB_X49_Y11_N28
\Add0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = regAddress(2) $ (((regAddress(0) & regAddress(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(0),
	datac => regAddress(2),
	datad => regAddress(1),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X49_Y11_N12
\PC[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(2) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~1_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => PC(2),
	datab => \estado.moveToRegisters~clkctrl_outclk\,
	datac => \rst~combout\,
	datad => \Add0~1_combout\,
	combout => PC(2));

-- Location: LCCOMB_X49_Y11_N16
\regAddress[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(2) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((PC(2)))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (regAddress(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(2),
	datac => \carryIn~0clkctrl_outclk\,
	datad => PC(2),
	combout => regAddress(2));

-- Location: LCCOMB_X49_Y11_N22
\Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = regAddress(3) $ (((regAddress(1) & (regAddress(0) & regAddress(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(1),
	datab => regAddress(0),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \Add0~2_combout\);

-- Location: LCCOMB_X49_Y11_N18
\PC[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- PC(3) = (\rst~combout\ & ((GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & ((\Add0~2_combout\))) # (!GLOBAL(\estado.moveToRegisters~clkctrl_outclk\) & (PC(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \estado.moveToRegisters~clkctrl_outclk\,
	datab => PC(3),
	datac => \rst~combout\,
	datad => \Add0~2_combout\,
	combout => PC(3));

-- Location: LCCOMB_X49_Y11_N30
\regAddress[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regAddress(3) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((PC(3)))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (regAddress(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regAddress(3),
	datac => \carryIn~0clkctrl_outclk\,
	datad => PC(3),
	combout => regAddress(3));

-- Location: LCCOMB_X49_Y11_N20
\XROM|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux1~0_combout\ = (regAddress(1) & (((!regAddress(3))))) # (!regAddress(1) & ((regAddress(2) & ((!regAddress(3)))) # (!regAddress(2) & ((regAddress(0)) # (regAddress(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux1~0_combout\);

-- Location: LCCOMB_X44_Y10_N14
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

-- Location: CLKCTRL_G6
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

-- Location: LCCOMB_X44_Y10_N10
\regS[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(2) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (IR(10))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(10),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => regS(2),
	combout => regS(2));

-- Location: LCCOMB_X44_Y10_N22
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

-- Location: LCCOMB_X49_Y11_N4
\XROM|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux2~0_combout\ = (regAddress(0) & (regAddress(1) & (!regAddress(2) & !regAddress(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux2~0_combout\);

-- Location: LCCOMB_X45_Y10_N22
\IR[9]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(9) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((\XROM|Mux2~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(9),
	datac => \XROM|Mux2~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(9));

-- Location: LCCOMB_X45_Y10_N26
\regS[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(9)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regS(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regS(1),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(9),
	combout => regS(1));

-- Location: LCCOMB_X45_Y10_N0
\regOp[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regOp(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(1)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(1),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => regS(1),
	combout => regOp(1));

-- Location: LCCOMB_X45_Y10_N24
\XALU|Mux8~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~2_combout\ = (regOp(3) & (regOp(2) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(3),
	datab => regOp(2),
	datad => regOp(1),
	combout => \XALU|Mux8~2_combout\);

-- Location: LCCOMB_X45_Y10_N14
carryIn : cycloneii_lcell_comb
-- Equation(s):
-- \carryIn~combout\ = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\CoBuffer~combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((\carryIn~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CoBuffer~combout\,
	datac => \carryIn~combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => \carryIn~combout\);

-- Location: LCCOMB_X49_Y10_N8
\IR[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(7) = (GLOBAL(\carryIn~0clkctrl_outclk\) & (\XROM|Mux4~0_combout\)) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & ((IR(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XROM|Mux4~0_combout\,
	datac => IR(7),
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(7));

-- Location: LCCOMB_X49_Y10_N12
\W[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \W[0]~0_combout\ = (!IR(7) & \estado.resultToW~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => IR(7),
	datad => \estado.resultToW~regout\,
	combout => \W[0]~0_combout\);

-- Location: CLKCTRL_G4
\W[0]~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \W[0]~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \W[0]~0clkctrl_outclk\);

-- Location: LCCOMB_X48_Y10_N30
\W[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(7) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux2~9_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \W[0]~0clkctrl_outclk\,
	datab => W(7),
	datac => \XALU|Mux2~9_combout\,
	datad => \rst~combout\,
	combout => W(7));

-- Location: LCCOMB_X48_Y10_N18
\regW[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(7) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(7)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(7),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => W(7),
	combout => regW(7));

-- Location: LCCOMB_X49_Y11_N24
\XROM|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XROM|Mux3~0_combout\ = (regAddress(0)) # ((regAddress(2) & ((regAddress(3)) # (!regAddress(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regAddress(0),
	datab => regAddress(1),
	datac => regAddress(2),
	datad => regAddress(3),
	combout => \XROM|Mux3~0_combout\);

-- Location: LCCOMB_X45_Y10_N2
\IR[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- IR(8) = (GLOBAL(\carryIn~0clkctrl_outclk\) & ((!\XROM|Mux3~0_combout\))) # (!GLOBAL(\carryIn~0clkctrl_outclk\) & (IR(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => IR(8),
	datac => \XROM|Mux3~0_combout\,
	datad => \carryIn~0clkctrl_outclk\,
	combout => IR(8));

-- Location: LCCOMB_X45_Y10_N28
\regS[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(0) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((IR(8)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regS(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regS(0),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => IR(8),
	combout => regS(0));

-- Location: LCCOMB_X45_Y10_N8
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

-- Location: LCCOMB_X49_Y10_N10
\regS[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regS(3) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & (IR(11))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & ((regS(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => IR(11),
	datac => regS(3),
	datad => \regW[6]~0clkctrl_outclk\,
	combout => regS(3));

-- Location: LCCOMB_X49_Y10_N6
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

-- Location: LCCOMB_X44_Y10_N0
\XALU|Mux8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~0_combout\ = (!regOp(2) & (regOp(1) & !regOp(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(2),
	datac => regOp(1),
	datad => regOp(3),
	combout => \XALU|Mux8~0_combout\);

-- Location: LCCOMB_X44_Y10_N20
\XALU|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & ((regW(6)))) # (!regOp(0) & (regW(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datab => regW(6),
	datac => regOp(0),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux4~0_combout\);

-- Location: LCCOMB_X45_Y10_N6
\XALU|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~1_combout\ = (regOp(2) & regOp(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(2),
	datad => regOp(3),
	combout => \XALU|Mux2~1_combout\);

-- Location: LCCOMB_X46_Y10_N30
\XALU|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~3_combout\ = (regOp(1) & (regOp(0) $ (regW(5)))) # (!regOp(1) & (regOp(0) & regW(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100001101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => regW(5),
	combout => \XALU|Mux4~3_combout\);

-- Location: LCCOMB_X45_Y10_N20
\XALU|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~0_combout\ = (regOp(3) & ((regOp(0)) # (!regOp(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(2),
	datac => regOp(0),
	datad => regOp(3),
	combout => \XALU|Mux2~0_combout\);

-- Location: LCCOMB_X46_Y11_N24
\XALU|Mux8~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~5_combout\ = (regOp(0) & (regW(1) $ (regOp(1)))) # (!regOp(0) & (regW(1) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datac => regW(1),
	datad => regOp(1),
	combout => \XALU|Mux8~5_combout\);

-- Location: LCCOMB_X45_Y11_N0
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

-- Location: LCCOMB_X45_Y11_N2
\XALU|Add4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~2_combout\ = (regW(0) & (\XALU|Add4~1_cout\ & VCC)) # (!regW(0) & (!\XALU|Add4~1_cout\))
-- \XALU|Add4~3\ = CARRY((!regW(0) & !\XALU|Add4~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(0),
	datad => VCC,
	cin => \XALU|Add4~1_cout\,
	combout => \XALU|Add4~2_combout\,
	cout => \XALU|Add4~3\);

-- Location: LCCOMB_X47_Y11_N14
\XALU|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~0_combout\ = regW(0) $ (VCC)
-- \XALU|Add0~1\ = CARRY(regW(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(0),
	datad => VCC,
	combout => \XALU|Add0~0_combout\,
	cout => \XALU|Add0~1\);

-- Location: LCCOMB_X48_Y10_N4
\XALU|Mux9~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~1_combout\ = (!regOp(0) & ((regOp(1) & (\XALU|Add0~0_combout\)) # (!regOp(1) & ((regW(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \XALU|Add0~0_combout\,
	datac => regW(0),
	datad => regOp(1),
	combout => \XALU|Mux9~1_combout\);

-- Location: LCCOMB_X48_Y11_N4
\XALU|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~0_combout\ = regW(0) $ (VCC)
-- \XALU|Add1~1\ = CARRY(regW(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(0),
	datad => VCC,
	combout => \XALU|Add1~0_combout\,
	cout => \XALU|Add1~1\);

-- Location: LCCOMB_X48_Y10_N14
\XALU|Mux9~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~2_combout\ = (\XALU|Mux9~1_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Mux9~1_combout\,
	datad => \XALU|Add1~0_combout\,
	combout => \XALU|Mux9~2_combout\);

-- Location: LCCOMB_X46_Y10_N0
\XALU|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~0_combout\ = (\carryIn~combout\ & (regW(0) $ (VCC))) # (!\carryIn~combout\ & (regW(0) & VCC))
-- \XALU|Add2~1\ = CARRY((\carryIn~combout\ & regW(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \carryIn~combout\,
	datab => regW(0),
	datad => VCC,
	combout => \XALU|Add2~0_combout\,
	cout => \XALU|Add2~1\);

-- Location: LCCOMB_X48_Y10_N12
\XALU|Mux9~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~3_combout\ = (regOp(0) & (regW(0) $ (regOp(1)))) # (!regOp(0) & (regW(0) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(0),
	datac => regW(0),
	datad => regOp(1),
	combout => \XALU|Mux9~3_combout\);

-- Location: LCCOMB_X48_Y10_N6
\XALU|Mux9~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~4_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & (\XALU|Add2~0_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux9~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add2~0_combout\,
	datad => \XALU|Mux9~3_combout\,
	combout => \XALU|Mux9~4_combout\);

-- Location: LCCOMB_X48_Y10_N24
\XALU|Mux9~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux9~4_combout\ & (\XALU|Add4~2_combout\)) # (!\XALU|Mux9~4_combout\ & ((\XALU|Mux9~2_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux9~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Add4~2_combout\,
	datac => \XALU|Mux9~2_combout\,
	datad => \XALU|Mux9~4_combout\,
	combout => \XALU|Mux9~5_combout\);

-- Location: LCCOMB_X44_Y10_N12
\XALU|Mux9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & ((regW(1)))) # (!regOp(0) & (\carryIn~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \carryIn~combout\,
	datac => regW(1),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux9~0_combout\);

-- Location: LCCOMB_X48_Y10_N26
\XALU|Mux9~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux9~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux9~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux9~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux9~5_combout\,
	datad => \XALU|Mux9~0_combout\,
	combout => \XALU|Mux9~6_combout\);

-- Location: LCCOMB_X48_Y10_N0
\W[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(0) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux9~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(0),
	datab => \XALU|Mux9~6_combout\,
	datac => \rst~combout\,
	datad => \W[0]~0clkctrl_outclk\,
	combout => W(0));

-- Location: LCCOMB_X47_Y11_N8
\regW[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(0) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(0)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(0),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => W(0),
	combout => regW(0));

-- Location: LCCOMB_X46_Y10_N2
\XALU|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~2_combout\ = (regW(1) & (!\XALU|Add2~1\)) # (!regW(1) & ((\XALU|Add2~1\) # (GND)))
-- \XALU|Add2~3\ = CARRY((!\XALU|Add2~1\) # (!regW(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(1),
	datad => VCC,
	cin => \XALU|Add2~1\,
	combout => \XALU|Add2~2_combout\,
	cout => \XALU|Add2~3\);

-- Location: LCCOMB_X46_Y11_N14
\XALU|Mux8~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~6_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\) # ((\XALU|Add2~2_combout\)))) # (!\XALU|Mux2~1_combout\ & (!\XALU|Mux2~0_combout\ & (\XALU|Mux8~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux8~5_combout\,
	datad => \XALU|Add2~2_combout\,
	combout => \XALU|Mux8~6_combout\);

-- Location: LCCOMB_X47_Y11_N16
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

-- Location: LCCOMB_X46_Y11_N8
\XALU|Mux8~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~3_combout\ = (!regOp(0) & ((regOp(1) & ((\XALU|Add0~2_combout\))) # (!regOp(1) & (regW(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(1),
	datac => \XALU|Add0~2_combout\,
	datad => regOp(1),
	combout => \XALU|Mux8~3_combout\);

-- Location: LCCOMB_X48_Y11_N6
\XALU|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add1~2_combout\ = (regW(1) & (\XALU|Add1~1\ & VCC)) # (!regW(1) & (!\XALU|Add1~1\))
-- \XALU|Add1~3\ = CARRY((!regW(1) & !\XALU|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(1),
	datad => VCC,
	cin => \XALU|Add1~1\,
	combout => \XALU|Add1~2_combout\,
	cout => \XALU|Add1~3\);

-- Location: LCCOMB_X46_Y11_N30
\XALU|Mux8~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~4_combout\ = (\XALU|Mux8~3_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Mux8~3_combout\,
	datad => \XALU|Add1~2_combout\,
	combout => \XALU|Mux8~4_combout\);

-- Location: LCCOMB_X46_Y11_N16
\XALU|Mux8~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~7_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux8~6_combout\ & (\XALU|Add4~4_combout\)) # (!\XALU|Mux8~6_combout\ & ((\XALU|Mux8~4_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux8~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add4~4_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux8~6_combout\,
	datad => \XALU|Mux8~4_combout\,
	combout => \XALU|Mux8~7_combout\);

-- Location: LCCOMB_X44_Y10_N16
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

-- Location: LCCOMB_X45_Y11_N6
\XALU|Add4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~6_combout\ = (regW(2) & (\XALU|Add4~5\ & VCC)) # (!regW(2) & (!\XALU|Add4~5\))
-- \XALU|Add4~7\ = CARRY((!regW(2) & !\XALU|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datad => VCC,
	cin => \XALU|Add4~5\,
	combout => \XALU|Add4~6_combout\,
	cout => \XALU|Add4~7\);

-- Location: LCCOMB_X45_Y11_N8
\XALU|Add4~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~8_combout\ = (regW(3) & ((GND) # (!\XALU|Add4~7\))) # (!regW(3) & (\XALU|Add4~7\ $ (GND)))
-- \XALU|Add4~9\ = CARRY((regW(3)) # (!\XALU|Add4~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(3),
	datad => VCC,
	cin => \XALU|Add4~7\,
	combout => \XALU|Add4~8_combout\,
	cout => \XALU|Add4~9\);

-- Location: LCCOMB_X48_Y10_N16
\XALU|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~3_combout\ = (regW(3) & (regOp(0) $ (regOp(1)))) # (!regW(3) & (regOp(0) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datac => regOp(0),
	datad => regOp(1),
	combout => \XALU|Mux6~3_combout\);

-- Location: LCCOMB_X46_Y10_N6
\XALU|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~6_combout\ = (regW(3) & (!\XALU|Add2~5\)) # (!regW(3) & ((\XALU|Add2~5\) # (GND)))
-- \XALU|Add2~7\ = CARRY((!\XALU|Add2~5\) # (!regW(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datad => VCC,
	cin => \XALU|Add2~5\,
	combout => \XALU|Add2~6_combout\,
	cout => \XALU|Add2~7\);

-- Location: LCCOMB_X48_Y10_N10
\XALU|Mux6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~4_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & ((\XALU|Add2~6_combout\))) # (!\XALU|Mux2~1_combout\ & (\XALU|Mux6~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Mux6~3_combout\,
	datad => \XALU|Add2~6_combout\,
	combout => \XALU|Mux6~4_combout\);

-- Location: LCCOMB_X48_Y11_N8
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

-- Location: LCCOMB_X48_Y11_N10
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

-- Location: LCCOMB_X47_Y11_N12
\XALU|Mux6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~1_combout\ = (!regOp(0) & ((regOp(1) & (\XALU|Add0~6_combout\)) # (!regOp(1) & ((regW(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Add0~6_combout\,
	datab => regW(3),
	datac => regOp(1),
	datad => regOp(0),
	combout => \XALU|Mux6~1_combout\);

-- Location: LCCOMB_X47_Y11_N10
\XALU|Mux6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~2_combout\ = (\XALU|Mux6~1_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Add1~6_combout\,
	datad => \XALU|Mux6~1_combout\,
	combout => \XALU|Mux6~2_combout\);

-- Location: LCCOMB_X47_Y10_N8
\XALU|Mux6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~5_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux6~4_combout\ & (\XALU|Add4~8_combout\)) # (!\XALU|Mux6~4_combout\ & ((\XALU|Mux6~2_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux6~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Add4~8_combout\,
	datac => \XALU|Mux6~4_combout\,
	datad => \XALU|Mux6~2_combout\,
	combout => \XALU|Mux6~5_combout\);

-- Location: LCCOMB_X44_Y10_N28
\XALU|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & (regW(4))) # (!regOp(0) & ((regW(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datab => regW(2),
	datac => regOp(0),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux6~0_combout\);

-- Location: LCCOMB_X47_Y10_N26
\XALU|Mux6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux6~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux6~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux6~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux6~5_combout\,
	datad => \XALU|Mux6~0_combout\,
	combout => \XALU|Mux6~6_combout\);

-- Location: LCCOMB_X47_Y10_N30
\W[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(3) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux6~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(3),
	datab => \W[0]~0clkctrl_outclk\,
	datac => \rst~combout\,
	datad => \XALU|Mux6~6_combout\,
	combout => W(3));

-- Location: LCCOMB_X47_Y10_N24
\regW[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(3) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(3)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(3),
	datab => \regW[6]~0clkctrl_outclk\,
	datad => W(3),
	combout => regW(3));

-- Location: LCCOMB_X45_Y11_N20
\XALU|Mux7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & ((regW(3)))) # (!regOp(0) & (regW(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(1),
	datac => \XALU|Mux8~0_combout\,
	datad => regW(3),
	combout => \XALU|Mux7~0_combout\);

-- Location: LCCOMB_X46_Y10_N4
\XALU|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~4_combout\ = (regW(2) & (\XALU|Add2~3\ $ (GND))) # (!regW(2) & (!\XALU|Add2~3\ & VCC))
-- \XALU|Add2~5\ = CARRY((regW(2) & !\XALU|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(2),
	datad => VCC,
	cin => \XALU|Add2~3\,
	combout => \XALU|Add2~4_combout\,
	cout => \XALU|Add2~5\);

-- Location: LCCOMB_X46_Y11_N20
\XALU|Mux7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~3_combout\ = (regOp(0) & (regW(2) $ (regOp(1)))) # (!regOp(0) & (regW(2) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datac => regW(2),
	datad => regOp(1),
	combout => \XALU|Mux7~3_combout\);

-- Location: LCCOMB_X47_Y11_N18
\XALU|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add0~4_combout\ = (regW(2) & (\XALU|Add0~3\ $ (GND))) # (!regW(2) & (!\XALU|Add0~3\ & VCC))
-- \XALU|Add0~5\ = CARRY((regW(2) & !\XALU|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(2),
	datad => VCC,
	cin => \XALU|Add0~3\,
	combout => \XALU|Add0~4_combout\,
	cout => \XALU|Add0~5\);

-- Location: LCCOMB_X46_Y11_N0
\XALU|Mux7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~1_combout\ = (!regOp(0) & ((regOp(1) & (\XALU|Add0~4_combout\)) # (!regOp(1) & ((regW(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \XALU|Add0~4_combout\,
	datac => regOp(1),
	datad => regW(2),
	combout => \XALU|Mux7~1_combout\);

-- Location: LCCOMB_X46_Y11_N6
\XALU|Mux7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~2_combout\ = (\XALU|Mux7~1_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Add1~4_combout\,
	datad => \XALU|Mux7~1_combout\,
	combout => \XALU|Mux7~2_combout\);

-- Location: LCCOMB_X46_Y11_N10
\XALU|Mux7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~4_combout\ = (\XALU|Mux2~1_combout\ & (\XALU|Mux2~0_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\ & ((\XALU|Mux7~2_combout\))) # (!\XALU|Mux2~0_combout\ & (\XALU|Mux7~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux7~3_combout\,
	datad => \XALU|Mux7~2_combout\,
	combout => \XALU|Mux7~4_combout\);

-- Location: LCCOMB_X46_Y11_N12
\XALU|Mux7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~5_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux7~4_combout\ & ((\XALU|Add4~6_combout\))) # (!\XALU|Mux7~4_combout\ & (\XALU|Add2~4_combout\)))) # (!\XALU|Mux2~1_combout\ & (((\XALU|Mux7~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Add2~4_combout\,
	datac => \XALU|Add4~6_combout\,
	datad => \XALU|Mux7~4_combout\,
	combout => \XALU|Mux7~5_combout\);

-- Location: LCCOMB_X46_Y11_N18
\XALU|Mux7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux7~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux7~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux7~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux8~2_combout\,
	datab => \XALU|Mux2~2_combout\,
	datac => \XALU|Mux7~0_combout\,
	datad => \XALU|Mux7~5_combout\,
	combout => \XALU|Mux7~6_combout\);

-- Location: LCCOMB_X46_Y11_N28
\W[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(2) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux7~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(2),
	datab => \XALU|Mux7~6_combout\,
	datac => \rst~combout\,
	datad => \W[0]~0clkctrl_outclk\,
	combout => W(2));

-- Location: LCCOMB_X46_Y11_N4
\regW[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(2) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(2)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(2),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => W(2),
	combout => regW(2));

-- Location: LCCOMB_X45_Y11_N18
\XALU|Mux8~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~1_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & (regW(2))) # (!regOp(0) & ((regW(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(2),
	datac => \XALU|Mux8~0_combout\,
	datad => regW(0),
	combout => \XALU|Mux8~1_combout\);

-- Location: LCCOMB_X46_Y11_N22
\XALU|Mux8~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux8~8_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux8~1_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux8~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux8~7_combout\,
	datad => \XALU|Mux8~1_combout\,
	combout => \XALU|Mux8~8_combout\);

-- Location: LCCOMB_X46_Y11_N26
\W[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(1) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux8~8_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(1),
	datab => \XALU|Mux8~8_combout\,
	datac => \rst~combout\,
	datad => \W[0]~0clkctrl_outclk\,
	combout => W(1));

-- Location: LCCOMB_X46_Y11_N2
\regW[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(1) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(1)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(1),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => W(1),
	combout => regW(1));

-- Location: LCCOMB_X46_Y10_N8
\XALU|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~8_combout\ = (regW(4) & (\XALU|Add2~7\ $ (GND))) # (!regW(4) & (!\XALU|Add2~7\ & VCC))
-- \XALU|Add2~9\ = CARRY((regW(4) & !\XALU|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datad => VCC,
	cin => \XALU|Add2~7\,
	combout => \XALU|Add2~8_combout\,
	cout => \XALU|Add2~9\);

-- Location: LCCOMB_X46_Y10_N10
\XALU|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~10_combout\ = (regW(5) & (!\XALU|Add2~9\)) # (!regW(5) & ((\XALU|Add2~9\) # (GND)))
-- \XALU|Add2~11\ = CARRY((!\XALU|Add2~9\) # (!regW(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(5),
	datad => VCC,
	cin => \XALU|Add2~9\,
	combout => \XALU|Add2~10_combout\,
	cout => \XALU|Add2~11\);

-- Location: LCCOMB_X47_Y10_N22
\XALU|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~4_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & ((\XALU|Add2~10_combout\))) # (!\XALU|Mux2~1_combout\ & (\XALU|Mux4~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Mux4~3_combout\,
	datad => \XALU|Add2~10_combout\,
	combout => \XALU|Mux4~4_combout\);

-- Location: LCCOMB_X45_Y11_N10
\XALU|Add4~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~10_combout\ = (regW(4) & (\XALU|Add4~9\ & VCC)) # (!regW(4) & (!\XALU|Add4~9\))
-- \XALU|Add4~11\ = CARRY((!regW(4) & !\XALU|Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datad => VCC,
	cin => \XALU|Add4~9\,
	combout => \XALU|Add4~10_combout\,
	cout => \XALU|Add4~11\);

-- Location: LCCOMB_X45_Y11_N12
\XALU|Add4~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~12_combout\ = (regW(5) & ((GND) # (!\XALU|Add4~11\))) # (!regW(5) & (\XALU|Add4~11\ $ (GND)))
-- \XALU|Add4~13\ = CARRY((regW(5)) # (!\XALU|Add4~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => regW(5),
	datad => VCC,
	cin => \XALU|Add4~11\,
	combout => \XALU|Add4~12_combout\,
	cout => \XALU|Add4~13\);

-- Location: LCCOMB_X45_Y10_N30
\XALU|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & (regW(5))) # (!regOp(0) & ((regW(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datab => regW(3),
	datac => regOp(0),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux5~0_combout\);

-- Location: LCCOMB_X45_Y10_N16
\XALU|Mux5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~3_combout\ = (regOp(0) & (regW(4) $ (regOp(1)))) # (!regOp(0) & (regW(4) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regOp(0),
	datac => regW(4),
	datad => regOp(1),
	combout => \XALU|Mux5~3_combout\);

-- Location: LCCOMB_X47_Y11_N22
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

-- Location: LCCOMB_X46_Y10_N16
\XALU|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~1_combout\ = (regOp(1) & ((regOp(0)))) # (!regOp(1) & (regW(4) & !regOp(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(4),
	datac => regOp(1),
	datad => regOp(0),
	combout => \XALU|Mux5~1_combout\);

-- Location: LCCOMB_X48_Y11_N12
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

-- Location: LCCOMB_X45_Y10_N12
\XALU|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~2_combout\ = (regOp(1) & ((\XALU|Mux5~1_combout\ & ((\XALU|Add1~8_combout\))) # (!\XALU|Mux5~1_combout\ & (\XALU|Add0~8_combout\)))) # (!regOp(1) & (((\XALU|Mux5~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => \XALU|Add0~8_combout\,
	datac => \XALU|Mux5~1_combout\,
	datad => \XALU|Add1~8_combout\,
	combout => \XALU|Mux5~2_combout\);

-- Location: LCCOMB_X45_Y10_N10
\XALU|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~4_combout\ = (\XALU|Mux2~1_combout\ & (\XALU|Mux2~0_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~0_combout\ & ((\XALU|Mux5~2_combout\))) # (!\XALU|Mux2~0_combout\ & (\XALU|Mux5~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Mux2~0_combout\,
	datac => \XALU|Mux5~3_combout\,
	datad => \XALU|Mux5~2_combout\,
	combout => \XALU|Mux5~4_combout\);

-- Location: LCCOMB_X46_Y10_N26
\XALU|Mux5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~5_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux5~4_combout\ & (\XALU|Add4~10_combout\)) # (!\XALU|Mux5~4_combout\ & ((\XALU|Add2~8_combout\))))) # (!\XALU|Mux2~1_combout\ & (((\XALU|Mux5~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Add4~10_combout\,
	datac => \XALU|Add2~8_combout\,
	datad => \XALU|Mux5~4_combout\,
	combout => \XALU|Mux5~5_combout\);

-- Location: LCCOMB_X46_Y10_N24
\XALU|Mux5~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux5~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux5~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux5~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux5~0_combout\,
	datad => \XALU|Mux5~5_combout\,
	combout => \XALU|Mux5~6_combout\);

-- Location: LCCOMB_X47_Y10_N16
\W[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(4) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux5~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(4),
	datab => \W[0]~0clkctrl_outclk\,
	datac => \rst~combout\,
	datad => \XALU|Mux5~6_combout\,
	combout => W(4));

-- Location: LCCOMB_X47_Y10_N2
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

-- Location: LCCOMB_X48_Y11_N14
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

-- Location: LCCOMB_X47_Y11_N24
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

-- Location: LCCOMB_X48_Y11_N28
\XALU|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~1_combout\ = (!regOp(0) & ((regOp(1) & ((\XALU|Add0~10_combout\))) # (!regOp(1) & (regW(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(5),
	datab => regOp(0),
	datac => regOp(1),
	datad => \XALU|Add0~10_combout\,
	combout => \XALU|Mux4~1_combout\);

-- Location: LCCOMB_X48_Y11_N22
\XALU|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~2_combout\ = (\XALU|Mux4~1_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Add1~10_combout\,
	datad => \XALU|Mux4~1_combout\,
	combout => \XALU|Mux4~2_combout\);

-- Location: LCCOMB_X47_Y10_N12
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

-- Location: LCCOMB_X47_Y10_N18
\XALU|Mux4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux4~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux4~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux4~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux4~0_combout\,
	datad => \XALU|Mux4~5_combout\,
	combout => \XALU|Mux4~6_combout\);

-- Location: LCCOMB_X49_Y10_N26
\W[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(5) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux4~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(5),
	datab => \rst~combout\,
	datac => \W[0]~0clkctrl_outclk\,
	datad => \XALU|Mux4~6_combout\,
	combout => W(5));

-- Location: LCCOMB_X49_Y10_N0
\regW[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(5) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(5)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(5),
	datac => \regW[6]~0clkctrl_outclk\,
	datad => W(5),
	combout => regW(5));

-- Location: LCCOMB_X45_Y10_N18
\XALU|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~0_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & (regW(7))) # (!regOp(0) & ((regW(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(7),
	datac => regW(5),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux3~0_combout\);

-- Location: LCCOMB_X46_Y10_N12
\XALU|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~12_combout\ = (regW(6) & (\XALU|Add2~11\ $ (GND))) # (!regW(6) & (!\XALU|Add2~11\ & VCC))
-- \XALU|Add2~13\ = CARRY((regW(6) & !\XALU|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(6),
	datad => VCC,
	cin => \XALU|Add2~11\,
	combout => \XALU|Add2~12_combout\,
	cout => \XALU|Add2~13\);

-- Location: LCCOMB_X45_Y10_N4
\XALU|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~3_combout\ = (regW(6) & (regOp(0) $ (regOp(1)))) # (!regW(6) & (regOp(0) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(6),
	datac => regOp(0),
	datad => regOp(1),
	combout => \XALU|Mux3~3_combout\);

-- Location: LCCOMB_X48_Y11_N16
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

-- Location: LCCOMB_X47_Y11_N26
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

-- Location: LCCOMB_X46_Y10_N28
\XALU|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~1_combout\ = (!regOp(0) & ((regOp(1) & ((\XALU|Add0~12_combout\))) # (!regOp(1) & (regW(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regW(6),
	datab => regOp(0),
	datac => regOp(1),
	datad => \XALU|Add0~12_combout\,
	combout => \XALU|Mux3~1_combout\);

-- Location: LCCOMB_X46_Y10_N22
\XALU|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~2_combout\ = (\XALU|Mux3~1_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Add1~12_combout\,
	datad => \XALU|Mux3~1_combout\,
	combout => \XALU|Mux3~2_combout\);

-- Location: LCCOMB_X46_Y10_N20
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

-- Location: LCCOMB_X45_Y11_N14
\XALU|Add4~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~14_combout\ = (regW(6) & (\XALU|Add4~13\ & VCC)) # (!regW(6) & (!\XALU|Add4~13\))
-- \XALU|Add4~15\ = CARRY((!regW(6) & !\XALU|Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => regW(6),
	datad => VCC,
	cin => \XALU|Add4~13\,
	combout => \XALU|Add4~14_combout\,
	cout => \XALU|Add4~15\);

-- Location: LCCOMB_X46_Y10_N18
\XALU|Mux3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~5_combout\ = (\XALU|Mux2~1_combout\ & ((\XALU|Mux3~4_combout\ & ((\XALU|Add4~14_combout\))) # (!\XALU|Mux3~4_combout\ & (\XALU|Add2~12_combout\)))) # (!\XALU|Mux2~1_combout\ & (((\XALU|Mux3~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~1_combout\,
	datab => \XALU|Add2~12_combout\,
	datac => \XALU|Mux3~4_combout\,
	datad => \XALU|Add4~14_combout\,
	combout => \XALU|Mux3~5_combout\);

-- Location: LCCOMB_X47_Y10_N10
\XALU|Mux3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux3~6_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux3~0_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux3~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux3~0_combout\,
	datad => \XALU|Mux3~5_combout\,
	combout => \XALU|Mux3~6_combout\);

-- Location: LCCOMB_X47_Y10_N6
\W[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- W(6) = (\rst~combout\ & ((GLOBAL(\W[0]~0clkctrl_outclk\) & ((\XALU|Mux3~6_combout\))) # (!GLOBAL(\W[0]~0clkctrl_outclk\) & (W(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => W(6),
	datab => \W[0]~0clkctrl_outclk\,
	datac => \rst~combout\,
	datad => \XALU|Mux3~6_combout\,
	combout => W(6));

-- Location: LCCOMB_X47_Y10_N4
\regW[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- regW(6) = (GLOBAL(\regW[6]~0clkctrl_outclk\) & ((W(6)))) # (!GLOBAL(\regW[6]~0clkctrl_outclk\) & (regW(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regW[6]~0clkctrl_outclk\,
	datac => regW(6),
	datad => W(6),
	combout => regW(6));

-- Location: LCCOMB_X44_Y10_N30
\XALU|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~3_combout\ = (\XALU|Mux8~0_combout\ & ((regOp(0) & (\carryIn~combout\)) # (!regOp(0) & ((regW(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => \carryIn~combout\,
	datac => regW(6),
	datad => \XALU|Mux8~0_combout\,
	combout => \XALU|Mux2~3_combout\);

-- Location: LCCOMB_X45_Y11_N16
\XALU|Add4~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add4~16_combout\ = \XALU|Add4~15\ $ (regW(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => regW(7),
	cin => \XALU|Add4~15\,
	combout => \XALU|Add4~16_combout\);

-- Location: LCCOMB_X46_Y10_N14
\XALU|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Add2~14_combout\ = \XALU|Add2~13\ $ (regW(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => regW(7),
	cin => \XALU|Add2~13\,
	combout => \XALU|Add2~14_combout\);

-- Location: LCCOMB_X49_Y10_N22
\XALU|Mux2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~6_combout\ = (regW(7) & (regOp(0) $ (regOp(1)))) # (!regW(7) & (regOp(0) & regOp(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => regW(7),
	datac => regOp(0),
	datad => regOp(1),
	combout => \XALU|Mux2~6_combout\);

-- Location: LCCOMB_X48_Y10_N20
\XALU|Mux2~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~7_combout\ = (\XALU|Mux2~0_combout\ & (\XALU|Mux2~1_combout\)) # (!\XALU|Mux2~0_combout\ & ((\XALU|Mux2~1_combout\ & (\XALU|Add2~14_combout\)) # (!\XALU|Mux2~1_combout\ & ((\XALU|Mux2~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Mux2~1_combout\,
	datac => \XALU|Add2~14_combout\,
	datad => \XALU|Mux2~6_combout\,
	combout => \XALU|Mux2~7_combout\);

-- Location: LCCOMB_X48_Y10_N28
\XALU|Mux2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~4_combout\ = (!regOp(0) & ((regOp(1) & ((\XALU|Add0~14_combout\))) # (!regOp(1) & (regW(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(0),
	datab => regW(7),
	datac => \XALU|Add0~14_combout\,
	datad => regOp(1),
	combout => \XALU|Mux2~4_combout\);

-- Location: LCCOMB_X48_Y10_N22
\XALU|Mux2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~5_combout\ = (\XALU|Mux2~4_combout\) # ((regOp(1) & (regOp(0) & \XALU|Add1~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => regOp(1),
	datab => regOp(0),
	datac => \XALU|Add1~14_combout\,
	datad => \XALU|Mux2~4_combout\,
	combout => \XALU|Mux2~5_combout\);

-- Location: LCCOMB_X48_Y10_N2
\XALU|Mux2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~8_combout\ = (\XALU|Mux2~0_combout\ & ((\XALU|Mux2~7_combout\ & (\XALU|Add4~16_combout\)) # (!\XALU|Mux2~7_combout\ & ((\XALU|Mux2~5_combout\))))) # (!\XALU|Mux2~0_combout\ & (((\XALU|Mux2~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~0_combout\,
	datab => \XALU|Add4~16_combout\,
	datac => \XALU|Mux2~7_combout\,
	datad => \XALU|Mux2~5_combout\,
	combout => \XALU|Mux2~8_combout\);

-- Location: LCCOMB_X48_Y10_N8
\XALU|Mux2~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|Mux2~9_combout\ = (\XALU|Mux8~2_combout\) # ((\XALU|Mux2~3_combout\) # ((!\XALU|Mux2~2_combout\ & \XALU|Mux2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux2~2_combout\,
	datab => \XALU|Mux8~2_combout\,
	datac => \XALU|Mux2~3_combout\,
	datad => \XALU|Mux2~8_combout\,
	combout => \XALU|Mux2~9_combout\);

-- Location: LCCOMB_X47_Y10_N20
\XALU|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~0_combout\ = (\XALU|Mux9~6_combout\) # ((\XALU|Mux6~6_combout\) # ((\XALU|Mux8~8_combout\) # (\XALU|Mux7~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux9~6_combout\,
	datab => \XALU|Mux6~6_combout\,
	datac => \XALU|Mux8~8_combout\,
	datad => \XALU|Mux7~6_combout\,
	combout => \XALU|LessThan0~0_combout\);

-- Location: LCCOMB_X47_Y10_N28
\XALU|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~1_combout\ = (\XALU|Mux4~6_combout\) # (\XALU|Mux5~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \XALU|Mux4~6_combout\,
	datad => \XALU|Mux5~6_combout\,
	combout => \XALU|LessThan0~1_combout\);

-- Location: LCCOMB_X47_Y10_N0
\XALU|LessThan0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \XALU|LessThan0~2_combout\ = (\XALU|Mux3~6_combout\) # ((\XALU|Mux2~9_combout\) # ((\XALU|LessThan0~0_combout\) # (\XALU|LessThan0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \XALU|Mux3~6_combout\,
	datab => \XALU|Mux2~9_combout\,
	datac => \XALU|LessThan0~0_combout\,
	datad => \XALU|LessThan0~1_combout\,
	combout => \XALU|LessThan0~2_combout\);

-- Location: LCCOMB_X47_Y10_N14
\Zout$latch\ : cycloneii_lcell_comb
-- Equation(s):
-- \Zout$latch~combout\ = (GLOBAL(\Zout~0clkctrl_outclk\) & ((!\XALU|LessThan0~2_combout\))) # (!GLOBAL(\Zout~0clkctrl_outclk\) & (\Zout$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Zout$latch~combout\,
	datac => \Zout~0clkctrl_outclk\,
	datad => \XALU|LessThan0~2_combout\,
	combout => \Zout$latch~combout\);

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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

-- Location: PIN_T22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
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


