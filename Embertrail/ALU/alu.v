//embertrail ALU

//ALU OP one hot code
`define ALU_ADD 8'b00000001
`define ALU_AND 8'b00000010
`define ALU_OR  8'b00000100
`define ALU_NOT 8'b00001000
`define ALU_XOR 8'b00010000
`define ALU_SL  8'b00100000
`define ALU_SR  8'b01000000
`define ALU_CMP 8'b10000000

`define TRUE   16'h0001
`define FALSE  16'h0000

module alu (
  input wire iClock,
  input wire iReset,
  
  input wire [15:0] iOperandA,
  input wire [15:0] iOperandB,
  
  input wire [7:0] iOperation,
  
  output wire [15:0] oAluResult
  
);

  reg [15:0]
    aluOutput_d,
	 aluOutput_q;
	 
  assign oAluResult = aluOutput_q;
  
  always@* begin
    case (iOperation)
      `ALU_ADD:
        begin
  	       aluOutput_d = iOperandA + iOperandB;  
        end
      `ALU_XOR:
  	      begin
  	        aluOutput_d = iOperandA ^ iOperandB;
  	      end
      `ALU_OR:
  	      begin
  	        aluOutput_d = iOperandA | iOperandB;
  	      end
  	   `ALU_NOT:
  	       begin
  		      aluOutput_d = ~iOperandA;
  		    end
  	   `ALU_AND:
  	       begin
  		      aluOutput_d = iOperandA & iOperandB;
  		    end
  		`ALU_SL:
  	     begin
  		    aluOutput_d = iOperandA << iOperandB;
  		  end
  		`ALU_SR:
  	     begin
  		    aluOutput_d = iOperandA >> iOperandB;
  		  end
  		`ALU_CMP:
  	     begin
  		    if (iOperandA === iOperandB) begin
  		      aluOutput_d = `TRUE;
  		    end
  		    else begin
  		      aluOutput_d = `FALSE;
  		    end
  		  end
  	 default:	    
  	   begin
  	     aluOutput_d = `FALSE;
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