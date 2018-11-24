`timescale 1ns / 1ps
// converts 2bit input to 4bit equality multiplexer input
module convert_to_eq_mux( in, out );
    input[1:0] in;
    output[3:0] out;
    assign out = { (in[1]&in[0]), (in[1]&~in[0]), (~in[1]&in[0]), ~(in[1]|in[0]) };
endmodule