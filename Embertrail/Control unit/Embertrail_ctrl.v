
`define ADDR 	4'b0000
`define ANDI 	4'b0001
`define ORI		4'b0010
`define NOTI	4'b0011
`define XORI	4'b0100
`define MVR  	4'b0101
`define MVI  	4'b0110
`define LDR		4'b0111
`define LDA		4'b1000
`define STR 	4'b1001
`define PUSH	4'b1010
`define POP  	4'b1011
`define BEQ 	4'b1100
`define SHIFTL	4'b1101
`define SHIFTR	4'b1110
//`define   	4'b1111

//ALU OP one hot code
`define ALU_ADD 8'b00000001
`define ALU_AND 8'b00000010
`define ALU_OR  8'b00000100
`define ALU_NOT 8'b00001000
`define ALU_XOR 8'b00010000
`define ALU_SL  8'b00100000
`define ALU_SR  8'b01000000
`define ALU_CMP 8'b10000000

`define STACK_REGISTER 5'b11110
`define IMMEDIATE_REGISTER 5'b11111

`define TWO_CYCLE   6'b100000
`define THREE_CYCLE 6'b100000

`timescale 1ns/1ns

`default_nettype none

module Embertrail_ctrl (

input wire iClock,
input wire iReset,

input wire [31:0] iIR,
input wire [15:0] iPC,

input wire [31:0] iDataDataBus,

output wire [31:0] oDataAddrBus,
output wire [15:0] oInstAddrBus,

output wire [31:0] oDataDataBus,

output wire oDataMem1RW,
output wire oDataMem2RW,
output wire oData1BusEn,
output wire oData2BusEn

);
	 
//wire definitions
  wire   
    inst1BImm,
    inst2BImm,
    dualInst,
	 validSI,
	 registerWB1,
	 registerWB2;	 
	 
  wire [3:0]
    inst1OpCode,
    inst2OpCode;
  
  wire [4:0]
    inst1OpA,
    inst1OpB,
    inst2OpA,
    inst2OpB;
	 
  wire [5:0]	 
	 opLen;
  
  wire [9:0]
    inst1Imm,
    inst2Imm;
  
  wire [15:0]
    inst1AReadData,
    inst1BReadData,
    inst2AReadData,
    inst2BReadData,
    alu1Result,  
    alu2Result,
	 instExAddr,
	 stackPointer;   
  	 
  reg 
    dumbWire       =0,
	 noAluA1        =0,	 
	 noAluB1        =0,
	 noAluA2        =0,
	 noAluB2        =0,
	 inst1Addr      =0,
	 inst1ImmInst   =0,
	 inst2ImmInst   =0,
	 inst1StackOp   =0,
	 inst2StackOp   =0,
    inst1Branch    =0,
    extendedInst   =0, 
    rfReadPort1A   =0,
    rfReadPort2A   =0,
    rfWritePort1EX =0,
	 rfWritePort1WB =0,
    rfWritePort2EX =0,
	 rfWritePort2WB =0,
	 inst1Mem       =0,
	 inst2Mem       =0,
	 inst1MemRW     =0,
	 inst2MemRW     =0;	 
  
  reg [4:0]
    rfRead1A     =0,
	 rfRead2A     =0;
	 
  reg [5:0]    
	 inst1Len     =0,
	 inst2Len     =0,
    opStage      =1;
  
  reg [7:0]
    alu1Op       =0,
	 alu2Op       =0;
	 
  reg [15:0]
    alu1OpA      =0,
    alu1OpB      =0,
    alu2OpA      =0,
    alu2OpB      =0,    
	 memData1Addr =0,
	 memData2Addr =0,
    NPC          =0;	 
   
	 
  reg [20:0]
    rfWriteData1 =0,
	 rfWriteData2 =0;
  
//first isntruction packet
  assign inst1OpCode		  = iIR[3:0];
  assign inst1OpA         = iIR[8:4];
  assign inst1OpB         = iIR[13:9];
  assign inst1Imm 		  = iIR[13:4];
  assign inst1BImm 		  = iIR[14];
  assign dualInst 		  = iIR [15];
  
  assign validSI = (dualInst & ~extendedInst);
  
  //second isntruction packet, bit 31 is ignored  
  assign inst2OpCode		  = iIR[19:16];
  assign inst2OpA         = iIR[24:20];
  assign inst2OpB         = iIR[29:25];
  assign inst2Imm 		  = iIR[29:20];
  assign inst2BImm 		  = iIR[30];
  
  //extend instruction operand
  assign instExAddr		  =iIR[31:16];
  
