module Encoder8_3(Selction, En_in);

   input [7:0] En_in;
   output [2:0] Selction;

   assign Selction =
      (En_in[7] == 1'b1) ? 3'b111:      
      (En_in[6] == 1'b1) ? 3'b110:
      (En_in[5] == 1'b1) ? 3'b101:
      (En_in[4] == 1'b1) ? 3'b100:
      (En_in[3] == 1'b1) ? 3'b011:
      (En_in[2] == 1'b1) ? 3'b010:
      (En_in[1] == 1'b1) ? 3'b001:
      (En_in[0] == 1'b1) ? 3'b000: 3'bxxx;

endmodule

/*                                                                              
                 //     Encoder8_3                                                            
                                                                                              
                                                                                              
      // Encoder8_3(Selction,        En_in);        // ???? x                                   
      // x is one bit of 1                                                                    
                                                                                              
      Encoder8_3 enc(in_mux,         X);     //   SELECTION mux??? ?????????? ??? ??          
                                                                                              
                                                                                              
// d0,d1,d2,d3,d4,d5,d6,d7,sel,out                                                         
// d = O             USED ABOVE                                                               
                                                                                              
                                                                                              

*/
