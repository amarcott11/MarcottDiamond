module Incrementer(input [15:0] PC_in,
						 output logic [15:0] PC_out);
						 
				assign PC_out = PC_in + 1'b1;
endmodule

module Adder(input [15:0] ADDR2MUX_out,
				 input [15:0] ADDR1MUX_out,
				 output logic [15:0] ADDER_out);
			
			always_comb
			begin
					ADDER_out = ADDR2MUX_out + ADDR1MUX_out;
			end
				 
endmodule