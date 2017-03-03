module ALU(input [15:0] SR2MUX_out,
			  input [15:0] SR1_out,
			  input [1:0] ALUK,
			  output logic [15:0] ALU_bus);
			  
		always_comb
		begin
			case(ALUK)
				2'b00:
					ALU_bus = SR1_out + SR2MUX_out;
				2'b01:
					ALU_bus = SR1_out & SR2MUX_out;
				2'b10:
					ALU_bus = ~SR1_out;
				2'b11:
					ALU_bus = SR1_out;
				default:	ALU_bus = SR1_out;
			endcase
		end
			  
endmodule