module NZP(input [15:0] Data,
			  input Clk, Load, Reset,
			  output logic [2:0] NZP_out);
			  
		always_ff @ (posedge Clk)
		begin
				if(Reset)
					NZP_out <= 3'b000;
					
				else if(Load)
					begin
						if(Data == 16'b0000000000000000)
							NZP_out <= 3'b010;
						else if(Data[15] == 1'b0)
							NZP_out <= 3'b001;
						else if(Data[15] == 1'b1)
							NZP_out <= 3'b100;
						else
							NZP_out <= 3'b000;
					end
					
				else ;
		end
		
endmodule