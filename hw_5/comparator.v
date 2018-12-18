/***** Obarey Inc. *****/    
module comparator( in, comp_with, out );
	
    input[7:0] in, comp_with;
    output out;
    
	 // comparison outputs
    wire[3:0] lt0_input, lt1_input, lt2_input, lt3_input;
    wire[3:0] eq0_input, eq1_input, eq2_input, eq3_input;
    
    // starting from MSBs check;
	 // mux_l[x] -> check if 'in <? comp_with' two bit at a time
	 // mux_e[x] -> check if 'in =? comp_with' two bit at a time
	 
	 // mux converters used to be fed into mux inputs according to 'in'
    convert_to_lt_mux clt_0( {in[7], in[6] }, lt0_input );
    wire mux_l0_out;
    four_to_one_multiplexer mux_l0(
        mux_l0_out,
        lt0_input,
        comp_with[7:6]
    );
    
    convert_to_lt_mux clt_1( {in[5], in[4] }, lt1_input );
    wire mux_l1_out;
    four_to_one_multiplexer mux_l1(
        mux_l1_out,
        lt1_input,
        comp_with[5:4]
    );
    
    convert_to_lt_mux clt_2( {in[3], in[2] }, lt2_input );
    wire mux_l2_out;
    four_to_one_multiplexer mux_l2(
        mux_l2_out,
        lt2_input,
        comp_with[3:2]
    );
    
    convert_to_lt_mux clt_3( {in[1], in[0] }, lt3_input );
    wire mux_l3_out;
    four_to_one_multiplexer mux_l3(
        mux_l3_out,
        lt3_input,
        comp_with[1:0]
    );
    
    convert_to_eq_mux ceq_0( {in[7], in[6] }, eq0_input );
    wire mux_e0_out;
    four_to_one_multiplexer mux_e0(
        mux_e0_out,
        eq0_input,
        comp_with[7:6]
    ); 
       
    convert_to_eq_mux ceq_1( {in[5], in[4] }, eq1_input );
    wire mux_e1_out;
    four_to_one_multiplexer mux_e1(
        mux_e1_out,
        eq1_input,
        comp_with[5:4]
    ); 
    
    convert_to_eq_mux ceq_2( {in[3], in[2] }, eq2_input );
    wire mux_e2_out;
    four_to_one_multiplexer mux_e2(
        mux_e2_out,
        eq2_input,
        comp_with[3:2]
    ); 
    
    convert_to_eq_mux ceq_3( {in[1], in[0] }, eq3_input );
    wire mux_e3_out;
    four_to_one_multiplexer mux_e3(
        mux_e3_out,
        eq3_input,
        comp_with[1:0]
    ); 
    
	 // output high if comp_with >= in
    assign out =  ( mux_e0_out & mux_e1_out & mux_e2_out & mux_e3_out ) | // in = comp_with
                  ( mux_l0_out ) | // comp > in ( most significant two bits of comp > in )
                  ( mux_e0_out & mux_l1_out ) | // comp > in ( most significant two bits are equal but 5-4th pair of comp > in )
                  ( mux_e0_out & mux_e1_out & mux_l2_out ) | // comp > in ( most significant four bits are equal but 3-2nd pair of comp > in )
                  ( mux_e0_out & mux_e1_out & mux_e2_out & mux_l3_out ); // comp > in ( most significant six bits are equal but 1-0 pair of comp > in )
                    
endmodule