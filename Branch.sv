module Branch(input Clk, Reset, LD_BEN,
				  input [2:0] IR,
				  input [2:0] NZP,
				  output logic BEN);
				  
		always_ff @ (posedge Clk)
		begin
				if(LD_BEN)
				begin
					if((IR[0]&NZP[0]) | (IR[1]&NZP[1]) | (IR[2]&NZP[2]))
						BEN = 1'b1;
					else
						BEN = 1'b0;
				end
				
				else if (Reset)
					BEN = 1'b0;
					
				else ;
		
		end
endmodule