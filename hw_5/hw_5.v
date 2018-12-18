/***** Obarey Inc. *****/   
module hw_5( adc_in, sev_seg_out, sev_seg_huns, sev_seg_tens, sev_seg_ones, debug_sw );
	  // main in-out definitions
	  input[7:0] adc_in;
	  output[7:0] sev_seg_out; // main sev seg
	  wire[9:0] comp_output;
	  
	  // defs for debugging ( these ones have nothing to do with comparator logic
	  input debug_sw; // switch for adc_in sev_segs
	  output[7:0] sev_seg_huns, sev_seg_tens, sev_seg_ones; // sev_segs on de0 to see adc_in
	  wire[3:0] adc_huns, adc_tens, adc_ones;
	  
	  // init comparators
	  /* each comparator module returns;
	  *  		0 -> if adc_in > limit
	  *  		1 -> if adc_in <= limit
	  */
	  comparator comp0( adc_in, 8'b00011000, comp_output[0] ); // 0 
	  comparator comp1( adc_in, 8'b00110001, comp_output[1] ); // 1 
	  comparator comp2( adc_in, 8'b01001010, comp_output[2] ); // 2
	  comparator comp3( adc_in, 8'b01100011, comp_output[3] ); // 3
	  comparator comp4( adc_in, 8'b01111100, comp_output[4] ); // 4
	  comparator comp5( adc_in, 8'b10010101, comp_output[5] ); // 5
	  comparator comp6( adc_in, 8'b10101110, comp_output[6] ); // 6
	  comparator comp7( adc_in, 8'b11000111, comp_output[7] ); // 7
	  comparator comp8( adc_in, 8'b11100000, comp_output[8] ); // 8
	  comparator comp9( adc_in, 8'b11111111, comp_output[9] ); // 9
	  // main output sev_seg
	  sev_seg_decoder sev_seg( comp_output, sev_seg_out );
	  
	  // convert adc_in value to decimal digits
	  binary_to_bcd binary_convert( adc_in, adc_huns, adc_tens, adc_ones );
	  // init debug sev_segs
	  sev_seg_decoder_4bit sev_seg_disp_huns( adc_huns & {4{ debug_sw }}, sev_seg_huns );
	  sev_seg_decoder_4bit sev_seg_disp_tens( adc_tens & {4{ debug_sw }}, sev_seg_tens );
	  sev_seg_decoder_4bit sev_seg_disp_ones( adc_ones & {4{ debug_sw }}, sev_seg_ones );
endmodule

/* test bench ( tested on Vivado )
* Note: this bench does not include test sev_segs.
*  it's written to test comp_output results

	`timescale 1ns / 1ps
    module hw_5_tb();

    reg[7:0] adc_in;
    wire[7:0] sev_seg_out;
    
    hw_5 UUT ( adc_in, sev_seg_out );
    
     initial 
     begin
       
       adc_in = 0;
       
       repeat (255)
           #1 adc_in = adc_in + 1'b1;
       end
           
       initial  
       begin
           $display("   \tadc \tout"); 
           $monitor("%d \t%b",adc_in, sev_seg_out); 
       end
endmodule
*/
