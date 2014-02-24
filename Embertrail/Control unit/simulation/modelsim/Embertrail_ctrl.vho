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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "01/27/2014 22:55:01"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Embertrail_ctrl IS
    PORT (
	IR : IN std_logic_vector(31 DOWNTO 0);
	PC : IN std_logic_vector(15 DOWNTO 0);
	oInst1AReg : OUT std_logic_vector(4 DOWNTO 0);
	oInst1BReg : OUT std_logic_vector(4 DOWNTO 0);
	oInst2AReg : OUT std_logic_vector(4 DOWNTO 0);
	oInst2BReg : OUT std_logic_vector(4 DOWNTO 0)
	);
END Embertrail_ctrl;

-- Design Ports Information
-- IR[0]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[1]	=>  Location: PIN_T1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[2]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[3]	=>  Location: PIN_P4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[4]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[5]	=>  Location: PIN_M1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[6]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[7]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[8]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[9]	=>  Location: PIN_R19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[10]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[11]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[12]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[13]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[14]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[15]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[16]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[17]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[18]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[19]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[20]	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[21]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[22]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[23]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[24]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[25]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[26]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[27]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[28]	=>  Location: PIN_J3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[29]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[30]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IR[31]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[0]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[1]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[2]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[3]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[4]	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[5]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[6]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[7]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[8]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[9]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[10]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[11]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[12]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[13]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[14]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PC[15]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1AReg[0]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1AReg[1]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1AReg[2]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1AReg[3]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1AReg[4]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1BReg[0]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1BReg[1]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1BReg[2]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1BReg[3]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst1BReg[4]	=>  Location: PIN_J4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2AReg[0]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2AReg[1]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2AReg[2]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2AReg[3]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2AReg[4]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2BReg[0]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2BReg[1]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2BReg[2]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2BReg[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oInst2BReg[4]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Embertrail_ctrl IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_IR : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_PC : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_oInst1AReg : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_oInst1BReg : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_oInst2AReg : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_oInst2BReg : std_logic_vector(4 DOWNTO 0);
SIGNAL \IR[0]~input_o\ : std_logic;
SIGNAL \IR[1]~input_o\ : std_logic;
SIGNAL \IR[2]~input_o\ : std_logic;
SIGNAL \IR[3]~input_o\ : std_logic;
SIGNAL \IR[4]~input_o\ : std_logic;
SIGNAL \IR[5]~input_o\ : std_logic;
SIGNAL \IR[6]~input_o\ : std_logic;
SIGNAL \IR[7]~input_o\ : std_logic;
SIGNAL \IR[8]~input_o\ : std_logic;
SIGNAL \IR[9]~input_o\ : std_logic;
SIGNAL \IR[10]~input_o\ : std_logic;
SIGNAL \IR[11]~input_o\ : std_logic;
SIGNAL \IR[12]~input_o\ : std_logic;
SIGNAL \IR[13]~input_o\ : std_logic;
SIGNAL \IR[14]~input_o\ : std_logic;
SIGNAL \IR[15]~input_o\ : std_logic;
SIGNAL \IR[16]~input_o\ : std_logic;
SIGNAL \IR[17]~input_o\ : std_logic;
SIGNAL \IR[18]~input_o\ : std_logic;
SIGNAL \IR[19]~input_o\ : std_logic;
SIGNAL \IR[20]~input_o\ : std_logic;
SIGNAL \IR[21]~input_o\ : std_logic;
SIGNAL \IR[22]~input_o\ : std_logic;
SIGNAL \IR[23]~input_o\ : std_logic;
SIGNAL \IR[24]~input_o\ : std_logic;
SIGNAL \IR[25]~input_o\ : std_logic;
SIGNAL \IR[26]~input_o\ : std_logic;
SIGNAL \IR[27]~input_o\ : std_logic;
SIGNAL \IR[28]~input_o\ : std_logic;
SIGNAL \IR[29]~input_o\ : std_logic;
SIGNAL \IR[30]~input_o\ : std_logic;
SIGNAL \IR[31]~input_o\ : std_logic;
SIGNAL \PC[0]~input_o\ : std_logic;
SIGNAL \PC[1]~input_o\ : std_logic;
SIGNAL \PC[2]~input_o\ : std_logic;
SIGNAL \PC[3]~input_o\ : std_logic;
SIGNAL \PC[4]~input_o\ : std_logic;
SIGNAL \PC[5]~input_o\ : std_logic;
SIGNAL \PC[6]~input_o\ : std_logic;
SIGNAL \PC[7]~input_o\ : std_logic;
SIGNAL \PC[8]~input_o\ : std_logic;
SIGNAL \PC[9]~input_o\ : std_logic;
SIGNAL \PC[10]~input_o\ : std_logic;
SIGNAL \PC[11]~input_o\ : std_logic;
SIGNAL \PC[12]~input_o\ : std_logic;
SIGNAL \PC[13]~input_o\ : std_logic;
SIGNAL \PC[14]~input_o\ : std_logic;
SIGNAL \PC[15]~input_o\ : std_logic;
SIGNAL \oInst1AReg[0]~output_o\ : std_logic;
SIGNAL \oInst1AReg[1]~output_o\ : std_logic;
SIGNAL \oInst1AReg[2]~output_o\ : std_logic;
SIGNAL \oInst1AReg[3]~output_o\ : std_logic;
SIGNAL \oInst1AReg[4]~output_o\ : std_logic;
SIGNAL \oInst1BReg[0]~output_o\ : std_logic;
SIGNAL \oInst1BReg[1]~output_o\ : std_logic;
SIGNAL \oInst1BReg[2]~output_o\ : std_logic;
SIGNAL \oInst1BReg[3]~output_o\ : std_logic;
SIGNAL \oInst1BReg[4]~output_o\ : std_logic;
SIGNAL \oInst2AReg[0]~output_o\ : std_logic;
SIGNAL \oInst2AReg[1]~output_o\ : std_logic;
SIGNAL \oInst2AReg[2]~output_o\ : std_logic;
SIGNAL \oInst2AReg[3]~output_o\ : std_logic;
SIGNAL \oInst2AReg[4]~output_o\ : std_logic;
SIGNAL \oInst2BReg[0]~output_o\ : std_logic;
SIGNAL \oInst2BReg[1]~output_o\ : std_logic;
SIGNAL \oInst2BReg[2]~output_o\ : std_logic;
SIGNAL \oInst2BReg[3]~output_o\ : std_logic;
SIGNAL \oInst2BReg[4]~output_o\ : std_logic;

BEGIN

ww_IR <= IR;
ww_PC <= PC;
oInst1AReg <= ww_oInst1AReg;
oInst1BReg <= ww_oInst1BReg;
oInst2AReg <= ww_oInst2AReg;
oInst2BReg <= ww_oInst2BReg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y3_N2
\oInst1AReg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1AReg[0]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\oInst1AReg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1AReg[1]~output_o\);

