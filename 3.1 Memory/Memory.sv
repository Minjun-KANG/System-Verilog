module Memory(
		
		input clk,
		input we_single,
		input [2:0] addr, //initialize value
		input [3:0] din,
		output logic [3:0] dout_single, dout_dual,
		input [2:0] dual_wr_pt, dual_rd_pt,
		output dual_empty, dual_full
		
		
		//input we_dual,
		//input [2:0] addr_wr, addr_rd,
		//input [2:0] s_wr_p, s_rd_p,
		//output si_empty, si_full,
);

	//single_port dut_single(clk, we_single, addr, din, dout_single, si_empty, si_full);
	dual_port dut_dual(clk, we_dual, addr_wr, addr_rd, din, dout_dual, du_empty, du_full);
	
endmodule


module dual_port(
		input clk,
		input we_dual,
		input [2:0] addr_wr, addr_rd,
		input [3:0] din,
		input [2:0] d_wr_p, d_rd_p,
		output logic [3:0] dout_dual,
		output du_empty, du_full,
		output reg [3:0] fifo_cnt
		
);
	

	logic [3:0] mem_dual [7:0]; // mem_dual[4][3] //front array index is data size
	
	always_ff @ (posedge clk) begin
		if(we_dual) begin
			mem_dual[addr_wr] <= din;
			fifo_cnt <= fifo_cnt + 1;
		end
	end	
	
	assign du_empty = (fifo_cnt==0);
	assign du_full = (fifo_cnt==8);
	assign dout_dual = mem_dual[addr_rd];
	
	//pointer dual_pt(clk, we_dual, empty, full);

endmodule


module dual_pointer(
		input clk,
		input we_dual,
		input [2:0] addr_wr, addr_rd,
		input [2:0] d_wr_p, d_rd_p,
		output reg [3:0] fifo_cnt,
		output du_empty, du_full
);

endmodule



/*
///////////////////////////////////single port
module single_port(
		input clk,
		input we_single,
		input [2:0] addr,
		input [3:0] din,
		input [2:0] s_wr_p, s_rd_p,
		output logic [3:0] dout_single,
		output si_empty, si_full,
		output reg [3:0] fifo_cnt
		
);
	
	
	logic [3:0] mem_single [7:0];

	
	always_ff @ (posedge clk) begin
		if(we_single) begin
			mem_single[addr] <= din;
			fifo_cnt <= fifo_cnt + 1;
		end
	end
	
	assign si_empty = (fifo_cnt==0);
	assign si_full = (fifo_cnt==8);
	assign dout_single = mem_single[addr];
	
	//pointer single_pt(clk, we_single, empty, full);

endmodule
module single_pointer(
		input clk,
		input we_single,
		input [2:0] addr,
		input [2:0] s_wr_p, s_rd_p,
		output reg [3:0] fifo_cnt,
		output si_empty, si_full
		
);

endmodule
*/
////////////////////////////////////dual port





