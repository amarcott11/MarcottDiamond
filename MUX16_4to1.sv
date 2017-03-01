module MUX16_4to1 (input logic [15:0] IN00, IN01, IN10, IN11,
						 input logic [1:0] Select,
						 output logic [15:0] OUT);
						 
			always_comb
			begin
				case(Select)
				2'b00:
					OUT = IN00;
				2'b01:
					OUT = IN01;
				2'b10:
					OUT = IN10;
				2'b11:
					OUT = IN11;
				default: ;
				endcase	
			end
				
endmodule