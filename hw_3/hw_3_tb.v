/***** Obarey Inc. *****/   
`timescale 1ns / 1ps
module hw_3_tb;
    reg[3:0] in_t;
    wire[1:0] out_t;
    hw_3 uut( .in(in_t), .out(out_t)  ); // unit under test
    initial begin
        in_t = 4'b0000;
        #50; 
        // test the unit with 0000 + 15 input combinations
        repeat(15)
            #50 in_t = in_t + 1'b1; // 0000, 0001, 0010, 0011 ... 1111
    end
    // print results to console
    initial begin
        $display("    i0 i1 i2 i3    | od ev ");
        $monitor("\t%b  \t%b  \t%b \t%b  | \t%b \t%b", in_t[0], in_t[1], in_t[2], in_t[3], out_t[1], out_t[0]);
    end
endmodule