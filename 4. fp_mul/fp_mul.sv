module fp_mul(
	input logic [31:0] a, b,
	output logic [31:0] mul

);
	logic [7:0] exp_a, exp_b, exp_result, mul_exp_val;
    
	logic [22:0] mul_fract;
	logic [23:0] mant_a, mant_b;
	logic [24:0] mant_result;
   

	assign {exp_a, mant_a} = {a[30:23] , 1'b1 , a[22:0]};
	assign {exp_b, mant_b} = {b[30:23] , 1'b1 , b[22:0]};
	
	assign sign_bit = a[31] ^ b[31];
	assign mul ={sign_bit,  mul_exp_val,  mul_fract};
    

	
	mul_comp_exp dut_mul_exp(exp_a, exp_b, exp_result);
	mul_shift_mant dut_mul_shift(mant_a, mant_b, mant_result);
	mul_add_mant dut_mul(mant_result, exp_result, mul_fract, mul_exp_val);

endmodule

module mul_comp_exp(
	input logic[7:0] exp_a, exp_b,
	output logic [7:0] exp_result
);

	assign exp_result = exp_a + exp_b - 127;
  
endmodule

    

module mul_shift_mant(
	input logic [23:0] mant_a ,mant_b,       
	output logic [24:0] mant_result 
);

	logic [47:0] truncate; 

	assign truncate = mant_a * mant_b;
	assign mant_result = truncate [47:23];
  
      
endmodule

module mul_add_mant(
   
	input logic [24:0] mant_result,
	input logic [7:0] exp_result, 
	output logic [22:0] mul_fract,
	output logic [7:0] mul_exp_val
	
);

    
	assign mul_fract = mant_result [24] ? mant_result[23:1] : mant_result[22:0];
	assign mul_exp_val = mant_result[24] ? (exp_result + 1) : exp_result; 
   
    
    
endmodule
