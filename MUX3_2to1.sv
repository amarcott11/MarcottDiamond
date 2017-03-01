module MUX3_2to1 (input [2:0] IN0, IN1, 
						 input logic Select,
						 output logic [2:0] OUT);
						 
			always_comb
			
			begin
				case(Select)
				1'b1:
					OUT = IN1;
				1'b0:
					OUT = IN0;
				endcase
			end
						 
endmodule