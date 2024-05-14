module AC_DESIGN(AND, CMA, LDA, ADD, Load, INR, CLR, T, D, B, J,CME);

	input[7:0] D;
	input[5:0] T;
	input[3:0]B;
	input J;

	output Load, INR, CLR;
	output AND, CMA, LDA, ADD,CME;
	
	wire Jn = ~J;
	wire r = D[7] & Jn & T[3];
	
	
	assign AND = D[0] & T[5];  
	assign ADD = T[5] & D[1];  
	assign LDA = T[5] & D[2]; 
	assign CMA = B[3] & r;
	assign INR = B[2] & r;
	assign CLR = r & B[1];
	assign CME = r & B[0];
	assign Load =( AND | ADD | LDA  | CMA );  
    
endmodule
