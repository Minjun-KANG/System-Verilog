module tb_full_adder_16();
	logic [15:0] a,b,s;
	logic clk;
	logic [31:0] counter;
	logic [31:0] testvector [3:0];
	
	full_adder_16 dut(a,b,s); //using the 16bit adder module;
	
	
	//timing statement, a delay of 5sec for each high and low
	always begin
		clk <= 1; #5; clk <= 0; #5;
	end
	
	// read the test vector and initialize the counter
	initial begin
		$readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/full_adder/testvector.txt"
		, testvector);
		counter = 0;
	end
	//this process is triggerd for every rising edge of the clock 
	always @(posedge clk) begin
		#1; {a,b} = testvector[counter];
	end
	
	
	//this process is triggerd for every falling edge of the clock 
	always @(negedge clk) begin
		$display("value of a=%b, b=%b, s=%b",a,b,s);
		counter = counter + 1;
		if(counter == 5) //hit break on the simulation
			$stop;
	end
	
endmodule