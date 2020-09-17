module mux_2by1(input logic hh1,hh2,hh3, 
					 output logic uu);
	
	assign uu=((hh1&hh3) | (hh2&(~hh3)));
	
	initial begin
		$display("I am MUX");
		$display("a=%b, b=%b, s=%b, y=%b",hh1,hh2,hh3,uu);
	end
endmodule


