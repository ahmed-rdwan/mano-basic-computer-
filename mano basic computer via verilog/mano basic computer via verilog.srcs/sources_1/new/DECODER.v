module T_DECODER(Dec_in , Times);
  
  input [2:0] Dec_in;
  output wire [7:0] Times;



  
  assign Times = (Dec_in == 3'b000) ? 8'h01 :
                          (Dec_in == 3'b001) ? 8'h02 :
                          (Dec_in == 3'b010) ? 8'h04 :
                          (Dec_in == 3'b011) ? 8'h08 :
                          (Dec_in == 3'b100) ? 8'h10 :
                          (Dec_in == 3'b101) ? 8'h20 :
                          (Dec_in == 3'b110) ? 8'h40 :
                          (Dec_in == 3'b111) ? 8'h80 :8'hxx;
                         
                      
endmodule