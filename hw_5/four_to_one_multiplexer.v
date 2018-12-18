/***** Obarey Inc. *****/   
module four_to_one_multiplexer(y,x,s);
    input [1:0] s;
    input [3:0] x;
    output y;
    
    assign y = (x[0] & ~s[1] & ~s[0]) | (x[1] & ~s[1] & s[0]) | (x[2] & s[1] & ~s[0]) | (x[3] & s[1] & s[0]);
endmodule

/* test bench ( tested on Vivado )
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
*/