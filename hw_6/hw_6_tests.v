/* Obarey Inc. */
module hw_6_tests( state_btn, sev_seg, leds, reset, state_led );
    
    input [1:0] state_btn;
    output[7:0] sev_seg;
	 output reg[3:0] state_led;
	 input reset;
    output reg[3:0] leds;
	 
    
    localparam A = 4'b0000,
               B = 4'b0001,
               C = 4'b0010,
               D = 4'b0011,
               E = 4'b0100,
               F = 4'b0101,
               H = 4'b0110, 
               I = 4'b0111,
               L = 4'b1000,
               J = 4'b1001,
               P = 4'b1010,
               U = 4'b1011,
               Y = 4'b1100;
    
    reg[3:0] state;
    
    sev_seg_decoder sev_seg_driver( state, sev_seg );
    
    // sev seg i tanimla
    // always in en altinda girisine veririz state i
    always @(state_btn, reset) begin     
				if( reset == 1'b0 ) begin
					leds <= 4'b0000;
					state <= A;
				end
				else begin
					case(state)
						 A: begin
							 // buttons on DE0 board return 0 when pressed, so state_btn is inverted
							 case(state_btn)
									2'b01: begin
										 state <= B;
										 leds <= 4'b0101;
									end
									2'b10: begin
										 state <= C;
										 leds <= 4'b1010;
									end
									default: begin
										 state <= A;
										 leds <= 4'b0000;
									end                    
							 endcase  
						 end
						 B: begin
							 case(state_btn)
									2'b11: begin
										 state <= E;
										 leds <= 4'b1100;
									end
									default: begin
										 state <= B;
										 leds <= 4'b0101;
									end                    
							 endcase  
						 end
						 C: begin
							 case(state_btn)
									2'b11: begin
										 state <= F;
										 leds <= 4'b0110;
									end
									default: begin
									    state <= C;
										 leds <= 4'b1010;
									end                    
							 endcase  
						 end
						 F: begin
							 case(state_btn)
									2'b10: begin
										 state <= D;
										 leds <= 4'b0011;
									end
									2'b01: begin
										 state <= J;
										 leds <= 4'b0100;
									end
									default: begin
										 state <= F;
										 leds <= 4'b0110;
									end                    
							 endcase
						 end
						 E: begin
							 case(state_btn)
									2'b10: begin
										 state <= I;
										 leds <= 4'b0010;
									end
									2'b01: begin
										 state <= D;
										 leds <= 4'b0011;
									end
									default: begin
										 state <= E;
										 leds <= 4'b1100;
									end                    
							 endcase  
						 end
						 D: begin
							 case(state_btn)
									2'b11: begin
										 state <= H;
										 leds <= 4'b1000;
									end
									default: begin
										 state <= D;
										 leds <= 4'b0011;
									end                  
							 endcase  
						 end
						 H: begin
							 case(state_btn)
									2'b01: begin
										 state <= I;
										 leds <= 4'b0010;
									end    
									2'b10: begin
										 state <= J;
										 leds <= 4'b0100;
									end 
									default: begin
										 state <= H;
										 leds <= 4'b1000;
									end             
							 endcase  
						 end
						 I: begin
							 case(state_btn)
									2'b11: begin
										 state <= P;
										 leds <= 4'b0111;
									end    
									default: begin
										 state <= I;
										 leds <= 4'b0010;
									end             
							 endcase  
						 end
						 J: begin
							 case(state_btn)
									2'b11: begin
										 state <= U;
										 leds <= 4'b1110;
									end    
									default: begin
										 state <= J;
										 leds <= 4'b0100;
									end             
							 endcase  
						 end
						 L: begin
							 case(state_btn)
									2'b01: begin
										 state <= I;
										 leds <= 4'b0010;
									end    
									2'b10: begin
										 state <= J;
										 leds <= 4'b0100;
									end  
									default: begin
									    state <= L;
										 leds <= 4'b0000;
									end             
							 endcase  
						 end
						 P: begin
							 case(state_btn)
									2'b01, 2'b10: begin
										 state <= Y;
										 leds <= 4'b1111;
									end    
									default: begin
										 state <= P;
										 leds <= 4'b0111;
									end             
							 endcase  
						 end
						 U: begin
							 case(state_btn)
									2'b01, 2'b10: begin
										 state <= Y;
										 leds <= 4'b1111;
									end    
									default: begin
										 state <= U;
										 leds <= 4'b1110;
									end             
							 endcase  
						 end
						 Y: begin
							 case(state_btn)
									2'b11: begin
										 state <= L;
										 leds <= 4'b0000;
									end    
									default: begin
										 state <= Y;
										 leds <= 4'b1111;
									end             
							 endcase  
						 end
					endcase
					state_led <= state;
				end // reset else
        end // always
endmodule