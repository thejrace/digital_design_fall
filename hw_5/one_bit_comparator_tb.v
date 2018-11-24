`timescale 1ns / 1ps
module one_bit_comparator_tb;

    reg a;
    reg b;
    wire g;
    wire e;
    wire l;
    
    one_bit_comparator UUT (g,e,l,a,b);
        
    initial 
    begin
    
    a = 0;
    b = 0;
    
    repeat (3)
    #10 {a,b} = {a,b} + 1'b1;
    end
        
    initial  
    begin
    $display("\ttime \ta \tb \tg \te \tl"); 
    $monitor("\t%d \t%b \t%b \t%b \t%b \t%b",$time,a,b,g,e,l); 
    end	
      
endmodule
