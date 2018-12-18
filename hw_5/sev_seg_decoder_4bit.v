/***** Obarey Inc. *****/   
module sev_seg_decoder_4bit(in, out );
	input[3:0] in;
	output reg[7:0] out;
	
	always@( in )
		begin
			case (in)
				 4'b0000 : out=8'b11000000; //0
				 4'b0001 : out=8'b11111001; //1
				 4'b0010 : out=8'b10100100; //2
				 4'b0011 : out=8'b10110000; //3
				 4'b0100 : out=8'b10011001; //4
				 4'b0101 : out=8'b10010010; //5
				 4'b0110 : out=8'b10000010; //6
				 4'b0111 : out=8'b11111000; //7
				 4'b1000 : out=8'b10000000; //8
				 4'b1001 : out=8'b10010000; //9
				 default : out=8'b10001100; //F
		 endcase
		 
		end
endmodule