/** 2018 Obarey Inc. **/
module clk_divider( inclk, outclk_10hz, outclk_40hz, outclk_50hz, outclk_10khz );
	
	input inclk;
	output reg outclk_10hz, outclk_40hz, outclk_50hz, outclk_10khz;
	
	reg[22:0] clkdiv_10hz = 0;
	reg[20:0] clkdiv_40hz = 0;
	reg[19:0] clkdiv_50hz = 0;
	reg[15:0] clkdiv_10khz = 0;
	
	initial begin
		outclk_10hz = 0;
		outclk_40hz = 0;
		outclk_50hz = 0;
		outclk_10khz = 0;
	end
	
	always @(posedge inclk ) begin
	
		if( clkdiv_10hz == 23'd4999999 ) begin
				clkdiv_10hz <= 23'd0;
				outclk_10hz <= ~outclk_10hz;
		end
		else begin
				clkdiv_10hz <= clkdiv_10hz + 1;
		end
		
		
		if( clkdiv_40hz == 21'd1249999 ) begin
				clkdiv_40hz <= 21'd0;
				outclk_40hz <= ~outclk_40hz;
		end
		else begin
				clkdiv_40hz <= clkdiv_40hz + 1;
		end
		
		
		if( clkdiv_50hz == 20'd999999 ) begin
				clkdiv_50hz <= 20'd0;
				outclk_50hz <= ~outclk_50hz;
		end
		else begin
				clkdiv_50hz <= clkdiv_50hz + 1;
		end
		
		if( clkdiv_10khz == 16'd4999 ) begin
				clkdiv_10khz <= 16'd0;
				outclk_10khz <= ~outclk_10khz;
		end
		else begin
				clkdiv_10khz <= clkdiv_10khz + 1;
		end
		
	end
	
	/*
	always @(posedge inclk)
	begin
		if( clkdiv_10hz == 23'd4999999 )
			begin
				clkdiv_10hz <= 23'd0;
				outclk_10hz <= ~outclk_10hz;
			end
			else
				clkdiv_10hz <= clkdiv_10hz + 1;
	end
	
	always @(posedge inclk)
	begin
		if( clkdiv_40hz == 21'd1249999 )
			begin
				clkdiv_40hz <= 21'd0;
				outclk_40hz <= ~outclk_40hz;
			end
			else
				clkdiv_40hz <= clkdiv_40hz + 1;
	end
	
	always @(posedge inclk)
	begin
		if( clkdiv_50hz == 20'd999999 )
			begin
				clkdiv_50hz <= 20'd0;
				outclk_50hz <= ~outclk_50hz;
			end
			else
				clkdiv_50hz <= clkdiv_50hz + 1;
	end
	
	always @(posedge inclk)
	begin
		if( clkdiv_10khz == 16'd4999 )
			begin
				clkdiv_10khz <= 16'd0;
				outclk_10khz <= ~outclk_10khz;
			end
			else
				clkdiv_10khz <= clkdiv_10khz + 1;
	end
*/
endmodule