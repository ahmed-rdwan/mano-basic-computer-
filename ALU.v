module ALU(AND,ADD, LDA, CMA,E,AC, DR,CARRY , ACDATA);
    input AND,ADD, LDA, CMA,E;    
    input [7:0] AC, DR;
    
    output CARRY ;
    output [7:0]  ACDATA;
    
    wire [7:0] and8,add8,lda8,cma8;    
   
    wire [7:0] AND1,AND2,AND3,AND4 ,SUM;         
    wire CARRY;
    wire cout;
   
   
   
   // AND        ANDING AC WITH DR
    assign and8 = (AND ? 8'hff :8'b0);
	assign AND1 = AC & and8 & DR;
	
	
	
	// ADD   ADDING AC WITH SR
	
	assign {CARRY,SUM} = AC + DR ;
	assign cout = CARRY;
	assign add8= (ADD ? 8'hff :8'b0);
        assign AND2 = SUM & add8 ;
	
	
	// LDA LOAD    AC
	
	assign lda8 = (LDA ? 8'hff :8'b0);
	assign AND3 = lda8 & DR ;
	
	//CMA            COMPLEMENT ACUMULATOR
	assign cma8 = (CMA ? 8'hff : 8'b0);
	assign AND4 = (~AC) & cma8;
	
	
		
      
	
    assign ACDATA = AND1 | AND2| AND3| AND4;    
endmodule
