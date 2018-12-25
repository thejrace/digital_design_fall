/** 2018 Obarey Inc. **/
module hw_7( clk, sw, reset, sev_seg1, sev_seg2, clkswitch );
	input clk;
	input reset;
	input[1:0] clkswitch;
	input[15:0] sw;
	output reg[7:0] sev_seg1, sev_seg2;
	
	reg[1:0] seg_enable;
	
	localparam LEFT = 1'b0, RIGHT = 1'b1;
	reg state = LEFT;
	
	reg active_clk = 0;
	wire clk_10hz, clk_40hz, clk_50hz, clk_10khz;
	clk_divider clk_div_1khz( clk, clk_10hz, clk_40hz, clk_50hz, clk_10khz );
	
	wire[7:0] seg1, seg2;
	decoder_7seg disp1( sw[3:0], seg1 );
	decoder_7seg disp2( sw[7:4], seg2 );
	
	always @( posedge clk ) begin
		if( clkswitch == 2'b00 ) begin
			active_clk <= clk_10hz;
		end
		else if ( clkswitch == 2'b01 ) begin
			active_clk <= clk_40hz;
		end
		else if( clkswitch == 2'b10 ) begin
			active_clk <= clk_50hz;
		end
		else begin
			active_clk <= clk_10khz;
		end
	end
	
	always @( posedge active_clk ) begin
		if ( reset == 0 ) begin
		  sev_seg1 <= 8'b111111111;
		  sev_seg2 <= 8'b111111111;
		  seg_enable <= 2'b11;
		  state <= LEFT;
		end
		else begin
			case(state)
				LEFT:
					begin
						seg_enable <= 2'b10;
						state <= RIGHT;
					end
				RIGHT:
					begin
						seg_enable <= 4'b01;
						state <= LEFT;
					end
			endcase
			sev_seg1 <= {8{seg_enable[0]}}|seg1;
			sev_seg2 <= {8{seg_enable[1]}}|seg2;
		end // else
	end
endmodule

