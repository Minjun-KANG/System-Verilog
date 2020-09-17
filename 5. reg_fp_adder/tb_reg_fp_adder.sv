module tb_reg_fp_adder();
	
	logic clk, reset;
	logic [31:0] a, b, sum;
	logic [63:0] counter;
	logic [63:0] testvector [5:0];

	reg_fp_adder dut(clk, reset, a, b, sum);
	

	always begin
		clk = 1; #5;
		clk = 0; #5;
	end

	initial begin
		$readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/reg_fp_adder/testbench.txt" ,testvector);
		counter = 0;
		reset = 1;
		#7 reset = 0;
	end

	always @ (posedge clk) begin
		#1; {a, b} = testvector[counter];
	end

	always @ (negedge clk) begin
		{a, b} = testvector[counter];

		counter = counter + 1;
		if (counter == 7)
			$stop;
	end
	
endmodule

