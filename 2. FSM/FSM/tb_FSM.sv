module tb_FSM();
	logic clk, reset, in_seq;
	FSM dut(clk, reset, in_seq, moore_Y, mealy_Y);


	always begin 
		clk = 1; #5;
		clk = 0; #5;
		$display("in_seq : %b, moore = %b , mealy = %b",in_seq,moore_Y,mealy_Y); 
	end 

	initial begin
		reset = 1; #5;
		reset = 0;
	end
	
//00110110_11011100_00111011_01101011_01110001
//      ^  ^  ^  ^       ^^   ^  ^     ^  ^   //output
//      5  5  5  6       65   5  6     5  6   //For each next state (in Moore)
//      1  1  1  3       31   1  1     1  3   //For each next state (in Mealy)
	initial begin
		in_seq = 0; #10; in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10;
		in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10; in_seq = 0; #10;
		
		in_seq = 1; #10; in_seq = 1; #10; in_seq = 0; #10; in_seq = 1; #10;
		in_seq = 1; #10; in_seq = 1; #10; in_seq = 0; #10; in_seq = 0; #10;
		
		in_seq = 0; #10; in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10;
		in_seq = 1; #10; in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10;
		
		in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10; in_seq = 0; #10;
		in_seq = 1; #10; in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10;
		
		in_seq = 0; #10; in_seq = 1; #10; in_seq = 1; #10; in_seq = 1; #10;
		in_seq = 0; #10; in_seq = 0; #10; in_seq = 0; #10; in_seq = 1; #10;
		$stop;
	end
endmodule