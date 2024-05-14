module PROGRAM_COUNTER_tb;

	// Inputs
	reg [7:0] Data;
	reg INR,CLK;

	// Outputs
	wire [7:0] Q;

	// Instantiate the Unit Under Test (UUT)
	PROGRAM_COUNTER uut (Q,INR,Data,CLK);

	
	
endmodule