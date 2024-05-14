`timescale 1 ns / 1 ps

module ARCHITECTURE_tb;

wire [7:0] dr_out, ac_out, ir_out, mem_out;
wire [3:0] pc_out, ar_out;
wire [7:0] D;
wire [5:0] Timer;
wire [2:0] SC;
wire [7:0] mux_out;
wire [2:0] s;
wire [7:0] x;
wire J;
wire E;

reg CLK;

ARCHITECTURE ARCH(CLK,
     dr_out, ac_out, ir_out, mem_out,
     pc_out, ar_out,
     D, Timer,
     SC,
     mux_out,
     J,
     E,
     x,
     E
     ); 
     
     initial CLK = 0; 
     
    always begin
         CLK = 0; #5; CLK = 1; #5;
     end




endmodule