-- Location: IOOBUF_X1_Y29_N2
\oInst1AReg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1AReg[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\oInst1AReg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1AReg[3]~output_o\);

-- Location: IOOBUF_X30_Y29_N2
\oInst1AReg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1AReg[4]~output_o\);

-- Location: IOOBUF_X41_Y11_N2
\oInst1BReg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1BReg[0]~output_o\);

-- Location: IOOBUF_X39_Y29_N2
\oInst1BReg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1BReg[1]~output_o\);

-- Location: IOOBUF_X37_Y0_N23
\oInst1BReg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1BReg[2]~output_o\);

-- Location: IOOBUF_X0_Y27_N2
\oInst1BReg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1BReg[3]~output_o\);

-- Location: IOOBUF_X0_Y21_N2
\oInst1BReg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst1BReg[4]~output_o\);

-- Location: IOOBUF_X1_Y29_N9
\oInst2AReg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2AReg[0]~output_o\);

-- Location: IOOBUF_X0_Y21_N9
\oInst2AReg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2AReg[1]~output_o\);

-- Location: IOOBUF_X0_Y2_N23
\oInst2AReg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2AReg[2]~output_o\);

-- Location: IOOBUF_X5_Y29_N9
\oInst2AReg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2AReg[3]~output_o\);

-- Location: IOOBUF_X0_Y27_N16
\oInst2AReg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2AReg[4]~output_o\);

