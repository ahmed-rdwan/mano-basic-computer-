module memory (CLK,READ,ar,WRITE,INDATA,OUTDATA );
    input CLK,READ,WRITE;
    input [7:0]INDATA;
    input [3:0] ar;
    output reg [7:0] OUTDATA;
    
    reg [7:0] RAM [15:0];
        
   initial
         begin
         
           RAM[0] = 8'h2f ;
           RAM[1] = 8'h0e ;
           RAM[2] = 8'h1d ;
           RAM[3] = 8'h74 ;
           RAM[4] = 8'h78 ;
           RAM[5] = 8'h72 ;
           RAM[6] = 8'h71 ;
           RAM[7] = 8'h00 ;
           RAM[8] = 8'h00 ;
           RAM[9] = 8'h00 ;
           RAM[10]= 8'h00 ;
           RAM[11]= 8'h00 ;
           RAM[12]= 8'h00 ;
           RAM[13]= 8'h2f ;
           RAM[14]= 8'hb9 ;
           RAM[15]= 8'h45 ;
      
       
       
    // $readmemh("A:\INSTRUCTIONS.txt",RAM);
    end
    
   always @ *
    begin
        if (WRITE)
            RAM[ar] <= INDATA;
        else if(READ)
            OUTDATA = RAM[ar];
        end

endmodule