module reg_fp_adder(
   input logic clk, reset,
	input logic [31:0] a, b,
   output logic [31:0] sum
);

	logic [7:0] exp_a, exp_b, exp_pre, exp_val, sh_amt;
	logic alessb;
	logic [23:0] mant_a, mant_b, sh_mant;
	logic [22:0] fract;
	logic [31:0] reg_sum;
	logic [31:0] reg_a, reg_b;

   //input register dual port
	in_flop ff1(clk, reset, a[0], b[0], reg_a[0], reg_b[0]);
	in_flop ff2(clk, reset, a[1], b[1], reg_a[1], reg_b[1]);
	in_flop ff3(clk, reset, a[2], b[2], reg_a[2], reg_b[2]);
	in_flop ff4(clk, reset, a[3], b[3], reg_a[3], reg_b[3]);
	in_flop ff5(clk, reset, a[4], b[4], reg_a[4], reg_b[4]);
	in_flop ff6(clk, reset, a[5], b[5], reg_a[5], reg_b[5]);
	in_flop ff7(clk, reset, a[6], b[6], reg_a[6], reg_b[6]);
	in_flop ff8(clk, reset, a[7], b[7], reg_a[7], reg_b[7]);
	in_flop ff9(clk, reset, a[8], b[8], reg_a[8], reg_b[8]);
	in_flop ff10(clk, reset, a[9], b[9], reg_a[9], reg_b[9]);
	in_flop ff11(clk, reset, a[10], b[10], reg_a[10], reg_b[10]);
	in_flop ff12(clk, reset, a[11], b[11], reg_a[11], reg_b[11]);
	in_flop ff13(clk, reset, a[12], b[12], reg_a[12], reg_b[12]);
	in_flop ff14(clk, reset, a[13], b[13], reg_a[13], reg_b[13]);
	in_flop ff15(clk, reset, a[14], b[14], reg_a[14], reg_b[14]);
	in_flop ff16(clk, reset, a[15], b[15], reg_a[15], reg_b[15]);
	in_flop ff17(clk, reset, a[16], b[16], reg_a[16], reg_b[16]);
	in_flop ff18(clk, reset, a[17], b[17], reg_a[17], reg_b[17]);
	in_flop ff19(clk, reset, a[18], b[18], reg_a[18], reg_b[18]);
	in_flop ff20(clk, reset, a[19], b[19], reg_a[19], reg_b[19]);
	in_flop ff21(clk, reset, a[20], b[20], reg_a[20], reg_b[20]);
	in_flop ff22(clk, reset, a[21], b[21], reg_a[21], reg_b[21]);
	in_flop ff23(clk, reset, a[22], b[22], reg_a[22], reg_b[22]);
	in_flop ff24(clk, reset, a[23], b[23], reg_a[23], reg_b[23]);
	in_flop ff25(clk, reset, a[24], b[24], reg_a[24], reg_b[24]);
	in_flop ff26(clk, reset, a[25], b[25], reg_a[25], reg_b[25]);
	in_flop ff27(clk, reset, a[26], b[26], reg_a[26], reg_b[26]);
	in_flop ff28(clk, reset, a[27], b[27], reg_a[27], reg_b[27]);
	in_flop ff29(clk, reset, a[28], b[28], reg_a[28], reg_b[28]);
	in_flop ff30(clk, reset, a[29], b[29], reg_a[29], reg_b[29]);
	in_flop ff31(clk, reset, a[30], b[30], reg_a[30], reg_b[30]);
	in_flop ff32(clk, reset, a[31], b[31], reg_a[31], reg_b[31]);
	
	//output register single port
	out_flop f1(clk, reset, reg_sum[0], sum[0]);
	out_flop f2(clk, reset, reg_sum[1], sum[1]);
	out_flop f3(clk, reset, reg_sum[2], sum[2]);
	out_flop f4(clk, reset, reg_sum[3], sum[3]);
	out_flop f5(clk, reset, reg_sum[4], sum[4]);
	out_flop f6(clk, reset, reg_sum[5], sum[5]);
	out_flop f7(clk, reset, reg_sum[6], sum[6]);
	out_flop f8(clk, reset, reg_sum[7], sum[7]);
	out_flop f9(clk, reset, reg_sum[8], sum[8]);
	out_flop f10(clk, reset, reg_sum[9], sum[9]);
	out_flop f11(clk, reset, reg_sum[10], sum[10]);
	out_flop f12(clk, reset, reg_sum[11], sum[11]);
	out_flop f13(clk, reset, reg_sum[12], sum[12]);
	out_flop f14(clk, reset, reg_sum[13], sum[13]);
	out_flop f15(clk, reset, reg_sum[14], sum[14]);
	out_flop f16(clk, reset, reg_sum[15], sum[15]);
	out_flop f17(clk, reset, reg_sum[16], sum[16]);
	out_flop f18(clk, reset, reg_sum[17], sum[17]);
	out_flop f19(clk, reset, reg_sum[18], sum[18]);
	out_flop f20(clk, reset, reg_sum[19], sum[19]);
	out_flop f21(clk, reset, reg_sum[20], sum[20]);
	out_flop f22(clk, reset, reg_sum[21], sum[21]);
	out_flop f23(clk, reset, reg_sum[22], sum[22]);
	out_flop f24(clk, reset, reg_sum[23], sum[23]);
	out_flop f25(clk, reset, reg_sum[24], sum[24]);
	out_flop f26(clk, reset, reg_sum[25], sum[25]);
	out_flop f27(clk, reset, reg_sum[26], sum[26]);
	out_flop f28(clk, reset, reg_sum[27], sum[27]);
	out_flop f29(clk, reset, reg_sum[28], sum[28]);
	out_flop f30(clk, reset, reg_sum[29], sum[29]);
	out_flop f31(clk, reset, reg_sum[30], sum[30]);
	out_flop f32(clk, reset, reg_sum[31], sum[31]);
	
	
	assign {exp_a, mant_a} = {reg_a[30:23], 1'b1, reg_a[22:0]};
	assign {exp_b, mant_b} = {reg_b[30:23], 1'b1, reg_b[22:0]};

	assign reg_sum = {1'b0,  exp_val,  fract};
	
   comp_exp dut_exp(exp_a, exp_b, alessb, exp_pre, sh_amt);
   shift_mant dut_shift(alessb, mant_a, mant_b, sh_amt, sh_mant);
   add_mant dut_add(alessb, mant_a, mant_b, sh_mant, exp_pre, fract, exp_val);

endmodule
module in_flop(input logic clk, reset, a, b,
				output logic reg_a, reg_b);
				
	always_ff @(posedge clk, posedge reset)
		if(reset) begin 
			reg_a <= 0;
			reg_b <= 0;
		end
		else begin
			reg_a <= a;
			reg_b <= b;
		end
		
endmodule
module out_flop(input logic clk, reset, reg_sum,
				output logic sum);
				
	always_ff @(posedge clk, posedge reset)
		if(reset) begin 
			sum <= 0;
		end
		else begin
			sum <= reg_sum;
		end
		
endmodule

module comp_exp(
	input logic [7:0] exp_a, exp_b,
   output logic alessb,
   output logic [7:0] exp_pre, sh_amt
);
      

	logic [7:0] aminusb, bminusa;
  
	assign aminusb = exp_a - exp_b;
	assign bminusa = exp_b - exp_a;
	assign alessb = aminusb[7];

	always_comb
		if(alessb) begin // Insert bigger E values.
			exp_pre = exp_b;
			sh_amt = bminusa;
		end
		else begin 
			exp_pre = exp_a; 
			sh_amt = aminusb;
		end
endmodule

module shift_mant(
	input logic alessb,
	input logic [23:0] mant_a, mant_b,
	input logic [7:0] sh_amt,
	output logic [23:0] sh_mant 
);

	logic [23:0] shiftedval;
   
	assign shiftedval = alessb ? (mant_a >> sh_amt) : (mant_b >> sh_amt);
   

	always_comb
		if(sh_amt[7] | sh_amt[6] | sh_amt[5] | (sh_amt[4] & sh_amt[3] ))
			sh_mant = 24'b0;
		else 
			sh_mant = shiftedval;
			
endmodule

module add_mant(
   input logic alessb,
   input logic [23:0] mant_a, mant_b, sh_mant,
   input logic [7:0] exp_pre,
   output logic [22:0] fract,
   output logic [7:0] exp_val
);

	logic [24:0] addresult;
	logic [23:0] addval;

	assign addval = alessb ? mant_b : mant_a;
	assign addresult = sh_mant + addval;
	assign fract = addresult[24] ? addresult[23:1] : addresult[22:0];
    
	assign exp_val = addresult[24] ? (exp_pre + 1) : exp_pre; 

endmodule