//register writeback control
  assign registerWB1 = rfWritePort1EX;
  assign registerWB2 = rfWritePort2EX;
  
//PC output
  assign oInstAddrBus = NPC ;

//memery address output
  assign oDataAddrBus[15:0] = (!inst1StackOp) ? (inst1BReadData) : (stackPointer);   
  assign oDataAddrBus[31:16] = (!inst2StackOp) ? (inst2BReadData) : (stackPointer);  
  assign oDataDataBus[15:0] = (inst1MemRW)? (alu1Result) : (16'bx);
  assign oDataDataBus[31:16] = (inst2MemRW)? (alu2Result) : (16'bx);
  assign oData1BusEn = inst1Mem;
  assign oData2BusEn = inst2Mem;
  assign oDataMem1RW = inst1MemRW;
  assign oDataMem2RW = inst2MemRW;

//program counter control
  assign opLen = (inst1Len > inst2Len) ? inst1Len : inst2Len;
  ///{
register_file RF (

//control
  .iClock (iClock),
  .iReset(iReset),
  
  .iReadPort1A(rfReadPort1A),
  .iReadPort1B(~inst1BImm),
  .iReadPort2A(rfReadPort2A),
  .iReadPort2B(~inst2BImm),

  .iWritePort1(registerWB1),
  .iWritePort2(registerWB2),
  
//read ports
  .iRegReadSel1A(inst1OpA),
  .iRegReadSel1B(inst1OpB),
  .iRegReadSel2A(inst2OpA),
  .iRegReadSel2B(inst2OpB),
  	
  .oRead1AData(inst1AReadData),
  .oRead1BData(inst1BReadData),
  .oRead2AData(inst2AReadData),
  .oRead2BData(inst2BReadData),
  .oStackPointer(stackPointer),
	
//write
  .iRegWrite1(rfWriteData1),	
  .iRegWrite2(rfWriteData2)	
);
  ///}
  
  //{Alu instantiations
alu A1 (
//control
	.iClock (iClock),
	.iReset(iReset),
	.iOperation(alu1Op),
//operands
  .iOperandA(alu1OpA),
  .iOperandB(alu1OpB),
//result
  .oAluResult(alu1Result)
);
  
alu A2 (
//control
	.iClock (iClock),
	.iReset(iReset),
	.iOperation(alu2Op),
//operands
  .iOperandA(alu2OpA),
  .iOperandB(alu2OpB),
//result
  .oAluResult(alu2Result)
);
  
  //decodes and set signals for instruction 1
always@(posedge iClock) begin  
  if (opStage[2]) begin
    case (inst1OpCode)	
    	 `ADDR:
  	       begin
			   rfWritePort1EX = 1;   		      
  	         alu1Op = `ALU_ADD;
            inst1Len = `TWO_CYCLE;
  	       end
  	     `ANDI:
  	       begin			   
  		      rfWritePort1EX = 1;		  	
  	         alu1Op = `ALU_AND;
  		      inst1Len = `TWO_CYCLE;
  	       end
  	     `ORI:
  	       begin 
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_OR; 
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `NOTI:
  	       begin
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_NOT; 
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `XORI:
  	       begin
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_XOR; 
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `MVR:
  	       begin		  
  	 	      noAluA1 = 1;
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_ADD; 
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `MVI:
  	       begin
  	 	      noAluA1 = 1;
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_ADD;
  	         inst1ImmInst =1'b1;
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `LDR:
  	       begin
  	 	      noAluB1 = 1;		  
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_ADD;	 
            inst1Mem = 1;        
  	 	      inst1Len = `THREE_CYCLE;
  	       end
  	     `LDA:
  	       begin
  	 	      rfWritePort1EX = 1;
  	         alu1Op = `ALU_ADD;
  	 	      extendedInst = 1'b1;
  	 	      inst1Addr = 1'b1;		  
  	 	      inst1Len = `TWO_CYCLE;
  	       end
  	     `STR:
  	        begin
  	 	       alu1Op = `ALU_ADD;
  	 	       noAluB1 = 1;
  	 	       inst1Mem = 1;
  	 	       inst1MemRW =1;
  	 	       inst1Len = `TWO_CYCLE;
  	        end
  /*	 `PUSH:
  	    begin
  		 alu1Op = `ALU_ADD;	 
  		 noAluA1 = 1;
  		 inst1Mem = 1;
  		 inst1MemRW = 1;
  		 inst1Len = `TWO_CYCLE;
  	    end		 
  	 `POP:	 
  	    begin
  		 noAluA1 = 1;
  		 alu1Op = `ALU_ADD;
  		 inst1Mem = 1;
  		 inst1Len = `THREE_CYCLE;
  	    end
  */
  	   `BEQ:
  	     begin
  		    alu1Op = `ALU_CMP;
  	       extendedInst = 1'b1;
  		    inst1Branch = 1'b1;	
  		    inst1Len = `TWO_CYCLE;
  	     end
  	    `SHIFTL:
  	      begin
  		     rfWritePort1EX = 1;
  		     alu1Op = `ALU_SL;
  		 	  inst1Len = `TWO_CYCLE;
  		   end
  	    `SHIFTR:
  	      begin
  		     rfWritePort1EX = 1;
  		     alu1Op = `ALU_SR;
  		  	inst1Len = `TWO_CYCLE;
  	      end
  	    default: //nops
  		   begin
  		     inst1Len = `TWO_CYCLE;
  		     rfReadPort1A = 0;	
  		   end
  		//}
    endcase //end of case opCode1
  end
  else if (opStage[3]) begin    
    //OPA MUX2 
    if (noAluA1) begin
      alu1OpA = 16'h0000;
    end  
    else if (inst1Addr) begin
      alu1OpA = instExAddr;
    end 
    else begin
      alu1OpA = inst1AReadData;
    end
  
    //OPB MUX
    if (inst1ImmInst) begin 
      alu1OpB = {6'b00,inst1Imm};
    end
    else if (inst1BImm)	begin	 
      alu1OpB = {11'b0, inst1OpB};		//use the reg sel value as small imm	  
    end
    else if (noAluB1) begin
      alu1OpB = 16'b0;
    end
    else begin   				
      alu1OpB = inst1BReadData;
    end
  end // opstage 3
  else if (opStage[4]) begin
    dumbWire = 1'b1;
  end
  else if (opStage[5]) begin
  //rfWriteData1 = 0;
  //Write back to registers, using memory data or aluOutput
  if (!inst1Branch) begin  
    if (~inst1MemRW & inst1Mem) begin
	   rfWriteData1 = {inst1OpA,iDataDataBus[15:0]};
	 end
	 else if (inst1ImmInst) begin
	   rfWriteData1 = {`IMMEDIATE_REGISTER,alu1Result};
	 end
	 else begin	   
	   rfWriteData1 = {inst1OpA,alu1Result};
    end
	end 
   end
  else begin
      //first set all signals to zero!
    extendedInst = 0;
    inst1Branch = 0;
    inst1ImmInst = 0;
    inst1Addr = 0;
    //rfWriteData1 = 0;
    alu1Op = `ALU_ADD;  
    inst1Len = `TWO_CYCLE;
  //rf control
    rfWritePort1EX = 0;
    noAluA1       =0;
    noAluB1       =0;
    rfRead1A = 0;
    rfReadPort1A = 1;
  //Data memory control
    inst1Mem = 0;
    inst1MemRW = 0;
    memData1Addr = 0;
    //end of initialisation
   end 
end

always@(posedge iClock) begin
//initialise second side
  if (validSI) begin 
    if (opStage[2]) begin	   
	    case (inst2OpCode)	
  	     `ADDR:
	       begin	
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_ADD; 
	      inst2Len = `TWO_CYCLE;
	       end
	     `ANDI:
	       begin
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_AND;
	      inst2Len = `TWO_CYCLE;
	       end
	     `ORI:
	       begin 
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_OR; 
	      inst2Len = `TWO_CYCLE;
	       end
	     `NOTI:
	       begin
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_NOT; 
	      inst2Len = `TWO_CYCLE;
	       end
	     `XORI:
	       begin
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_XOR; 
	      inst2Len = `TWO_CYCLE;
	       end
	     `MVR:
	       begin
	       noAluA2 = 1;
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_ADD; 
	      inst2Len = `TWO_CYCLE;
	       end
	     `MVI:
	       begin
	       noAluA2 = 1;
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_ADD;
	         inst2ImmInst =1'b1;
	      inst2Len = `TWO_CYCLE;
	       end
	     `LDR:
	        begin
	         noAluB2 = 1;
	         rfWritePort2EX = 1;
	         alu2Op = `ALU_ADD;	
            inst2Mem = 1;			 
	         inst2Len = `THREE_CYCLE;
	       end
	     `STR:
	        begin
	         noAluB2 = 1;
	         alu2Op = `ALU_ADD;
	         inst2Mem = 1;
	         inst2MemRW =1;
	         inst2Len = `TWO_CYCLE;
	        end
			  
//      
//     `PUSH:
//        begin
//       noAluA2 = 1;
//          alu2Op = `ALU_ADD;
//       inst2Len = `TWO_CYCLE;
//        end
//     `POP:	 
//        begin
//       noAluA2 = 1;
//          alu2Op = `ALU_ADD;
//       inst2Len = `THREE_CYCLE;
//        end      
//       
	     default: //nops
	       begin
	         noAluA2 = 0;
	         alu2Op = `ALU_ADD;
	         dumbWire =1'b1;
	 	      inst2Len = `TWO_CYCLE;
	      end
      endcase //end of case opCode1   
	 end
    else if (opStage[3]) begin	 
     
//access memory with the PC??
//Determine A operand to send to ALU  
      //OPA MUX1 - address with explicit oir implicit operands
    
     if (inst2ImmInst ) begin
        rfRead2A = `IMMEDIATE_REGISTER;
      end
      else begin
        rfRead2A = inst2OpA;
      end 
	   
	  //OPA MUX2
      if (noAluA2) begin
        alu2OpA = 16'h0000;
      end
      else begin
        alu2OpA = inst2AReadData;
      end
	  
     //OPB MUX
      if (inst2ImmInst) begin 
        alu2OpB = inst2Imm;
      end
      else if (inst2BImm)	begin	 
        alu2OpB = {11'b0, inst2OpB};		//use the reg sel value as small imm	  
      end	
	   else if (noAluB2) begin
        alu2OpB = 16'b0000;
	   end
      else begin 
       alu2OpB = inst2BReadData;
      end		
    end // opstage[3]
	 else if (opStage[4]) begin 
      dumbWire = 1'b1;
    end		
	 else if (opStage[5]) begin	
	//Write back to registers, using memory data or aluOutput 
	     if (~inst2MemRW & inst2Mem) begin
	       rfWriteData2 = {inst2OpA,iDataDataBus[31:16]};
	     end
		  else if (inst2ImmInst) begin
		    rfWriteData2 = {`IMMEDIATE_REGISTER,alu2Result};
		  end
	     else begin 	     	     
	       rfWriteData2 = {inst2OpA,alu2Result};
	     end
    end //opstage[5]
    else begin
      rfWritePort2EX = 0;  
      rfReadPort2A = 1; 
      inst2ImmInst = 0;
      rfWriteData2 = 0;
      alu2Op = `ALU_ADD;
      alu2OpB = 0;
      alu2OpA = 0;
      noAluA2  =0;  
      noAluB2  =0; 
      rfRead2A = 0;
      inst2Len = `TWO_CYCLE;
