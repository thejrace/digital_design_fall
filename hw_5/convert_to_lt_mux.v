/*****
**   8-bit Comparator implemented using 4x1 multiplexers
**		- Authors
**			- Ahmet Ziya Kanbur & Furkan Sezgin  & Mesut Teyfur
**	  2018 Marmara University EE
*****/  
module convert_to_lt_mux( in, out );
    input[1:0] in;
    output[3:0] out;
    assign out = { (~in[1]&~in[0])|(~in[1]&in[0])|(in[1]&~in[0]), ((~in[1]&~in[0]) | (~in[1]&in[0])), ~(in[1]|in[0]), 1'b0 };
endmodule
