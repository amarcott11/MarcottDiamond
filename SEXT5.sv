module SEXT5(input [4:0] SEXT5_in,
					output logic [15:0] SEXT5_out);
			
			always_comb
			begin
				if(SEXT5_in[4] == 1'b0)
					SEXT5_out = 16'h0000 + SEXT5_in;
				else
					SEXT5_out = 16'b1111111111100000 + SEXT5_in;
			end
					
endmodule