`timescale 1ns/1ps

module ACCUMULATOR_tb;

    
    reg [7:0] Data;
    reg INR, LD, CLK, CLR;
    
    
    wire [7:0] Q;
    
    // Instantiate the ac [data under test]
    ACCUMULATOR dut (
        .Q(Q),
        .Data(Data),
        .INR(INR),
        .LD(LD),
        .CLK(CLK),
        .CLR(CLR)
    );
    
    // Clock 
    always #5 CLK = ~CLK;
    
        
    
        initial begin
            CLR = 0;
            LD = 0;
            CLK = 0;
            INR = 0;
            // Reset the module
            Data = 8'h14;
            LD = 1;
            #10;
            LD = 0;
            INR = 1;
            #10;
            INR = 0;
            CLR = 1;
            /*
            // Load data into Q
            CLR = 1;
            Data = 16'h1234;
            #10;
            CLR = 0;
            
            // Increment Q
            INR = 1;
            #5;
            INR = 0;
            
            // Wait for Q to update
            #5;
     */
     end

endmodule
