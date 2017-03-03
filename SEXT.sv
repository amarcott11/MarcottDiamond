module SEXT11(input [10:0] SEXT11_in,
					output logic [15:0] SEXT11_out);
			
			always_comb
			begin
				if(SEXT11_in[10] == 1'b0)
					SEXT11_out = 16'h0000 + SEXT11_in;
				else
					SEXT11_out = 16'b1111100000000000 + SEXT11_in;
			end
					
endmodule

