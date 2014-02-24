//register file

module register_file (
//control
  input wire iClock,
  input wire iReset,
  
  input wire  iReadPort1A,
  input wire  iReadPort1B,
  input wire  iReadPort2A,
  input wire  iReadPort2B,
  
  input wire  iWritePort1,
  input wire  iWritePort2,
  
//read ports
  input wire [4:0] iRegReadSel1A,
  input wire [4:0] iRegReadSel1B,
  input wire [4:0] iRegReadSel2A,
  input wire [4:0] iRegReadSel2B,
  	
  output wire [15:0] oRead1AData,
  output wire [15:0] oRead1BData,
  output wire [15:0] oRead2AData,
  output wire [15:0] oRead2BData,
	

//write
	input wire [20:0] iRegWrite1,
	input wire [20:0] iRegWrite2
);


///{ 31 register each are 16 bits wide
reg [15:0] 
  r_q [31:0],
  r_d [31:0],
  readData1A_o = 0,
  readData1B_o = 0,
  readData2A_o = 0,
  readData2B_o = 0;

reg [5:0]
  i = 0;
///}register declrations

assign oRead1AData = readData1A_o;
assign oRead1BData = readData1B_o;
assign oRead2AData = readData2A_o;
assign oRead2BData = readData2B_o;

//read register value
  always@(*) begin : readReg_l
  
	 readData1A_o = 0;
	 readData1B_o = 0;
	 readData2A_o = 0;
	 readData2B_o = 0;
	
    if (iReadPort1A) begin
	   readData1A_o = r_q[iRegReadSel1A];		
	 end	 
    else begin
      readData1A_o = 0;	 
    end	 
	 if (iReadPort1B) begin
	   readData1B_o = r_q[iRegReadSel1B];		
	 end
	 else begin
	   readData1B_o = 0;
    end 
	 if (iReadPort2A) begin
	   readData2A_o = r_q[iRegReadSel2A];			
	 end
	 else begin
	   readData2A_o = 0;
    end
	 if (iReadPort2B) begin
	   readData2B_o = r_q[iRegReadSel2B];
    end
    else begin
	   readData2B_o = 0;
    end
  end
  //write register value
  always@(*) begin : writeReg_l
	 
	 if (iWritePort1) begin
	   r_d[iRegWrite1[20:16]] = iRegWrite1[15:0];
	 end
	 else begin
		r_d[iRegWrite1[20:16]] = r_q[iRegWrite1[20:16]];
	 end
	 if (iWritePort2) begin
	   r_d[iRegWrite2[20:16]] = iRegWrite2[15:0];
	 end
	 else begin
		r_d[iRegWrite2[20:16]] = r_q[iRegWrite2[20:16]];
	 end	   
  end
 
  //circulate the register value
  always@(posedge iClock) begin : registerClock_l     
    
	 //for (i=7; i >= 20; i = i+1)begin
	 //  r_q[i] <= r_d[i];
	 //end
	 //not the prettiest way of doing this but FOR loop doesnt seem to work
    if (iReset)begin
	   r_q[1] <= 0;
	   r_q[2] <= 0;
	   r_q[3] <= 0;
	   r_q[4] <= 0;
	   r_q[5] <= 0;
	   r_q[6] <= 0;
	   r_q[7] <= 0;
	   r_q[8] <= 0;
	   r_q[9] <= 0;
	   r_q[10] <= 0;
	   r_q[11] <= 0;
	   r_q[12] <= 0;
	   r_q[13] <= 0;
	   r_q[14] <= 0;
	   r_q[15] <= 0;
	   r_q[16] <= 0;
	   r_q[17] <= 0;
	   r_q[18] <= 0;
	   r_q[19] <= 0;
	   r_q[20] <= 0;
	   r_q[21] <= 0;
	   r_q[22] <= 0;
	   r_q[23] <= 0;
	   r_q[24] <= 0;
	   r_q[25] <= 0;
	   r_q[26] <= 0;
	   r_q[27] <= 0;
	   r_q[28] <= 0;
	   r_q[29] <= 0;
	   r_q[30] <= 0;
	   r_q[31] <= 0;
	 end
	 else begin
	   r_q[1] <= r_d[1];
	   r_q[2] <= r_d[2];
	   r_q[3] <= r_d[3];
	   r_q[4] <= r_d[4];
	   r_q[5] <= r_d[5];
	   r_q[6] <= r_d[6];
	   r_q[7] <= r_d[7];
	   r_q[8] <= r_d[8];
	   r_q[9] <= r_d[9];
	   r_q[10] <= r_d[10];
	   r_q[11] <= r_d[11];
	   r_q[12] <= r_d[12];
	   r_q[13] <= r_d[13];
	   r_q[14] <= r_d[14];
	   r_q[15] <= r_d[15];
	   r_q[16] <= r_d[16];
	   r_q[17] <= r_d[17];
	   r_q[18] <= r_d[18];
	   r_q[19] <= r_d[19];
	   r_q[20] <= r_d[20];
	   r_q[21] <= r_d[21];
	   r_q[22] <= r_d[22];
	   r_q[23] <= r_d[23];
	   r_q[24] <= r_d[24];
	   r_q[25] <= r_d[25];
	   r_q[26] <= r_d[26];
	   r_q[27] <= r_d[27];
	   r_q[28] <= r_d[28];
	   r_q[29] <= r_d[29];
	   r_q[30] <= r_d[30];
	   r_q[31] <= r_d[31];
	 end	 
  end	 
endmodule
  