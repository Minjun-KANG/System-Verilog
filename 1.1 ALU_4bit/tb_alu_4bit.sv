`timescale 1ns/100ps

module tb_alu_4bit ();
   
   logic [3:0] a,b,y;
   logic [2:0] cont;
   logic c4;
   logic [10:0] testvector [100:0];
   logic clk;
   logic [31:0] counter;

   alu_4bit top (a,b,cont,y,c4);
   
   always begin
      clk <=1;
      #5; clk = ~clk;
   end

   initial begin
      $readmemb("C:/Users/ansal/OneDrive/Desktop/Source code/Quartus/alu_4bit/testvector.txt",testvector);
      counter = 0;
   end

   always @(posedge clk) begin
      #1; {a,b,cont} = testvector[counter];
   end

   always @(negedge clk) begin
      $display($time, " a = %b, b = %b, cont = %b, y = %b",a,b,cont,y);
      counter = counter + 1;
      if (counter == 9) $stop;
   end

endmodule