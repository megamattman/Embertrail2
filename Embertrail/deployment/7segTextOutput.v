`define CHAR_ONE 8'hF9
`define CHAR_THREE 8'hB0
`define CHAR_SEVEN 8'hF8
`define CHAR_S 8'h92
`define CHAR_R 8'hCE
`define CHAR_T	8'h87
`define CHAR_BLANK 8'hFF


module seg7TextOutput (
input wire iControl_signal, 
input wire iDemo_signal,
input wire [7:0] iDataBus1A,
input wire [7:0] iDataBus1B,
input wire [7:0] iDataBus2A,
input wire [7:0] iDataBus2B,

output wire[7:0] oChar1, 
output wire[7:0] oChar2, 
output wire[7:0] oChar3, 
output wire[7:0] oChar4
);

reg [7:0] 
  char1 =0,
  char2 =0,
  char3 =0,
  char4 =0;

  assign oChar1 = char1;
  assign oChar2 = char2;
  assign oChar3 = char3;
  assign oChar4 = char4;
  
always@(*) begin
  if (iControl_signal) begin
    char1 = `CHAR_R;
	 char2 = `CHAR_S;
	 char3 = `CHAR_T;
	 char4 = `CHAR_BLANK;
  end
  if (iDemo_signal) begin
    char1 = iDataBus1A;
	 char2 = iDataBus1B;
	 char3 = iDataBus2A;
	 char4 = iDataBus2B;
  end
  else begin
    char1 = `CHAR_ONE;
	 char2 = `CHAR_THREE;
	 char3 = `CHAR_THREE;
	 char4 = `CHAR_SEVEN;
  end
end
endmodule
