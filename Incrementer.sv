module Incrementer(input [15:0] PC_in,
						 output [15:0] PC_out);
						 
				assign PC_out = PC_in + 1'b1;
endmodule