module ButtonSync (input Clk, IN,
						 output logic OUT);
			always_ff @ (posedge Clk)
			begin
				OUT <= IN;
			end
			
endmodule


module Sync0 (input Clk, Reset, IN,
					output logic OUT);
					
			always_ff @ (posedge Clk)
			begin
				if(Reset)
					OUT <= 1'b0;
				else
					OUT <= IN;
			end
endmodule

module Sync1 (input Clk, Reset, IN,
					output logic OUT);
					
			always_ff @ (posedge Clk)
			begin
				if(Reset)
					OUT <= 1'b1;
				else
					OUT <= IN;
			end
endmodule
			