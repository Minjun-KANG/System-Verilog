module full_adder(input logic a,b,cin, output logic s, cout);
	assign s = (a^b) ^ cin;
	assign cout = (a&b) | (( a ^ b ) & cin );
	
	initial begin
		$display("I am full_adder");
		$display("a=%b, b=%b, cin=%b, cout=%b",a,b,cin,cout);
	end
	
endmodule
