module tb_Memory();

	logic clk;
	logic we_single, we_dual;
	logic [2:0] addr, addr_wr,addr_rd;
	logic [3:0] din;
	logic [4:0] counter;
	logic [3:0] dout_single, dout_dual;
	
	Memory dut(clk, we_single, we_dual, addr, addr_wr, addr_rd, din, dout_single, dout_dual, empty, full);
	 
	always begin
		clk = 1; #5;
		clk = 0; #5;
	end
	
	initial begin
		counter = 0;
	end
	
	always @ (posedge clk) begin
		counter <= counter + 1;
			if(counter == 4'b0000) begin
				we_single = 1; addr = 2'b11;
				//Put counter in din, set addr and put it in dout.
				we_dual = 1; addr_rd = 2'b11; addr_wr = 2'b11;
				//For dual, addr is set according to the counter value.
				din = counter[2:0];
				//din is common
			end
			else if(counter == 4'b0001) begin
				we_single = 1; addr = 2'b00;
				we_dual = 1; addr_rd = 2'b10; addr_wr = 2'b00;
				din = counter[2:0];
			end
			else if(counter == 4'b0010) begin
				we_single = 1; addr = 2'b10;
				we_dual = 1; addr_rd = 2'b01; addr_wr = 2'b10;
				din = counter[2:0];
			end
			else if(counter == 4'b0011) begin
				we_single = 1; addr = 2'b01;
				we_dual = 1; addr_rd = 2'b00; addr_wr = 2'b01;
				din = counter[2:0];
			end
			else if(counter == 4'b1000) begin
				we_single = 1; addr = 2'b11;
				we_dual = 1; addr_rd = 2'b11; addr_wr = 2'b11;
				din = counter[3:1];
			end
			else if(counter == 4'b1001) begin
				we_single = 1; addr = 2'b11;
				we_dual = 1; addr_rd = 2'b11; addr_wr = 2'b11;
				din = counter[2:0];
			end
			else if(counter == 4'b1111) begin
				$stop;
			end
			else begin //When counter is not applicable,
				we_single = 0; we_dual = 0;
				if(counter == 4'b0100) begin
					addr = 2'b11;
					addr_rd = 2'b11; addr_wr = 2'b11;
				end
				if(counter == 4'b0101) begin
					addr = 2'b00;
					addr_rd = 2'b00; addr_wr = 2'b10;
				end
				if(counter == 4'b0110) begin
					addr = 2'b10;
					addr_rd = 2'b10; addr_wr = 2'b01;
				end
				if(counter == 4'b0111) begin
					addr = 2'b01;
					addr_rd = 2'b01; addr_wr = 2'b00;
				end
				if(counter == 4'b1010) begin
					addr = 2'b01;
					addr_rd = 2'b01; addr_wr = 2'b00;
				end
			end
	end

endmodule
		
				
				
				
				
				
				
				
				
				
				
			