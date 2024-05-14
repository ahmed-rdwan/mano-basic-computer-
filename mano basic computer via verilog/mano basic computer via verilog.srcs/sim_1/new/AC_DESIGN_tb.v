`timescale 1ns / 1ps

module AC_DESIGN_tb;

    // Inputs
    reg[5:0] T;
    reg[7:0] D;
    reg[3:0] B;
    reg J;

    // Outputs
    wire AND;
    wire CMA;
    wire LDA;
    wire ADD;
    wire Load;
    wire INR;
    wire CLR;

    // Instantiate AC_DESIGN
    AC_DESIGN  UUT (
        .AND(AND),
        .CMA(CMA),
        .LDA(LDA),
        .ADD(ADD),
        .Load(Load),
        .INR(INR),
        .CLR(CLR),
        .T(T),
        .D(D),
        .B(B),
        .J(J)
    );

    initial begin
        // Initialize inputs
        T = 6'b00000;
        D = 8'b00000000;
        B = 4'b0000;
        J = 0;
        #10;
                // Test CMA  r = D7 & T3 & Jn
     T = 6'b0001000;
     D = 8'b10000000;
     B = 4'b0100;
     J= 0;  // NOT 0 = 1
     #10;
       end 
endmodule
