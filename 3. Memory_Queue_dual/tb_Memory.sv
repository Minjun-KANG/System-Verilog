module tb_Memory();

	logic clk, rst;
	logic we_dual;
	logic [2:0] addr_wr,addr_rd;
	logic [3:0] din;
	logic [4:0] counter;
	logic [3:0] dout_dual;
	//logic [2:0] fifo_cnt;
	logic dual_empty, dual_full;
	
	
	Memory dut( 	
		//fifo_cnt,
		//dual memory logic
		clk, rst,
		we_dual,
		addr_wr, addr_rd, //initialize value
		din,
		//dual_wr_pt, dual_rd_pt,
		dual_empty, dual_full,
		dout_dual
	);
	
	always begin
		clk = 1; #10;
		clk = 0; #10;
		//we_dual = 1; #160;
	end
	
	initial begin
		counter = 0;
		rst = 0;
		dual_empty = 1;
		dual_full = 0;
		//fifo_cnt = 0;
	end
	
	always @ (posedge clk) begin
		if(~rst) begin
			addr_wr <= 3'b100;
			//addr_rd <= NULL;
			rst <= 1;
			
		end
		if(dual_full) begin
			rst <= 0;
		end
		counter <= counter + 1;
		if(counter == 5'b00000) begin 
				we_dual = 1; addr_wr = 3'b100; 
				din = counter[3:0];
		end
		else if(counter == 5'b00001) begin //8s
				we_dual = 1; addr_wr = 3'b101; 
				din = counter[3:0];
		end
		else if(counter == 5'b00010) begin 
				we_dual = 1; addr_wr = 3'b110; addr_rd = 3'b100;
				din = counter[3:0];
		end
		else if(counter == 5'b00011) begin //16s
				we_dual = 1; addr_wr = 3'b111; addr_rd = 3'b101; 
				din = counter[3:0];
		end
		else if(counter == 5'b00100) begin 
				we_dual = 0;  addr_rd = 3'b110; 
				din = counter[3:0];
		end
		else if(counter == 5'b00101) begin  //24s
				we_dual = 0;  addr_rd = 3'b111; 
				din = counter[3:0];
		end
		else if(counter == 5'b00110) begin //28s
				we_dual = 1; addr_wr = 3'b000; addr_rd = 3'b000; 
				din = counter[3:0];
		end
		else if(counter == 5'b00111) begin //others
				we_dual = 0; 
				din = counter[3:0];
		end
	end
	
endmodule
