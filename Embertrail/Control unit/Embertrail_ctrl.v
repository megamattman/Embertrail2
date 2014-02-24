
`define NOP 	4'b0000
`define ADDR 	4'b0001
`define ANDI	4'b0010
`define ORI		4'b0011
`define NOTI	4'b0100
`define XORI 	4'b0101
`define MVR  	4'b0110
`define MVI 	4'b0111
`define LDR		4'b1000
`define LDA		4'b1001
`define STR 	4'b1010
`define PUSH 	4'b1011
`define POP  	4'b1100
`define STSP 	4'b1101
`define JMP  	4'b1110
`define BEQ  	4'b1111

`timescale 1ns/1ns

`default_nettype none

module Embertrail_ctrl (

input wire iClock,
input wire iReset,

input wire [31:0] iIR,
input wire [15:0] iPC,

input wire [15:0]iMemoryReadData1,
input wire [15:0]iMemoryReadData2,

output wire [15:0]oMemoryWriteData1,
output wire [15:0]oMemoryWriteData2,
output wire [15:0]oMemoryWriteAddress1,
output wire [15:0]oMemoryWriteAddress2,

input wire [31:0] iDataDataBus,

output wire [31:0] oDataAddrBus,
output wire [15:0] oInstAddrBus,

output wire oDataMem1RW,
output wire oDataMem2RW,
output wire oData1BusEn,
output wire oData2BusEn

);
	 
//wire definitions
  wire   
    inst1BImm,
    inst2BImm,
    dualInst;	 
	 
  wire [3:0]
    inst1Op,
    inst2Op;
  
  wire [4:0]
    inst1ARegReadSel,
    inst1BRegReadSel,
    inst2ARegReadSel,
    inst2BRegReadSel;
  
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
	 instExAddr;   
  	 
  reg 
    dumbWire     =0,
	 inst1RegWB   =0,
	 inst2RegWB   =0,
	 inst1Addr    =0,
	 inst1Ld      =0,
	 inst2Ld      =0,
	 inst1ImmInst =0,
	 inst2ImmInst =0,
    inst1Branch  =0,
    extendedInst =0, 
    rfReadPort1A =0,
    rfReadPort1B =0,
    rfReadPort2A =0,
    rfReadPort2B =0,  
    rfWritePort1 =0,
    rfWritePort2 =0,
	 branchTaken  =0;
  
  reg [4:0]
    alu1Op = 0,
	 alu2Op = 0,
	 inst1RegWriteSel = 0,
    inst2RegWriteSel = 0;
  
  reg [15:0]
    alu1OpA = 0,
    alu1OpB = 0,
    alu2OpA = 0,
    alu2OpB = 0,
	 alu1Output = 0,
	 alu2Output = 0,
	 branchOpA =0,
	 branchOpB =0,
	 NPCOut = 0,
    NPC = 0;	 
   
	 
  reg [20:0]
    rfWriteData1 = 0,
	 rfWriteData2 = 0;
  
//first isntruction packet
  assign inst1Op		  = iIR[3:0];
  assign inst1ARegReadSel = iIR[8:4];
  assign inst1BRegReadSel = iIR[13:9];
  assign inst1Imm 		  = iIR[13:4];
  assign inst1BImm 		  = iIR[14];
  assign dualInst 		  = iIR [15];
  
  //second isntruction packet, bit 31 is ignored  
  assign inst2Op		  = iIR[19:16];
  assign inst2ARegReadSel = iIR[24:20];
  assign inst2BRegReadSel = iIR[29:25];
  assign inst2Imm 		  = iIR[29:20];
  assign inst2BImm 		  = iIR[30];
  
  //extend instruction operand
  assign instExAddr		=iIR[31:16];
  
//PC output
  //assign oNPC = NPCOut ;

  
  ///{
