module ADRESS_REGISTER(Q, INR, Data, LD, CLK, CLR);

	output reg [3:0] Q;
	input [3:0] Data;
	input INR, LD, CLK, CLR;
	
	initial Q = 0;
	
	always @(posedge CLK)
	
	begin
		if(CLR)
			Q <= 4'b0;
		else if(LD)
			Q <= Data;
		else if(INR)
			Q <= Q + 1;
	end
	
endmodule