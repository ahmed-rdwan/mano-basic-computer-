module BUS_SELECTION(d0,d1,d2,d3,d4,d5,d6,d7,sel,out); //MUX
                                         
                 //wire [7:0] o1, o2, o3, o4, o5 ,o7;  // = d   
/*
o7 = mem_out;        //111
o5 = ir_out;         //101 
o4 = ac_out;        //100  
o3=dr_out;          //011
o2 =  pc_out;       //010 
o1 =  ar_out;       //001 
 */

	input [7:0] d0,d1,d2,d3,d4,d5,d6,d7;
	input [2:0] sel;
	output reg [7:0] out;

	always @* begin
		case(sel)
			3'b000: out = d0;
			3'b001: out = d1;
			3'b010: out = d2;   
			3'b011: out = d3;
			3'b100: out = d4;
			3'b101: out = d5;
			3'b110: out = d6;
			3'b111: out = d7;
		endcase
	end

endmodule
