`timescale 1ns / 1ps
    module hw_5( adc_in, sev_seg_out );
        input[7:0] adc_in;
        output[7:0] sev_seg_out;
        wire[9:0] comp_output;
          
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
        
        sev_seg_decoder sev_seg( comp_output, sev_seg_out );
        
endmodule