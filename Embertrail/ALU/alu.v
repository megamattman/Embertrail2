//embertrail ALU

`define ADDAB 5'b00001
`define XORAB 5'b00010
`define ORAB  5'b00100
`define NOTAB 5'b01000
`define ANDAB 5'b10000
`define NONE  5'b00000

module alu (
  input wire iClock,
  input wire iReset,
  
  input wire [15:0] iOperandA,
  input wire [15:0] iOperandB,
  
  input wire [4:0] iOperation,
  
  output wire [15:0] oAluResult
  
);

  reg [15:0]
    aluOutput_d,
	 aluOutput_q;
	 
  assign oAluResult = aluOutput_q;
  
  
  
  always@* begin
  case (iOperation)
  `ADDAB:
    begin
	   aluOutput_d = iOperandA + iOperandB;  
    end
	`XORAB:
	  begin
	    aluOutput_d = iOperandA ^ iOperandB;
	  end
	`ORAB:
	  begin
	    aluOutput_d = iOperandA | iOperandB;
	  end
	 `NOTAB:
	   begin
		  aluOutput_d = ~iOperandA;
		end
	  `ANDAB:
	    begin
		   aluOutput_d = iOperandA & iOperandB;
		 end
	  default:
	    begin
		   aluOutput_d = iOperandB;
		 end	
  endcase
  
  end
    always@(posedge iClock) begin
	   if (iReset) begin
		  aluOutput_q <= 0;
		end
		else begin		  
	     aluOutput_q <= aluOutput_d;
		end
	 end
  
endmodule