module ALU_16(input logic [15:0] a, b, 
					input logic [2:0]c, 
						output logic [15:0]yout);


	
	wire [16:0] carry;
	logic last_carry; //overflow
	assign carry[0] = (c[1] ^ c[0]);
	

	
	select_oper s1(a[0],b[0],carry[0],c, yout[0], carry[1]);
	select_oper s2(a[1],b[1],carry[1],c, yout[1], carry[2]);
	select_oper s3(a[2],b[2],carry[2],c, yout[2], carry[3]); 
	select_oper s4(a[3],b[3],carry[3],c, yout[3], carry[4]);
	select_oper s5(a[4],b[4],carry[4],c, yout[4], carry[5]);
	select_oper s6(a[5],b[5],carry[5],c, yout[5], carry[6]); 
	select_oper s7(a[6],b[6],carry[6],c, yout[6], carry[7]); 
	select_oper s8(a[7],b[7],carry[7],c, yout[7], carry[8]); 
	select_oper s9(a[8],b[8],carry[8],c, yout[8], carry[9]); 
	select_oper s10(a[9],b[9],carry[9],c, yout[9], carry[10]); 
	select_oper s11(a[10],b[10],carry[10],c, yout[10], carry[11]); 
	select_oper s12(a[11],b[11],carry[11],c, yout[11], carry[12]); 
	select_oper s13(a[12],b[12],carry[12],c, yout[12], carry[13]); 
	select_oper s14(a[13],b[13],carry[13],c, yout[13], carry[14]); 
	select_oper s15(a[14],b[14],carry[14],c, yout[14], carry[15]);
	select_oper s16(a[15],b[15],carry[15],c, yout[15], carry[16]); 
	
endmodule
