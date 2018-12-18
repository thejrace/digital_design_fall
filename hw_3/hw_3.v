/***** Obarey Inc. *****/   
`timescale 1ns / 1ps
module hw_3( in, out);
    input[3:0] in;
    output[1:0] out; // 1:odd 0:even
    assign out[1] = in[0]^in[1]^in[2]^in[3];
    assign out[0] = ~(out[1]);
endmodule
