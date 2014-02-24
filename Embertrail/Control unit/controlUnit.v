
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

module ctrl_m (

input wire [31:0] IR,
input wire [15:0] PC,

output wire [4:0]oInst1AReg,
output wire [4:0]oInst1BReg,
output wire [4:0]oInst2AReg,
output wire [4:0]oInst2BReg
	
);
	 
//wire definitions
  wire
    inst1BImm,
    inst2BImm,
    dualInst,
    inst1ImmInst,
    inst2ImmInst;
	 
  reg 
    extendedInst, 
    rfReadPort1A,
    rfReadPort1B,
    rfReadPort2A,
    rfReadPort2B,  
    rfWritePort1,
    rfWritePort2;

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
    alu2Result; 
  
  reg [15:0]
    alu1OpA,
    alu1OpB,
    alu2OpA,
    alu2OpB,
    NPC;
  
//first isntruction packet
  assign inst1Op		  = IR[3:0];
  assign inst1ARegReadSel = IR[8:4];
  assign inst1BRegReadSel = IR[13:9];
  assign inst1Imm 		  = IR[13:10];
  assign inst1BImm 		  = IR[14];
  assign dualInst 		  = IR [15];
  assign inst1ImmInst	  = IR[3:0] && `MVI;
  
  //second isntruction packet, bit 31 is ignored  
  assign inst2Op		  = IR[19:16];
  assign inst2ARegReadSel = IR[24:20];
  assign inst2BRegReadSel = IR[29:25];
  assign inst2Imm 		  = IR[29:20];
  assign inst2BImm 		  = IR[30];
  assign inst2ImmInst	  = (inst2Op && `MVI);
  
  //decodes and set signals for instruction 1
always@(*)
begin : instDecode_l
//first set all signals to zero!

//end of initialisation
  extendedInst = 0;
//rf control
  rfReadPort1A = 0;
  rfReadPort1B = 0;
  rfReadPort2A = 0;
  rfReadPort2B = 0;  
  rfWritePort1 = 0;
  rfWritePort2 = 0;
//
//access memory with the PC??
//Determine A operand to send to ALU
  if (inst1Op && /*4'b1111*/`BEQ) begin
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
	  rfReadPort1B = 1;
	  alu1OpB = inst1BRegReadSel;		//use the reg sel value as small imm	  
	end
	else begin
	  alu1OpB = inst1BReadData;
	end
//end
	if (~extendedInst) begin
	  case (inst1Op)
	    //if branch cond = true
		//if load instruciton = true
		default:
		  begin
		    rfWritePort1 = 1;
		  end
		    
	  endcase
	end
end
	
endmodule
 
  //{isntruciton switch statment
/*	case (opCode1)	  
	  ADDR:
	    begin		
	    end
	  AND:
	    begin
	    end
	  OR:
	    begin 
	    end
	  NOT:
	    begin
	    end
	  XOR:
	    begin
	    end
	  MVR:
	    begin
	    end
	  MVI:
	    begin
	    end
	  LDR:
	    begin
	    end
	  LDA:
	    begin
			extendedInst = 1;
	    end
	  STR:
	    begin
	    end
	  PUSH:
	    begin
	    end
	  POP:
	    begin
	    end
	  STSP:
	    begin
	    end
	 JMP:
	   begin
	   end
	 BEQ:
	   begin
	     extendedInst = 1;
	   end
	Default: //nops
		begin
		end
		//}
endcase //end of case opCode1

//decodes and sets signal for instruction 2
/*always(*)
begin
/*	if (dualInst)
	begin
	  case (opCode2)
	    ADDR:
	      begin
	      end
	    AND:
	      begin
	      end
	    OR:
	      begin 
	      end
	    NOT:
	      begin
	      end
	    XOR:
	      begin
	      end
	    MVR:
	      begin
	      end
	    MVI:
	      begin
	      end
	    LDR:
	      begin
	      end
	    STR:
	      begin
	      end
	    PUSH:
	      begin
	      end
	    POP:
	      begin
	      end
	    STSP:
	      begin
	      end
	   JMP:
	     begin
	     end
	endcase
  end
end

always (@posedge)
begin
  if (dualInst)
    begin
      NPC = PC + 6'd32; //increment by 32 bits
	end
  else
    begin
      NPC = PC + 5'd16 //increment by 2 bits	
	end
	
end
}
//{Register File instantiation
REGFILE RF (

//control
  .iReadport1A(rfReadPort1A),
  .iReadPort1B(rfReadPort1B),
  .iReadPort2A(rfReadPort2A),
  .iReadPort2B(rfReadPort2B),

  .oWritePort1(rfWritePort1),
  .oWritePort2(rfWritePort2),
  
//read ports
  .iRegReadSel1A(inst1ARegReadSel),
  .iRegReadSel1B(inst1BRegReadSel),
  .iRegReadSel2A(inst2ARegReadSel),
  .iRegReadSel2B(inst2BRegReadSel),
  	
  .oRead1AData(inst1AReadData),
  .oRead1BData(inst1BReadData),
  .oRead2AData(inst2AReadData),
  .oRead2BData(inst2BReadData)
	
//write
	.iRegWrite1([inst1WriteRegSel, alu1Result]),	
	.iRegWrite2([inst2WriteRegSel, alu2Result])	
);
//}
//{Alu instantiations
ALU A1 (
  .iOperandA(alu1OpA),
  .iOperandB(alu1OpB)
  .iOpcode(inst1Op),
  
  .oAluResult(alu1Result)
);
ALU A2 (
  .iOperandA(alu1OpA),
  .iOperandB(alu1OpB)
  .iOpcode(inst1Op),
  
  .oAluResult(alu1Result)
);
//}
*/