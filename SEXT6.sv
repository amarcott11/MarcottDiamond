module SEXT6(input [5:0] SEXT6_in,
					output logic [15:0] SEXT6_out);
			
			always_comb
			begin
				if(SEXT6_in[5] == 1'b0)
					SEXT6_out = 16'h0000 + SEXT6_in;
				else
					SEXT6_out = 16'b1111111111000000 + SEXT6_in;
			end
					
endmodule