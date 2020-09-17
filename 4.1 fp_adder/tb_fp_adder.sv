module tb_fp_adder();
	
	logic clk;
	logic [31:0] a, b, sum;
	logic [63:0] counter;
	logic [63:0] testvector [5:0];

	fp_adder dut(a,b,sum);
	

	always begin
		clk = 1; #5;
		clk = 0; #5;
	end

	initial begin
		$readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/fp_adder/testbench.txt" ,testvector);
		counter = 0;
	end

	always @ (posedge clk) begin
		#1; {a, b} = testvector[counter];
	end

	always @ (negedge clk) begin
		$display("value of a = %b, b = %b, s = %b", a, b, sum);
		//$display("value of a = %b, b = %b, m = %b", a, b, mul);
		counter = counter + 1;
		if (counter == 7)
			$stop;
	end
	
endmodule

