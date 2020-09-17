module fp_adder(
   input logic [31:0] a, b,
   output logic [31:0] sum
);

	logic [7:0] exp_a, exp_b, exp_pre, exp_val, sh_amt;
	logic alessb;
	logic [23:0] mant_a, mant_b, sh_mant;
	logic [22:0] fract;
   

	assign {exp_a, mant_a} = {a[30:23], 1'b1, a[22:0]};
	assign {exp_b, mant_b} = {b[30:23], 1'b1, b[22:0]};

	assign sum = {1'b0,  exp_val,  fract};
    
   comp_exp dut_exp(exp_a, exp_b, alessb, exp_pre, sh_amt);
   shift_mant dut_shift(alessb, mant_a, mant_b, sh_amt, sh_mant);
   add_mant dut_add(alessb, mant_a, mant_b, sh_mant, exp_pre, fract, exp_val);

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