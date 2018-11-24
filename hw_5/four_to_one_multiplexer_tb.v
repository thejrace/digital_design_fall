`timescale 1ns / 1ps
module four_to_one_multiplexer_tb;

    reg [3:0] in;
    reg [1:0] sel;
    wire out;
    
    four_to_one_multiplexer UUT (out,in,sel);
    
    initial 
    begin
    
    sel = 0;
    in = 0;
    
    repeat (63)
        #10 {sel,in} = {sel,in} + 1'b1;
    end
        
    initial  
    begin
    $display("              \ttime \tsel \tin \tout"); 
    $monitor("%d \t%b \t%b \t%b",$time,sel,in,out); 
    end
      
endmodule