-- Location: IOOBUF_X0_Y20_N2
\oInst2BReg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2BReg[0]~output_o\);

-- Location: IOOBUF_X0_Y25_N2
\oInst2BReg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2BReg[1]~output_o\);

-- Location: IOOBUF_X0_Y20_N9
\oInst2BReg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2BReg[2]~output_o\);

-- Location: IOOBUF_X21_Y29_N9
\oInst2BReg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2BReg[3]~output_o\);

-- Location: IOOBUF_X41_Y3_N16
\oInst2BReg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oInst2BReg[4]~output_o\);

-- Location: IOIBUF_X0_Y14_N15
\IR[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(0),
	o => \IR[0]~input_o\);

-- Location: IOIBUF_X0_Y14_N22
\IR[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(1),
	o => \IR[1]~input_o\);

-- Location: IOIBUF_X0_Y26_N22
\IR[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(2),
	o => \IR[2]~input_o\);

-- Location: IOIBUF_X0_Y10_N22
\IR[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(3),
	o => \IR[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\IR[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(4),
	o => \IR[4]~input_o\);

-- Location: IOIBUF_X0_Y13_N22
\IR[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(5),
	o => \IR[5]~input_o\);

-- Location: IOIBUF_X0_Y12_N1
\IR[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(6),
	o => \IR[6]~input_o\);

-- Location: IOIBUF_X35_Y29_N22
\IR[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(7),
	o => \IR[7]~input_o\);

-- Location: IOIBUF_X0_Y12_N15
\IR[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(8),
	o => \IR[8]~input_o\);

-- Location: IOIBUF_X41_Y9_N15
\IR[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(9),
	o => \IR[9]~input_o\);

-- Location: IOIBUF_X0_Y11_N1
\IR[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(10),
	o => \IR[10]~input_o\);

-- Location: IOIBUF_X28_Y0_N22
\IR[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(11),
	o => \IR[11]~input_o\);

-- Location: IOIBUF_X26_Y0_N15
\IR[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(12),
	o => \IR[12]~input_o\);

-- Location: IOIBUF_X0_Y10_N1
\IR[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(13),
	o => \IR[13]~input_o\);

-- Location: IOIBUF_X0_Y11_N8
\IR[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(14),
	o => \IR[14]~input_o\);

-- Location: IOIBUF_X0_Y10_N15
\IR[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(15),
	o => \IR[15]~input_o\);

-- Location: IOIBUF_X9_Y29_N8
\IR[16]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(16),
	o => \IR[16]~input_o\);

-- Location: IOIBUF_X32_Y29_N29
\IR[17]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(17),
	o => \IR[17]~input_o\);

-- Location: IOIBUF_X5_Y29_N29
\IR[18]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(18),
	o => \IR[18]~input_o\);

-- Location: IOIBUF_X0_Y9_N15
\IR[19]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(19),
	o => \IR[19]~input_o\);

-- Location: IOIBUF_X0_Y6_N1
\IR[20]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(20),
	o => \IR[20]~input_o\);

-- Location: IOIBUF_X0_Y7_N15
\IR[21]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(21),
	o => \IR[21]~input_o\);

-- Location: IOIBUF_X23_Y0_N8
\IR[22]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(22),
	o => \IR[22]~input_o\);

-- Location: IOIBUF_X11_Y0_N8
\IR[23]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(23),
	o => \IR[23]~input_o\);

-- Location: IOIBUF_X32_Y0_N22
\IR[24]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(24),
	o => \IR[24]~input_o\);

-- Location: IOIBUF_X41_Y13_N22
\IR[25]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(25),
	o => \IR[25]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\IR[26]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(26),
	o => \IR[26]~input_o\);

