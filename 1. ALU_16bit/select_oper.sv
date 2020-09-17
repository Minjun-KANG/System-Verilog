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
		
		initial begin
			$display("I am select_oper");
			$display("n4=%b, n5=%b, n6=%b",n4,n5,n6);
		end
		
		
		mux_2by1 n4orn5(n4, n5, c[0], n4_5);
		initial begin
			$display("n4_5=%b",n4_5);
		end
		
		mux_2by1 n6or0(n6, 1'b0, c[0], n6_7);
		
		mux_2by1 logic_select(n4_5, n6_7, c[1], logic_out); //output - logic_out
		
		initial begin
			$display("mux-logic-out = %b",logic_out);
		end
		
		
		
		
		
		//////////////////////////////////////////
		
		
		
		//alg part
		assign n1 = (c[1]^c[0]);
		mux_2by1 b_bar(~b, b, n1, n2);
		mux_2by1 oper_select(n2, c[1], c[0], n3);
		
		
		full_adder fa(a, n3, cin, full_adder_sum, cout); //full_sum & cout -> output
		
		initial begin
			$display("sum = %b, cout = %b",full_adder_sum, cout);
		end
		
		// logic or alg part
		
		mux_2by1 last_mux(full_adder_sum, logic_out, c[2], y);
		
		initial begin
			$display("mux-logic-out = %b",y);
		end
		
endmodule
		