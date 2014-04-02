// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
// CREATED		"Tue Apr 01 20:52:21 2014"

module embertrail_fpga_deployment_top(
	Embertrail_clock,
	Embertrail_reset
);


input wire	Embertrail_clock;
input wire	Embertrail_reset;

wire	clock;
wire	dataBus1En;
wire	dataBus1RW;
wire	dataBus2En;
wire	dataBus2RW;
wire	[31:0] dataBusAddr;
wire	[31:0] dataBusData;
wire	dmem1WEn;
wire	[15:0] dMemDataOut1;
wire	[15:0] dMemDataOut2;
wire	[15:0] instBusAddr;
wire	[15:0] PI;
wire	reset;
wire	[15:0] SI;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[15:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;

wire	[31:0] GDFX_TEMP_SIGNAL_0;
wire	[31:0] GDFX_TEMP_SIGNAL_1;


assign	GDFX_TEMP_SIGNAL_0 = {dMemDataOut2[15:0],dMemDataOut1[15:0]};
assign	GDFX_TEMP_SIGNAL_1 = {SI[15:0],PI[15:0]};


Embertrail_top	b2v_inst(
	.iClock(clock),
	.iReset(reset),
	.iDataDataBus(GDFX_TEMP_SIGNAL_0),
	.iIR(GDFX_TEMP_SIGNAL_1),
	
	.oDataMem1RW(dataBus1RW),
	.oDataMem2RW(dataBus2RW),
	.oData1BusEn(dataBus1En),
	.oData2BusEn(dataBus2En),
	.oDataAddrBus(dataBusAddr),
	.oDataDataBus(dataBusData),
	.oInstAddrBus(instBusAddr));

assign	SYNTHESIZED_WIRE_1 = dataBus2RW & dataBus2En;

assign	reset =  ~Embertrail_reset;


pcAdder	b2v_inst12(
	.dataa(instBusAddr),
	.result(SYNTHESIZED_WIRE_3));


pll	b2v_inst13(
	.inclk0(Embertrail_clock),
	.c0(clock));


dMEM	b2v_inst2(
	.wren_a(dmem1WEn),
	.rden_a(SYNTHESIZED_WIRE_0),
	.wren_b(SYNTHESIZED_WIRE_1),
	.rden_b(SYNTHESIZED_WIRE_2),
	.clock(clock),
	.address_a(dataBusAddr[15:0]),
	.address_b(dataBusAddr[31:16]),
	.data_a(dataBusData[15:0]),
	.data_b(dataBusData[31:16]),
	.q_a(dMemDataOut1),
	.q_b(dMemDataOut2));


iMem	b2v_inst4(
	
	.address_a(instBusAddr),
	.address_b(SYNTHESIZED_WIRE_3),
	.q_a(PI),
	.q_b(SI));

assign	SYNTHESIZED_WIRE_5 =  ~dataBus2RW;

assign	SYNTHESIZED_WIRE_4 =  ~dataBus1RW;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_4 & dataBus1En;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_5 & dataBus2En;

assign	dmem1WEn = dataBus1RW & dataBus1En;


endmodule