-- Location: IOIBUF_X9_Y29_N1
\IR[27]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(27),
	o => \IR[27]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\IR[28]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(28),
	o => \IR[28]~input_o\);

-- Location: IOIBUF_X26_Y0_N22
\IR[29]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(29),
	o => \IR[29]~input_o\);

-- Location: IOIBUF_X35_Y0_N8
\IR[30]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(30),
	o => \IR[30]~input_o\);

-- Location: IOIBUF_X0_Y13_N8
\IR[31]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IR(31),
	o => \IR[31]~input_o\);

-- Location: IOIBUF_X0_Y24_N22
\PC[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(0),
	o => \PC[0]~input_o\);

-- Location: IOIBUF_X0_Y5_N8
\PC[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(1),
	o => \PC[1]~input_o\);

-- Location: IOIBUF_X0_Y5_N15
\PC[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(2),
	o => \PC[2]~input_o\);

-- Location: IOIBUF_X39_Y29_N29
\PC[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(3),
	o => \PC[3]~input_o\);

-- Location: IOIBUF_X26_Y0_N29
\PC[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(4),
	o => \PC[4]~input_o\);

-- Location: IOIBUF_X0_Y4_N8
\PC[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(5),
	o => \PC[5]~input_o\);

-- Location: IOIBUF_X0_Y4_N15
\PC[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(6),
	o => \PC[6]~input_o\);

-- Location: IOIBUF_X0_Y4_N22
\PC[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(7),
	o => \PC[7]~input_o\);

-- Location: IOIBUF_X0_Y7_N1
\PC[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(8),
	o => \PC[8]~input_o\);

-- Location: IOIBUF_X0_Y3_N8
\PC[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(9),
	o => \PC[9]~input_o\);

-- Location: IOIBUF_X0_Y2_N1
\PC[10]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(10),
	o => \PC[10]~input_o\);

-- Location: IOIBUF_X16_Y29_N8
\PC[11]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(11),
	o => \PC[11]~input_o\);

-- Location: IOIBUF_X41_Y2_N15
\PC[12]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(12),
	o => \PC[12]~input_o\);

-- Location: IOIBUF_X41_Y19_N1
\PC[13]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(13),
	o => \PC[13]~input_o\);

-- Location: IOIBUF_X41_Y5_N8
\PC[14]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(14),
	o => \PC[14]~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\PC[15]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PC(15),
	o => \PC[15]~input_o\);

ww_oInst1AReg(0) <= \oInst1AReg[0]~output_o\;

ww_oInst1AReg(1) <= \oInst1AReg[1]~output_o\;

ww_oInst1AReg(2) <= \oInst1AReg[2]~output_o\;

ww_oInst1AReg(3) <= \oInst1AReg[3]~output_o\;

ww_oInst1AReg(4) <= \oInst1AReg[4]~output_o\;

ww_oInst1BReg(0) <= \oInst1BReg[0]~output_o\;

ww_oInst1BReg(1) <= \oInst1BReg[1]~output_o\;

ww_oInst1BReg(2) <= \oInst1BReg[2]~output_o\;

ww_oInst1BReg(3) <= \oInst1BReg[3]~output_o\;

ww_oInst1BReg(4) <= \oInst1BReg[4]~output_o\;

ww_oInst2AReg(0) <= \oInst2AReg[0]~output_o\;

ww_oInst2AReg(1) <= \oInst2AReg[1]~output_o\;

ww_oInst2AReg(2) <= \oInst2AReg[2]~output_o\;

ww_oInst2AReg(3) <= \oInst2AReg[3]~output_o\;

ww_oInst2AReg(4) <= \oInst2AReg[4]~output_o\;

ww_oInst2BReg(0) <= \oInst2BReg[0]~output_o\;

ww_oInst2BReg(1) <= \oInst2BReg[1]~output_o\;

ww_oInst2BReg(2) <= \oInst2BReg[2]~output_o\;

ww_oInst2BReg(3) <= \oInst2BReg[3]~output_o\;

ww_oInst2BReg(4) <= \oInst2BReg[4]~output_o\;
END structure;


