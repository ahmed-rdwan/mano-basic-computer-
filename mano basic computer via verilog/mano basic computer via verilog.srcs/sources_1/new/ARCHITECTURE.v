 module ARCHITECTURE(
 
input clk,
output wire [7:0] dr_out, ac_out, ir_out, mem_out,
output wire [3:0] pc_out, ar_out,
output wire [7:0] D,
output  wire [5:0] T,
output  wire [2:0] SC_OUT,
output wire [7:0] out_mux,    
output wire [2:0] in_mux,
output wire J,
output  wire E,
output wire [7:0] X  );
     
	wire ar_inr, ar_load, ar_clr,
         pc_inr, pc_load, pc_clr,
         dr_inr, dr_load, dr_clr,
         ac_inr, ac_load, ac_clr,
         ir_inr, ir_load, ir_clr,
          CMA, LDA, ADD, AND,             
             writeR, readR,
                inr_sc,S,CME;
              
	           
	
	
	  wire CLR_sc=0;
	 
	
	wire [7:0] o1, o2, o3, o4, o5 ,o7;  // = d
	
	
	//                             BUS_SELECTION (mux) 
	
	
	/*                         000        001  010  011 100   101    110       111*/
	//  module BUS_SELECTION(none d0    ,  d1, d2, d3,  d4  , d5,  d6 (temp),  d7   ,  sel,    out);
	        BUS_SELECTION bus(8'bxxxxxxxx, o1, o2, o3,  o4,   o5,  8'b00000000, o7 , in_mux, out_mux);
	        
	 //   Encoder8_3 enc(in_mux,         X);     //   SELECTION mux??? ?????????? ??? ??           
	        
	        
	        
	        
	        
	        
	        
 	wire [7:0]mem_in;
	
	/* 
	
	module memory (CLK,READ,ar,    WRITE, INDATA, OUTDATA );*/
	memory RAMAT(clk, readR,ar_out,writeR,out_mux,mem_out);   
    assign o7 = mem_out; //111

   
   
   
       /* 
                                  
                                    ADRESS_REGISTER
                                    
                                    
     module ADRESS_REGISTER(Q,      INR,   Data,      LD, CLK, CLR)*/
        ADRESS_REGISTER ar (ar_out,ar_inr,out_mux,ar_load,clk,ar_clr);                    
         assign o1 =  ar_out;   //001  
                                                                    
           
      
    //                           PROGRAM_COUNTER
      
       wire [3:0] pc_in;
       
  // module PROGRAM_COUNTER( Q,      INR,   Data,    LD,   CLK, CLR,  );
        PROGRAM_COUNTER  pc(pc_out,pc_inr,out_mux,pc_load,clk,pc_clr); 
        assign o2 =  pc_out;  //010
        
           
           
           
                               //DATA_REGISTER
           
           
            wire [7:0]dr_in;
            
            
       //module DATA_REGISTER(Q,      INR,  Data,    LD,   CLK, CLR);
            DATA_REGISTER dr(dr_out,dr_inr,out_mux,dr_load,clk,dr_clr);             
            assign o3=dr_out; // 011
            
            
                
            
             
                
                //                ACCUMULATOR  
                               
                                     
                wire [7:0] ac_in;
                wire cout;
                
              //  module ACCUMULATOR(Q,   INR,  Data,    LD,  CLK, CLR);
                ACCUMULATOR ac   (ac_out,ac_inr,ac_in,ac_load,clk,ac_clr);  
                
                
           //module ALU(AND,ADD, LDA, CMA,E,AC    , DR,  CARRY ,ACDATA);
                ALU alu(AND,ADD, LDA, CMA,E,ac_out,dr_out,cout,  ac_in);  
                
                /*
                
                AND = D[0] & T[5];
                ADD = T[5] & D[1];
                LDA = T[5] & D[2];
                CMA = B[2] & r;   
                INR = B[0] & r;   
                CLR = r & B[3];   

wire [3:0]    B =     ir_out [3:0];
Decoder3_8 decode  (op_code,D[7:0]);

                */
                           
                assign o4 = ac_out;  //100  
                
                
                
                
                
                
                
                
           //                                INSTRUCTION_REGISTER
                
                    
            wire [7:0] ir_in;

//module INSTRUCTION_REGISTER(Q,    INR, Data,    LD,    CLK, CLR);
INSTRUCTION_REGISTER ir   (ir_out,ir_inr,out_mux,ir_load,clk,ir_clr);


   assign o5 = ir_out; //101 
   
   
   
   
                  





/*            control unit                                            */





CONTROLER cu( clk, T, cout, ir_out,                  
                ar_clr, ar_inr, ar_load,
                  pc_clr, pc_inr, pc_load,
                  dr_clr, dr_inr, dr_load,
                  ac_clr, ac_inr, ac_load,
                  ir_clr, ir_inr, ir_load,
                  writeR, readR,
                  CMA, LDA, ADD, AND,
                  CLR_sc,inr_sc,E,X,J,D,CME); 
                  
                  
               
               
               
               
               
               
                 //     Encoder8_3
               
               
      // Encoder8_3(Selction,        En_in);        // ???? x
      // x is one bit of 1
                                                
      Encoder8_3 enc(in_mux,         X);     //   SELECTION mux??? ?????????? ??? ?? 


/* // d0,d1,d2,d3,d4,d5,d6,d7,sel,out   
// d = O             USED ABOVE





*/





   assign inr_sc = ~CLR_sc;      
   
   
                        
      //           SequenceCounter 

//      module SequenceCounter(CLR,  CLK,  out);
          SequenceCounter scc (CLR_sc,clk,SC_OUT);
          
          
  //   module T_DECODER(Dec_in , Times);      
           T_DECODER code (SC_OUT,       T); 



endmodule