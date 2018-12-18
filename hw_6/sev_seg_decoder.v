/* Obarey Inc. */
module sev_seg_decoder( in, out );
    input[3:0] in;
    output reg[7:0] out;
    always @(in) begin
        case(in)
            4'b0000: out = 8'b10001000; // A
            4'b0001: out = 8'b10000011; // b
            4'b0010: out = 8'b11000110; // C
            4'b0011: out = 8'b10100001; // d
            4'b0100: out = 8'b10000110; // E
            4'b0101: out = 8'b10001110; // F
            4'b0110: out = 8'b10001001; // H
            4'b0111: out = 8'b11001111; // I
            4'b1000: out = 8'b11000111; // L
            4'b1001: out = 8'b11100001; // J
            4'b1010: out = 8'b10001100; // P
            4'b1011: out = 8'b11000001; // U
            4'b1100: out = 8'b10001101; // Y
				default: out = 8'b10110110;
       endcase
    end
endmodule