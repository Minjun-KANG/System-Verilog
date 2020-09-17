module tb_NAND_logic();

	logic clk, a,b;
	NAND_logic dut(a,b,y);
	
	always begin
		clk = 1; #5 $display ($time, " CLK=%b",clk);
		clk = 0; #5 $display ($time, " CLK=%b",clk);
		//$stop;
		
	end
	
	initial begin
		a = 0; b = 0; #10 $display($time, " a=%b, b=%b, y=%b",a,b,y);
		a = 0; b = 1; #10 $display($time, " a=%b, b=%b, y=%b",a,b,y);
		a = 1; b = 0; #10 $display($time, " a=%b, b=%b, y=%b",a,b,y);
		a = 1; b = 1; #10 $display($time, " a=%b, b=%b, y=%b",a,b,y);
		//$stop;
		
	end
endmodule