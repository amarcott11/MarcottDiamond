module RegFile(input Clk, Reset, LD_REG,
					input [2:0] DRMUX_out,
					input [2:0] SR2_in,
					input [2:0] SR1MUX_out,
					input [15:0] Data,
					output logic [15:0] SR2_out,
					output logic [15:0] SR1_out);
					
			logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7;
			
			
			always_ff @ (posedge Clk)
			begin
					if(Reset)
						begin
						R0 <= 16'b0;
						R1 <= 16'b0;
						R2 <= 16'b0;
						R3 <= 16'b0;
						R4 <= 16'b0;
						R5 <= 16'b0;
						R6 <= 16'b0;
						R7 <= 16'b0;
						end
						
					else if(LD_REG)
						begin
						case(DRMUX_out)
							
							3'b000:
								R0 <= Data;
								
							3'b001:
								R1 <= Data;
								
							3'b010:
								R2 <= Data;
								
							3'b011:
								R3 <= Data;
								
							3'b100:
								R4 <= Data;
								
							3'b101:
								R5 <= Data;
								
							3'b110:
								R6 <= Data;
								
							3'b111:
								R7 <= Data;
								
							default: ;
							
							endcase
							end
					end
					
			always_comb
					begin		
					case(SR1MUX_out)
						
							3'b000:
								SR1_out = R0;
								
							3'b001:
								SR1_out = R1;
								
							3'b010:
								SR1_out = R2;
								
							3'b011:
								SR1_out = R3;
								
							3'b100:
								SR1_out = R4;
								
							3'b101:
								SR1_out = R5;
								
							3'b110:
								SR1_out = R6;
								
							3'b111:
								SR1_out = R7;
								
							default: ;
							
					endcase
					
					case(SR2_in)
						
							3'b000:
								SR2_out = R0;
								
							3'b001:
								SR2_out = R1;
								
							3'b010:
								SR2_out = R2;
								
							3'b011:
								SR2_out = R3;
								
							3'b100:
								SR2_out = R4;
								
							3'b101:
								SR2_out = R5;
								
							3'b110:
								SR2_out = R6;
								
							3'b111:
								SR2_out = R7;
								
							default: ;
							
					endcase
					end
							
endmodule
