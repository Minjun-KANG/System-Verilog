module FSM(
   input clk , reset,
   input in_seq,
   output moore_Y, mealy_Y
);

   FSM_moore dut_moore(clk, reset , in_seq, moore_Y);
   FSM_mealy dut_mealy(clk, reset , in_seq, mealy_Y);
      endmodule 
   
// moore machine design ------------------------------------


module FSM_moore(
   input clk, reset, 
   input in_seq,
   output logic moore_Y
);
//moore state - my diagram using 7 states
	parameter S0 = 3'b000;  
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	parameter S5 = 3'b101; // output
	parameter S6 = 3'b110; // output

logic [2:0] state_moore,  next_state_moore;

//state register
always_ff @ (posedge clk, posedge reset) begin
	if(reset)
		state_moore <= S0;
	else 
		state_moore <= next_state_moore;
end   

//next state logic
always_comb begin
	case(state_moore)
		S0:
			if (in_seq)
				next_state_moore = S1;
			else 
				next_state_moore = S0;
		S1:
			if (in_seq)
				next_state_moore = S2;
			else 
				next_state_moore = S0;
		S2:
			if (in_seq)
				next_state_moore = S4;
			else 
				next_state_moore = S3;
		S3:
			if (in_seq)
				next_state_moore = S5;
			else 
				next_state_moore = S0;
		S4:
			if (in_seq)
				next_state_moore = S4;
			else 
				next_state_moore = S6;
		S5: //output state
			if (in_seq)
				next_state_moore = S2;
			else 
				next_state_moore = S0;
		S6: //output state
			if (in_seq)
				next_state_moore = S5;
			else 
				next_state_moore = S0;
		
		default : next_state_moore = S0;
	endcase
end

//output logic 
//This machine has Y = 1 when the state is S5 or S6.
	assign moore_Y = ((state_moore == S5) || (state_moore == S6));

endmodule

//moore end ----------------------------------------------









//mealy machine design ---------------------------------------
module FSM_mealy(
	input clk, reset, 
	input in_seq,
	output logic mealy_Y
);

	parameter S0 = 3'b000;
	parameter S1 = 3'b001;
	parameter S2 = 3'b010;
	parameter S3 = 3'b011;
	parameter S4 = 3'b100;
	
	logic [2:0] state_mealy,  next_state_mealy;

//state register
always_ff @ (posedge clk , posedge reset) begin
	if(reset) begin
		state_mealy <= S0;
	end  
	else begin 
		state_mealy <= next_state_mealy;
	end   
end

// next state logic
always_comb begin
	case(state_mealy)
	
		S0 : begin 
			if(in_seq)
				next_state_mealy <= S1;
			else 
				next_state_mealy <= S0;
		end
		
		S1 : begin
			if (in_seq)
				next_state_mealy <= S2;
			else 
				next_state_mealy <= S0;
		end
		
		S2 : begin
			if (in_seq)
				next_state_mealy <= S4;
			else 
				next_state_mealy <= S3;
		end
		
		S3 : begin
			if (in_seq)
				next_state_mealy <= S1;
			else 
				next_state_mealy <= S0;
		end
		
		S4 : begin
			if (in_seq)
				next_state_mealy <= S4;
			else 
				next_state_mealy <= S3;
		end
		
		default : next_state_mealy <= S0;
	endcase
end

//output logic 
	assign mealy_Y=((in_seq & state_mealy == S3) || ((!in_seq) & state_mealy == S4));


endmodule

 