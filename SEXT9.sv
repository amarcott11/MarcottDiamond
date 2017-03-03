module SEXT9(input [8:0] SEXT9_in,
					output logic [15:0] SEXT9_out);
			
			always_comb
			begin
				if(SEXT9_in[8] == 1'b0)
					SEXT9_out = 16'h0000 + SEXT9_in;
				else
					SEXT9_out = 16'b1111111000000000 + SEXT9_in;
			end
					
endmodule