register_file RF (

//control
  .iClock (iClock),
  .iReset(iReset),
  
  .iReadPort1A(rfReadPort1A),
  .iReadPort1B(rfReadPort1B),
  .iReadPort2A(rfReadPort2A),
  .iReadPort2B(rfReadPort2B),

  .iWritePort1(rfWritePort1),
  .iWritePort2(rfWritePort2),
  
//read ports
  .iRegReadSel1A(inst1ARegReadSel),
  .iRegReadSel1B(inst1BRegReadSel),
  .iRegReadSel2A(inst2ARegReadSel),
  .iRegReadSel2B(inst2BRegReadSel),
  	
  .oRead1AData(inst1AReadData),
  .oRead1BData(inst1BReadData),
  .oRead2AData(inst2AReadData),
  .oRead2BData(inst2BReadData),
	
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
always@(*)
begin : instDecode_l
//first set all signals to zero!
  extendedInst = 0;
  inst1Branch = 0;
  inst1Addr = 0;
  inst1Ld = 0;
  inst1RegWB = 0;
  inst1ImmInst = 0;
  rfWriteData1 = 0;
  alu1Op = 5'b00000;
  inst1RegWriteSel = 0;
  branchTaken = 0;
  branchOpA = 0;
  branchOpB = 0;
//rf control
  rfReadPort1A = 0;
  rfReadPort1B = 0; 
  rfWritePort1 = 0;
 
  //end of initialisation
  
  case (inst1Op)	
  	 `ADDR:
	   begin	
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00001; 
	   end
	 `ANDI:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b10000;
	   end
	 `ORI:
	   begin 
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00100; 
	   end
	 `NOTI:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b01000; 
	   end
	 `XORI:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00010; 
	   end
	 `MVR:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00000; 
	   end
	 `MVI:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00000;
	     inst1ImmInst =1'b1;
	   end
	 `LDR:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00000;	     
	   end
	 `LDA:
	   begin
		  inst1RegWB = 1'b1;
	     alu1Op = 5'b00000;
		  extendedInst = 1'b1;
		  inst1Addr = 1'b1;
	   end
	 `STR:
	    begin
		 alu1Op = 5'b00000;
		 inst1RegWB = 1'b1;
	    end
	 `PUSH:
	    begin
		 inst1RegWB = 1'b1;
		 alu1Op = 5'b00000;
	    end
	 `POP:	 
	    begin
		 alu1Op = 5'b00000;
		 inst1RegWB = 1'b1;
	    end
    `STSP:
	    begin
		 alu1Op = 4'b00000;
		 inst1RegWB = 1'b1;
	    end
	 `JMP:
	   begin
		alu1Op = 5'b00000;
		branchTaken = 1;  //to keep things simple jmp is treated like a branch that is always taken
	   end
	 `BEQ:
	   begin
		  alu1Op = 5'b00001;
	     extendedInst = 1'b1;
		  inst1Branch = 1'b1;
		  rfReadPort1A = 1;		
		  rfReadPort1B = 1;		
	   end
	default: //nops
		begin
		dumbWire =1'b1;
		end
		//}
  endcase //end of case opCode1


//access memory with the PC??
//Determine A operand to send to ALU
  if (inst1Branch) begin
    alu1OpA = NPC;	 
  end
  else begin  
	 rfReadPort1A = 1;
    alu1OpA = inst1AReadData;
  end
	
//Determine B operand to send to ALU
//if (!opCode1 && (NOP || LDR || STR))  //if instruciton uses ALU
//begin
  if (inst1ImmInst) begin 
    alu1OpB = inst1Imm;
  end
  else if (inst1BImm)	begin	 
    alu1OpB = {11'b0, inst1BRegReadSel};		//use the reg sel value as small imm	  
  end
  else if (inst1Branch) begin  //if branch use the memory offset in the top isntruciton word
    alu1OpB = instExAddr;	
  end	
  else begin
   rfReadPort1B = 1;					//set read signal when required
   alu1OpB = inst1BReadData;
  end
  
  if (inst1Branch) begin  //if branch determine comparison opoerands
    branchOpA =inst1AReadData;
    if (inst1BImm) begin
      branchOpB = {11'b0,inst1BRegReadSel};
    end
    else begin
      branchOpB = inst1BReadData;
    end
	 
	 if (branchOpA === branchOpB) begin // do the comparison
	   branchTaken =1;
	 end
	 else begin
	   branchTaken =0;
    end
  end 	 	 
//determine which alu to use
  if (inst1Addr) begin			
    alu1Output = ({11'b0, inst1BRegReadSel} + instExAddr); //only supports positive offsets? Leave to programmer to deal with that
  end
  else begin
		alu1Output = alu1Result;
  end
  
	//write new PC
	//branch true or incremented PC
	
	//Write back to registers, using memory data or aluOutput
  if (inst1RegWB) begin	  
    if (inst1Ld) begin
	    dumbWire = 1'b1;
	 end
	 else begin
	   rfWritePort1 = 1;
	   inst1RegWriteSel = inst1ARegReadSel;
	   rfWriteData1 = {inst1RegWriteSel,alu1Output};
    end
  end
  
  if (branchTaken) begin
    NPCOut = alu1Output;
  end
  else begin
    NPCOut = NPC;
  end
end	
 
always @(posedge iClock)
begin
  if (dualInst) begin
      NPC = iPC + 6'd32; //increment by 32 bits
  end
  else begin
      NPC = iPC + 5'd16; //increment by 2 bits	
  end
	
end

//decodes and sets signal for instruction 2
//--decode instruction only if valid
//--check if extedned instruction
always@* begin
//initialise second side
  rfWritePort2 = 0;
  rfReadPort2A = 0;
  rfReadPort2B = 0; 
   
  inst2Ld = 0;
  inst2RegWB = 0;
  inst2ImmInst = 0;
  rfWriteData2 = 0;
  alu2Op = 5'b00000;
  alu2OpB = 0;
  alu2OpA = 0;
  inst2RegWriteSel = 0;
 
//end initilisation
  if (dualInst & ~extendedInst) begin
    case (inst2Op)	
  	   `ADDR:
	     begin	
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b00001; 
	     end
	   `ANDI:
	     begin
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b10000;
	     end
	   `ORI:
	     begin 
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b00100; 
	     end
	   `NOTI:
	     begin
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b01000; 
	     end
	   `XORI:
	     begin
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b00010; 
	     end
	   `MVR:
	     begin
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b00000; 
	     end
	   `MVI:
	     begin
	 	   inst2RegWB = 1'b1;
	       alu2Op = 5'b00000;
	       inst2ImmInst =1'b1;
	     end
	   `LDR:
	     begin
	 	    inst2RegWB = 1'b1;
	       alu2Op = 5'b00000;	     
	     end
	   `STR:
	      begin
	 	     alu2Op = 5'b00000;
	 	     inst2RegWB = 1'b1;
	      end
	   `PUSH:
	      begin
	 	     inst2RegWB = 1'b1;
	 	     alu2Op = 5'b00000;
	      end
	   `POP:	 
	      begin
	 	     alu2Op = 5'b00000;
	 	     inst2RegWB = 1'b1;
	      end
      `STSP:
	      begin
	 	     alu2Op = 5'b00000;
	 	     inst2RegWB = 1'b1;
	      end
	  default: //nops
		  begin
		    alu2Op = 5'b00000;
		    dumbWire =1'b1;
		  end
		//}
    endcase //end of case opCode1 
  
  //
//access memory with the PC??
//Determine A operand to send to ALU
    rfReadPort2A = 1;
    alu2OpA = inst2AReadData;  
	
//Determine B operand to send to ALU
//if (!opCode1 && (NOP || LDR || STR))  //if instruciton uses ALU
//begin
	  if (inst2ImmInst) begin 
	    alu2OpB = inst2Imm;
	  end
	  else if (inst2BImm)	begin	 
	    alu2OpB = {11'b0, inst2BRegReadSel};		//use the reg sel value as small imm	  
	  end	
	  else begin
	   rfReadPort2B = 1;					//set read signal when required
	   alu2OpB = inst2BReadData;
	  end
	  
//write alu output 
	  alu2Output = alu2Result;
     		  
//Write back to registers, using memory data or aluOutput
	  if (inst2RegWB) begin	  
	    if (inst2Ld) begin
	      dumbWire = 1'b1;
	    end
	    else 
	      rfWritePort2 = 1;
	  	   inst2RegWriteSel = inst2ARegReadSel;
	  	   rfWriteData2 = {inst2RegWriteSel,alu2Output};
	    end	
	end
 end // if dualInst 

endmodule


//{Register File instantiation

//}


//}
