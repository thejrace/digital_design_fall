module hw_4( state_sw, seg1, seg2, test_sw );
	
	input state_sw;
	output[7:0] seg1;
	output[7:0] seg2;
	input[5:0] test_sw;
	
	wire[3:0] tens;
	wire[3:0] ones;
	
	binarytoBCD converter(test_sw, tens, ones);
	sev_seg_decoder disp1(tens & {4{ state_sw }}, seg1);
	sev_seg_decoder disp2(ones & {4{ state_sw }}, seg2);
		
endmodule