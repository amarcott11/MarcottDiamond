module MUX16_3to1 (input [15:0] IN00, IN01, IN10,
						 input [1:0] Select,
						 output [15:0] OUT);
						 
			always_comb
			begin
				case(Select)
				2'b00:
					OUT = IN00;
				2'b01:
					OUT = IN01;
				2'b10:
					OUT = IN10;
				default: OUT = 4'h0000;
				endcase	
			end
endmodule