`timescale 1ns / 1ps
    module four_to_one_multiplexer(y,x,s);
    input [1:0] s;
    input [3:0] x;
    output y;
    
    assign y = (x[0] & ~s[1] & ~s[0]) | (x[1] & ~s[1] & s[0]) | (x[2] & s[1] & ~s[0]) | (x[3] & s[1] & s[0]);
endmodule