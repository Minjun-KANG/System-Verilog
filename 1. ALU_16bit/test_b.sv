module test_b();
	
	logic clk;
	logic [15:0] a, b, sum;
	logic [2:0]c;
	logic [31:0] counter;
	logic [31:0] testvector [3:0];
	
	logic hh1, hh2, hh3;
	assign hh1 = 1;
	assign hh2 = 0;
	assign hh3 = 1;
	
	mux_2by1 m1(hh1, hh2, hh3, uu);
	//mux_2by1 m1(.a(x), .b(y), .s(z), .y(xx));
	//ALU_16 ALU_Logic(a,b,c,sum);
	
	//mux_2by1 m1(.x(a), .y(b), .z(s), .xx(y));
	/*
	//timing statement, a delay of 5sec for each high and low
	always begin
		clk <= 1; #5; clk <= 0; #5;
	end
	
	
	initial begin
		$readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/ALU_16/testvector.txt"
		, testvector);
		counter = 0;
	end
	//this process is triggerd for every rising edge of the clock 
	always @(posedge clk) begin
		#1; {a,b} = testvector[counter];
	end
	
	
	//this process is triggerd for every falling edge of the clock 
	always @(negedge clk) begin
		$display("value of a=%b, b=%b, c=%b, s=%b",a,b,c,sum);
		counter = counter + 1;
		if(counter == 5) //hit break on the simulation
			$stop;
	end
	*/
	initial begin
		$display("mux data : %b",xx);
	end
	
endmodule
