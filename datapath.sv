module datapath(input logic Clk, Reset, 
							 LD_PC, LD_MAR, LD_MDR, LD_IR, LD_REG,
							 MIO_EN,
							 GatePC, GateMARMUX, GateALU, GateMDR,
					 input logic [1:0] PCMUX,
					 input logic [15:0] MDR_In,
					 output logic [15:0] IR_out, 
					 output logic [15:0] MAR_out, 
					 output logic [15:0] MDR_out);


logic [15:0] PC_increment, PCMUX_out, PC_out, Data_Bus,
				MDRMUX_out;

	// Initialize 16-bit data bus

	MUX16_BUS   BUS_MUX(.*,
								.PC_bus(PC_out),
								.MDR_bus(MDR_out),
								.MARMUX_bus(0),
								.ALU_bus(0),
								.PC_enable(GatePC),
								.MARMUX_enable(GateMARMUX),
								.MDR_enable(GateMDR),
								.ALU_enable(GateALU),
								.DataBus(Data_Bus));
								
								
	// Initialize all necessary registers

	Reg16 		PCreg(.*,
							.Load(LD_PC),
							.D_in(PCMUX_out),
							.D_out(PC_out));
							
	Reg16			MARreg(.*,
							 .Load(LD_MAR),
							 .D_in(Data_Bus),
							 .D_out(MAR_out));
							 
	Reg16			MDRreg(.*,
							 .Load(LD_MDR),
							 .D_in(MDRMUX_out),
							 .D_out(MDR_out));
							 
	Reg16			IRreg(.*,
							.Load(LD_IR),
							.D_in(Data_Bus),
							.D_out(IR_out));
							
							
	// Initialize all necessary MUXes
	
	MUX16_4to1  MUXPC(.*,
							.IN00(PC_increment),
							.IN01(0),
							.IN10(0),
							.IN11(0),
							.Select(PCMUX),
							.OUT(PCMUX_out));
							
	MUX16_2to1  MUXMDR(.*,
							 .IN0(Data_Bus),
							 .IN1(MDR_In),
							 .Select(MIO_EN),
							 .OUT(MDRMUX_out));
							 
	MUX3_2to1	DRMUX(.IN0(), .IN1())
							
	// Initialize PC Incrementer
	
	Incrementer PCplusplus(.PC_in(PC_out),
								  .PC_out(PC_increment));
							
							
	// Initialize components required for memory
	RegFile RegisterFile(.Clk(Clk), .Reset(Reset), .LD_REG(LD_REG), 
								.DRMUX_out(DRMUX_out), .SR2_in(SR2_in), .SR1MUX_out(SR1MUX_out),
								.Data(Data_Bus), .SR2_out(SR2_out), .SR1_out(SR1_out));
		
		
	

endmodule