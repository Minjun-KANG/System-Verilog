module tb_fsm();
      logic clk, reset, in_seq;
      fsm dut(clk, reset, in_seq, moore_Y, mealy_Y);

      always begin 
        clk = 1; #5;
        clk = 0; #5;
      end 

      initial begin
         reset = 1; #5;
         reset =0;
      end

     initial begin
        in_seq = 0; #10;
        in_seq = 1; #10;
        in_seq = 0; #10;
        in_seq = 0; #10;
        in_seq = 1; #10;
        in_seq = 1; #10;
        in_seq = 0; #10;
        in_seq = 1; #10;
        in_seq = 1; #10;
        in_seq = 1; #10;
       $stop;
    end
endmodule