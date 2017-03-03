module datapath(input logic Clk, Reset, 
							 LD_PC, LD_MAR, LD_MDR, LD_IR, LD_REG,
							 MIO_EN, LD_CC, LD_BEN,
							 GatePC, GateMARMUX, GateALU, GateMDR,
							 DRMUX, SR1MUX, SR2MUX, ADDR1MUX, 
					 input logic [1:0] PCMUX, ALUK, ADDR2MUX,
					 input logic [15:0] MDR_In,
					 output BEN,
					 output logic [15:0] IR_out, 
					 output logic [15:0] MAR_out, 
					 output logic [15:0] MDR_out);


logic [15:0] PC_increment, PCMUX_out, PC_out, Data_Bus,
				SR1_in, SR2_in, ALU_bus, SR2_out, SR2MUX_out, SR1_out,
				MDRMUX_out, ADDR2MUX_out, ADDR1MUX_out, ADDER_out, SEXT11_out, SEXT9_out, SEXT6_out, Immediate;


logic [2:0] NZP_out, SR1MUX_out, DRMUX_out;
				
	// Initialize 16-bit data bus

	MUX16_BUS   BUS_MUX(.*,
								.PC_bus(PC_out),
								.MDR_bus(MDR_out),
								.MARMUX_bus(ADDER_out),
								.ALU_bus(ALU_bus),
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
							.IN01(ADDER_out),
							.IN10(Data_Bus),
							.IN11(0),
							.Select(PCMUX),
							.OUT(PCMUX_out));
							
	MUX16_2to1  MUXMDR(.*,
							 .IN0(Data_Bus),
							 .IN1(MDR_In),
							 .Select(MIO_EN),
							 .OUT(MDRMUX_out));
							 
	MUX16_2to1	MUXSR2(.IN0(SR2_out), .IN1(Immediate), .Select(SR2MUX), .OUT(SR2MUX_out));
							 
	MUX3_2to1	MUXDR(.IN0(IR_out[11:9]), .IN1(3'b111), .Select(DRMUX), .OUT(DRMUX_out));
	
	MUX3_2to1	MUXSR1(.IN0(IR_out[8:6]), .IN1(IR_out[11:9]), .Select(SR1MUX), .OUT(SR1MUX_out));
	
	MUX16_2to1	MUXADDR1(.IN0(PC_out), .IN1(SR1_out), .Select(ADDR1MUX), .OUT(ADDR1MUX_out));
	
	MUX16_4to1	MUXADDR2(.IN00(16'b0000000000000000), .IN01(SEXT6_out), .IN10(SEXT9_out), .IN11(SEXT11_out), .Select(ADDR2MUX), .OUT(ADDR2MUX_out));
							
	// Initialize PC Incrementer
	
	Incrementer PCplusplus(.PC_in(PC_out),
								  .PC_out(PC_increment));
							
							
	// Initialize components required for memory
	
	RegFile RegisterFile(.Clk(Clk), .Reset(Reset), .LD_REG(LD_REG), 
								.DRMUX_out(DRMUX_out), .SR2_in(SR2_in), .SR1MUX_out(SR1MUX_out),
								.Data(Data_Bus), .SR2_out(SR2_out), .SR1_out(SR1_out));
								
								
	// Initialize ALU
	
	ALU ALU1(.SR2MUX_out(SR2MUX_out), .SR1_out(SR1_out),
			   .ALUK(ALUK), .ALU_bus(ALU_bus));
		
	// Init Adder	
	
	Adder add1(.ADDR2MUX_out(ADDR2MUX_out), .ADDR1MUX_out(ADDR1MUX_out), .ADDER_out(ADDER_out));
		
	// Branch Logic
	
	NZP nzp(.Clk(Clk), .Reset(Reset), .Load(LD_CC), .Data(Data_Bus), .NZP_out(NZP_out));
	
	Branch brben(.LD_BEN(LD_BEN), .Clk(Clk), .Reset(Reset), .IR(IR_out[11:9]), .NZP(NZP_out), .BEN(BEN));
	
	// Sign Extensions
	
	SEXT11 sexty(.SEXT11_in(IR_out[10:0]), .SEXT11_out(SEXT11_out));
	
	SEXT9 sextier(.SEXT9_in(IR_out[8:0]), .SEXT9_out(SEXT9_out));
	
	SEXT6 sextiest(.SEXT6_in(IR_out[5:0]), .SEXT6_out(SEXT6_out));

	SEXT5 sex(.SEXT5_in(IR_out[4:0]), .SEXT5_out(Immediate));
	
endmodule