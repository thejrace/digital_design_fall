`timescale 1ns / 1ps
    module one_bit_comparator(g,e,l,x,y);

    input  x,y;
    output g,e,l; 
    
    assign g = x & ~y;
    assign e = ~(x ^ y);
    assign l = ~x & y;

endmodule
