/** 2018 Obarey Inc. **/
module clk_divider( inclk, outclk );
	
	input inclk;
	output reg outclk;
	
	reg[30:0] clkdiv = 0;
	
	initial begin
		outclk = 0;
	end
	
	always @(posedge inclk)
	begin
		//if( clkdiv == 30'd24999999 )
		if( clkdiv == 30'd9999 )
			begin
				clkdiv <= 30'd0;
				outclk <= ~outclk;
			end
			else
				clkdiv <= clkdiv + 30'd1;
	end
endmodule