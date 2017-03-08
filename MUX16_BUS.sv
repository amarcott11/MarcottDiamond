module MUX16_BUS (input logic [15:0] PC_bus, MARMUX_bus, ALU_bus, MDR_bus,
						input logic PC_enable, MARMUX_enable, MDR_enable, ALU_enable,
						output logic [15:0] DataBus);
						
			always_comb

			begin
				if(PC_enable)
					DataBus = PC_bus;
					
				else if(MARMUX_enable)
					DataBus = MARMUX_bus;
				
				else if(MDR_enable)
					DataBus = MDR_bus;
				
				else if(ALU_enable)
					DataBus = ALU_bus;
					
				else
					DataBus = 16'h0000;
			end
			
						
endmodule
