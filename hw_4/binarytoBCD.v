/***** Obarey Inc. *****/   
module binarytoBCD(binary,tens,ones);

	input [5:0] binary;
	output reg [3:0] tens, ones;
	reg [5:0] bcd_data=0;
	
	always @ (binary)
		begin
			bcd_data = binary;
			tens = bcd_data / 10;
			ones = bcd_data % 10;
		end
endmodule
