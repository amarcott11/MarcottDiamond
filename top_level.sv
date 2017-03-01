module top_level(input logic [15:0] S,
	input logic	Clk, Reset, Run, Continue,
	output logic [11:0] LED,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3
);

	logic CE, UB, LB, OE, WE;
	logic [19:0] ADDR;
   wire [15:0] IOmem;
	
//	slc3 processor1(.*,
//							.S,
//							.Clk(Clk), .Reset(~Reset), .Run(~Run), .Continue(~Continue),
//							.ADDR(ADDR), .Data(IOmem));
//	
	test_memory test_memory0(
	.Clk(Clk), .Reset(~Reset),
	.I_O(IOmem), .A(ADDR),
	.*
	);

slc3 processor1(.S(S), .Clk(Clk), .Reset(Reset), .Run(Run), .Continue(Continue), .LED(LED),
	.HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .CE(CE), .UB(UB), .LB(LB), .OE(OE), .WE(WE), .ADDR(ADDR),
	.Data(IOmem));
	
endmodule