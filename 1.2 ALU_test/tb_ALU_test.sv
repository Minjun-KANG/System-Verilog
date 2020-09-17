`timescale 1ns/100ps

module tb_ALU_test();

	logic clk;
   logic [15:0] a, b, sum;
   logic [2:0]c;
   logic [31:0] counter;
   logic [34:0] testvector [10:0];
	
	ALU_test ALU_Logic(a,b,c,sum);
	
	 always begin
      clk <=1; #5; clk = ~clk;
    end
	
   initial begin
      $readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/ALU_test/testvector.txt"
      , testvector);
      counter = 0;
   end
   //this process is triggerd for every rising edge of the clock 
   always @(posedge clk) begin
      #1; {a,b,c} = testvector[counter];
   end
   
   
   //this process is triggerd for every falling edge of the clock 
   always @(negedge clk) begin
      $display($time, " a = %b, b = %b, c = %b, s = %b",a,b,c,sum);
      counter = counter + 1;
      if(counter == 15) //hit break on the simulation
         $stop;
   end
   
endmodule


/*
   logic clk;
	logic a,b,s;
   //logic [15:0] a, b, sum;
   logic [2:0]c;
   logic [31:0] counter;
   logic [34:0] testvector [10:0];
   
//case 1 : mux_test
	mux_2by1 m1(a,b,s,y);
   
   //timing statement, a delay of 5sec for each high and low
   always begin
      clk <=1;
      #5; clk = ~clk;
   end
   
	
	always @(posedge clk) begin
      #1; {a,b,s} = 3'b101;
   end
	always @(negedge clk) begin
      $display($time, " a = %b, b = %b, c = %b, s = %b",a,b,s,y);
      counter = counter + 1;
      if(counter == 1) //hit break on the simulation
         $stop;
   end
	*/
   