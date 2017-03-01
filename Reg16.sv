module Reg16(input Clk, Reset, Load,
				 input [15:0] D_in,
				 output logic [15:0] D_out);
			
			always_ff @ (posedge Clk)
			
			begin
			
				if(Reset)
					D_out <= 16'h0000;
				else if(Load)
					D_out <= D_in;
			
			end
				 
endmodule