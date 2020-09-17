module tb_Three_XNOR_logic();
	
	logic clk, a, b, c;
	Three_XNOR_logic dut(a,b,c,y); //dut : device under test
	
	always begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial begin
		a = 0; b = 0; c = 0; #10;
		a = 0; b = 0; c = 1; #10;
		a = 0; b = 1; c = 0; #10;
		a = 0; b = 1; c = 1; #10;
		a = 1; b = 0; c = 0; #10;
		a = 1; b = 0; c = 1; #10;
		a = 1; b = 1; c = 0; #10;
		a = 1; b = 1; c = 1; #10;
	end
endmodule