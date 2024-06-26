module SequenceCounter_TB;

	wire INR;         
	reg CLK;           
	wire CLR;

	wire [2:0] out;    // Output signal from counter
	
    wire [7:0] T;
    reg [7:0] D;
    reg J;
    
	SequenceCounter SC (.INR(INR), .CLR(CLR), .CLK(CLK), .out(out));   // Instantiate dUT (data Under Test)
	SC_DESIGN(.CLR(CLR), .INR(INR),.T(T),.D(D),.J(J));
	Decoder3_8(out, T);


    always #10 CLK = ~CLK;
    
    initial begin
		CLK = 0;
		J = 0;
		D = 0;
		
		#60
		D [4] = 1;		
		
//	initial begin
// Part one: Initialize signals to zero and wait for 5 ns

//		LD = 0;
//		INC = 0;
//		//data = 3'b000;
//		CLK = 0;
//		#5; // Wait for 5 ns with all signals set to zero
		
//	// Part two: Load data into counter and wait for 5 ns
	
//		LD = 1;         // Assert load signal
//		//data = 3'b101;  // Load 101 into the counter
//		CLK = 1;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock high
	
//	// Part three: Increment counter and wait for 5 ns
	
//		LD = 0;         // Deassert load signal
//		INC = 1;        // Assert increment signal
//		CLK = 0;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock low
		
//	// Part four: Continue incrementing counter and wait for 5 ns between each toggle
	
//		CLK = 1;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock high
		
//		INC = 0;        // Deassert increment signal
//		CLK = 0;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock low

//		CLK = 1;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock high

//		INC = 1;        // Assert increment signal
//		CLK = 0;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock low

//		CLK = 1;        // Toggle clock signal
//		#5;            // Wait for 5 ns with clock high

//		$finish;        // End simulation
	end

endmodule
