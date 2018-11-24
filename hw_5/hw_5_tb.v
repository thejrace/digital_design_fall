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
