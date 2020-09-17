module mux_2by1(input logic a,b,s, 
   output logic y);

   assign y=((a&s) | (b&(~s)));

	/*initial begin
		$display ("i am 2:1MUX");
	end*/
endmodule
/////////////////////////////////////////////////////////MUX






module full_adder(input logic a,b,cin, output logic s, cout);

   assign s = (a^b) ^ cin;
   assign cout = (a&b) | (( a ^ b ) & cin );
   
endmodule
/////////////////////////////////////////////////////////FA






module select_oper(input logic a,b,cin, 
                   input logic [2:0] c,
                   output logic y, 
                   output logic cout);//cout - carry, y- each sum value
      
      //logic part variable
      logic n1, n2, n3, n4, n5, n6;
      logic n4_5, n6_7, logic_out;
      logic full_adder_sum;

      //logic part
   
      assign n4 = a^b;
      assign n5 = a&b;
      assign n6 = a|b;
      
      mux_2by1 n4orn5(n4, n5, c[0], n4_5);
		
      mux_2by1 n6or0(n6, 1'b0, c[0], n6_7);
      
      mux_2by1 logic_select(n4_5, n6_7, c[1], logic_out); //output - logic_out

      //////////////////////////////////////////
      
      //////////////////////////////////////////
		
      
      //alg part
      assign n1 = (c[1]^c[0]) ? ~b : b;
		assign n2 = c[0] ? c[1] : n1;
		/*
      mux_2by1 b_bar(~b, b, n1, n2);
      mux_2by1 oper_select(n2, c[1], c[0], n3);
		*/
      
      
      full_adder fa(n2, a, cin, full_adder_sum, cout); //full_sum & cout -> output
      

      
      // logic or alg part
      
      //mux_2by1 last_mux(full_adder_sum, logic_out, c[2], y);
		assign y = c[2] ? logic_out : full_adder_sum;
      

      
endmodule
      
///////////////////////////////////////////////////////////////Select_oper // ALU_1bit



module ALU_test(input logic [15:0] a, b, 
               input logic [2:0]c, 
                  output logic [15:0]yout,
						output logic last_carry);


   /*
   wire [16:0] carry;
   logic last_carry; //overflow
   assign carry[0] = ;
   */

   
   select_oper s1(a[0],b[0],(c[1] ^ c[0]),c, yout[0], c1);
   select_oper s2(a[1],b[1],c1,c, yout[1], c2);
   select_oper s3(a[2],b[2],c2,c, yout[2], c3); 
   select_oper s4(a[3],b[3],c3,c, yout[3], c4);
   select_oper s5(a[4],b[4],c4,c, yout[4], c5);
   select_oper s6(a[5],b[5],c5,c, yout[5], c6); 
   select_oper s7(a[6],b[6],c6,c, yout[6], c7); 
   select_oper s8(a[7],b[7],c7,c, yout[7], c8); 
   select_oper s9(a[8],b[8],c8,c, yout[8], c9); 
   select_oper s10(a[9],b[9],c9,c, yout[9], c10); 
   select_oper s11(a[10],b[10],c10,c, yout[10], c11); 
   select_oper s12(a[11],b[11],c11,c, yout[11], c12); 
   select_oper s13(a[12],b[12],c12,c, yout[12], c13); 
   select_oper s14(a[13],b[13],c13,c, yout[13], c14); 
   select_oper s15(a[14],b[14],c14,c, yout[14], c15);
   select_oper s16(a[15],b[15],c15,c, yout[15], last_carry); 
   
endmodule