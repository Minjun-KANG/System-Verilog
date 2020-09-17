module Memory( 
		//input [2:0] fifo_cnt,
		//dual memory logic
		input clk, rst,
		input we_dual,
		input [2:0] addr_wr, addr_rd, //initialize value
		input [3:0] din,
		
		output dual_empty, dual_full,
		output logic [3:0] dout_dual
);

		
		
		dual_port dut_dual(
			clk, 
			we_dual, 
			addr_wr, addr_rd, 
			din, 
			dout_dual
		);
		
		pointer pt(
			//fifo_cnt,
			clk, rst,
			we_dual,
			addr_wr, addr_rd, //initialize value
			dual_empty, dual_full 
		);
		
		

endmodule

module dual_port(
		input clk,
		input we_dual,
		input [2:0] addr_wr, addr_rd, //initialize value
		input [3:0] din,

		output logic [3:0] dout_dual
	
);
	
	logic [3:0] mem_dual [7:0]; // mem_dual[8][4] //front array index is data size
	
	always_ff @ (posedge clk) begin	
		if(we_dual) begin
			mem_dual[addr_wr] <= din;
		end
	end	
	
	
	assign dout_dual = mem_dual[addr_rd];
	
	
	
endmodule

module pointer(
		//input logic [2:0] dual_wr_pt, dual_rd_pt,
		//input [2:0] fifo_cnt, //max is 7
		input clk, rst,
		input we_dual,
		input [2:0] addr_wr, addr_rd, //initialize value
		output dual_empty, dual_full 
);
	
	
	logic [2:0] dual_wr_pt, dual_rd_pt;
	logic [2:0] fifo_cnt; //max is 7
	
	
	always_ff @ (posedge clk) begin
		if(~rst)
			fifo_cnt <= 0;
			
		dual_wr_pt <= addr_wr;
		dual_rd_pt <= addr_rd;
		if(we_dual) begin
			fifo_cnt <= fifo_cnt + 1;
			$display($time, "fifo_cnt = %b, we_dual = %b",fifo_cnt, we_dual);
		end
		
		
	end
	
	assign dual_empty = fifo_cnt == 0 ? 1 : 0;
	assign dual_full = fifo_cnt == 7 ? 1 : 0;
	
endmodule
