/** 2018 Obarey Inc. **/
module clk_divider( inclk, outclk );
	
	input inclk;
	output reg outclk;
	
	reg[15:0] clkdiv = 0;
	
	initial begin
		outclk = 0;
	end
	
	always @(posedge inclk)
	begin
		if( clkdiv == 16'd4999 )
			begin
				clkdiv <= 16'd0;
				outclk <= ~outclk;
			end
			else
				clkdiv <= clkdiv + 1;
	end
endmodule