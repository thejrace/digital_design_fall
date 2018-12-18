/** 2018 Obarey Inc. **/
module hw_7( clk, sw, reset, sev_seg1, sev_seg2, sev_seg3, sev_seg4 );
	input clk;
	input reset;
	input[15:0] sw;
	output reg[7:0] sev_seg1, sev_seg2, sev_seg3, sev_seg4;
	
	reg[3:0] seg_enable;
	
	localparam LEFT = 2'b00, MIDLEFT = 2'b01, MIDRIGHT = 2'b10, RIGHT = 2'b11;
	reg [1:0] state = LEFT;
	
	wire clk_1khz;
	clk_divider clk_div_1khz( clk, clk_1khz );
	
	wire[7:0] seg1, seg2, seg3, seg4;
	decoder_7seg disp1( sw[3:0], seg1 );
	decoder_7seg disp2( sw[7:4], seg2 );
	decoder_7seg disp3( sw[11:8], seg3 );
	decoder_7seg disp4( sw[15:12], seg4 );
	
	always @( posedge clk_1khz ) begin
		if ( reset == 0 ) begin
		  sev_seg1 <= 8'b111111111;
		  sev_seg2 <= 8'b111111111;
		  sev_seg3 <= 8'b111111111;
		  sev_seg4 <= 8'b111111111;
		  seg_enable <= 4'b1111;
		  state <= LEFT;
		end
		else begin
			case(state)
				LEFT:
					begin
						seg_enable <= 4'b1110;
						state <= MIDLEFT;
					end
				MIDLEFT:
					begin
						seg_enable <= 4'b1101;
						state <= MIDRIGHT;
					end
				MIDRIGHT:
					begin
						seg_enable <= 4'b1011;
						state <= RIGHT;
					end
				RIGHT:
					begin
						seg_enable <= 4'b0111;
						state <= LEFT;
					end
			endcase
			sev_seg1 <= {8{seg_enable[0]}}|seg1;
			sev_seg2 <= {8{seg_enable[1]}}|seg2;
			sev_seg3 <= {8{seg_enable[2]}}|seg3;
			sev_seg4 <= {8{seg_enable[3]}}|seg4;
		end // else
	end
endmodule