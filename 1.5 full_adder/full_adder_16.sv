module full_adder_16(input logic [15:0] a, b,
								output logic [15:0] sum);
								

	wire [16:0] carry; //internal nodes
	assign carry[0] = 1'b0; // intially, we don't have carry in
	
	full_adder fa_1(a[0], b[0], carry[0], sum[0], carry[1]);
	full_adder fa_2(a[1], b[1], carry[1], sum[1], carry[2]);
	full_adder fa_3(a[2], b[2], carry[2], sum[2], carry[3]);
	full_adder fa_4(a[3], b[3], carry[3], sum[3], carry[4]);
	full_adder fa_5(a[4], b[4], carry[4], sum[4], carry[5]);
	full_adder fa_6(a[5], b[5], carry[5], sum[5], carry[6]);
	full_adder fa_7(a[6], b[6], carry[6], sum[6], carry[7]);
	full_adder fa_8(a[7], b[7], carry[7], sum[7], carry[8]);
	full_adder fa_9(a[8], b[8], carry[8], sum[8], carry[9]);
	full_adder fa_10(a[9], b[9], carry[9], sum[9], carry[10]);
	full_adder fa_11(a[10], b[10], carry[10], sum[10], carry[11]);
	full_adder fa_12(a[11], b[11], carry[11], sum[11], carry[12]);
	full_adder fa_13(a[12], b[12], carry[12], sum[12], carry[13]);
	full_adder fa_14(a[13], b[13], carry[13], sum[13], carry[14]);
	full_adder fa_15(a[14], b[14], carry[14], sum[14], carry[15]);
	full_adder fa_16(a[15], b[15], carry[15], sum[15], carry[16]);
	
endmodule
	