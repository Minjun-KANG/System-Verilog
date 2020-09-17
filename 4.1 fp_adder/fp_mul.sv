module fp_mul(
	input logic [31:0] a, b,
	output logic [31:0] mul

);
	logic [7:0] exp_a, exp_b, exp_pre, exp_c, mul_exp_val;
    
	logic [22:0] mul_fract;
	logic [23:0] mant_a , mant_b;
	logic [24:0] mant_c;
   

	assign {exp_a, mant_a} = {a[30:23] , 1'b1 , a[22:0]};
	assign {exp_b, mant_b} = {b[30:23] , 1'b1 , b[22:0]};

	assign mul ={1'b0,  mul_exp_val,  mul_fract};
    
	mul_comp_exp dut_mul_exp(exp_a, exp_b, exp_pre);
	mul_shift_mant dut_mul_shift(mant_a,mant_b,mant_c);
	mul_add_mant dut_mul(mant_c , exp_pre , mul_fract, mul_exp_val);

endmodule

module mul_comp_exp(
	input logic[7:0] exp_a, exp_b,
	output logic [7:0] exp_pre
);

	assign exp_pre = exp_a + exp_b - 127;
  
endmodule

    

module mul_shift_mant(
	input logic [23:0] mant_a ,mant_b,       
	output logic [24:0] mant_c 
);

	logic [47:0] line;

	assign line = mant_a * mant_b;
	assign mant_c = line [47:23];
   
      
endmodule

module mul_add_mant(
   
	input logic [24:0] mant_c,
	input logic [7:0] exp_pre, 
	output logic [22:0] mul_fract,
	output logic [7:0] mul_exp_val
	
);

    
	assign mul_fract = mant_c [24] ? mant_c[23:1] : mant_c[22:0];
	assign mul_exp_val = mant_c[24] ? (exp_pre+1) : exp_pre; 
    
    
    
endmodule
