`timescale 1ns / 1ps
module sev_seg_decoder( in, out );
	input[9:0] in;
	output reg[7:0] out;
	
	always@( in )
		begin
			case (in)
				 10'b1111111111 : out=7'b0111111; //0
				 10'b1111111110 : out=7'b0000110; //1
				 10'b1111111100 : out=7'b1011011; //2
				 10'b1111111000 : out=7'b1001111; //3
				 10'b1111110000 : out=7'b1100110; //4
				 10'b1111100000 : out=7'b1101101; //5
				 10'b1111000000 : out=7'b1111101; //6
				 10'b1110000000 : out=7'b0000111; //7
				 10'b1100000000 : out=7'b1111111; //8
				 10'b1000000000 : out=7'b1101111; //9
				 default : out=7'b1110001; //F
		 endcase
		end
endmodule