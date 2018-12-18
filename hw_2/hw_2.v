/***** Obarey Inc. *****/   
`timescale 1ns / 1ps
module hw_2(celc_in, fahr_out);
    input[6:0] celc_in;
    output[12:0] fahr_out;
    parameter celc_divider = 3'd5;
    parameter fahr_constant = 6'd32;
    parameter fahr_divider = 4'd9;
    assign fahr_out = celc_in * fahr_divider / celc_divider + fahr_constant;
endmodule