//    memory control
      inst2StackOp = 0;
      inst2Mem = 0;
      memData2Addr = 0;
      inst2MemRW = 0;    
    end //    end initilisation   
  end//ValidSI
  else begin
    rfWritePort2EX = 0;  
    rfReadPort2A = 1; 
    inst2ImmInst = 0;
    rfWriteData2 = 0;
    alu2Op = `ALU_ADD;
    alu2OpB = 0;
    alu2OpA = 0;
    noAluA2  =0;  
    noAluB2  =0; 
    rfRead2A = 0;
    inst2Len = `TWO_CYCLE;
//  memory control
    inst2StackOp = 0;
    inst2Mem = 0;
    memData2Addr = 0;
    inst2MemRW = 0;    
  end  
end // always@(*)
//program counter
always @(posedge iClock) begin
  if (iReset) begin
    NPC = 0;
  end  
  else if (opLen === opStage) begin  
    if (alu1Result[0] & inst1Branch) begin
      NPC = instExAddr;  
    end	 
    else if (dualInst) begin
      NPC = iPC + 16'h0002; 
    end
    else begin
      NPC = iPC + 16'h0001; 
    end    
	 opStage = 5'b00001;
  end
  else begin
    opStage = opStage << 1;
  end
end

endmodule


//{Register File instantiation

//}


//}
