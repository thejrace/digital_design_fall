/*****
**   8-bit Comparator implemented using 4x1 multiplexers
**		- Authors
**			- Ahmet Ziya Kanbur & Furkan Sezgin  & Mesut Teyfur
**	  2018 Marmara University EE
*****/  
module binary_to_bcd(binary,huns,tens,ones);
	input [7:0] binary;
	output reg [3:0] huns, tens, ones;
	reg [7:0] bcd_data=0;
	
	always @ (binary)
		begin
			bcd_data = binary;
			huns = bcd_data / 100;
			bcd_data = bcd_data % 100;
			tens = bcd_data / 10;
			ones = bcd_data % 10;
		end
endmodule