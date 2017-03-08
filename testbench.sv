module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset, Run, Continue;
logic [15:0] S;
logic [11:0] LED;
logic [15:0] IR, PC, MAR, MDR;
logic [6:0]  HEX0,
				 HEX1,
				 HEX2,
				 HEX3;
//logic CE, UB, LB, OE, WE;
//logic [19:0] ADDR;
//wire [15:0] Data;

assign MAR = processor0.processor1.d0.MAR_out;
assign MDR = processor0.processor1.d0.MDR_out;
assign PC = processor0.processor1.d0.PC_out;
assign IR = processor0.processor1.d0.IR_out;

// Instantiating 
// Make sure the module and signal names match with those in your design
top_level processor0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset = 0;		// Toggle Rest
Run = 1;
Continue = 1;
S = 16'b0000000000000011;

#4 Reset = 1;

#4 Run = 0;	
   
#4 Run = 1;

#60 Continue = 0;
#4 Continue = 1;
#60 Continue = 0;
#4 Continue = 1;
#60 Continue = 0;
#4 Continue = 1;
#60 Continue = 0;
#4 Continue = 1;

#100 S = 16'b0000000000000001;

#100 S = 16'b0000000000000010;

end
endmodule