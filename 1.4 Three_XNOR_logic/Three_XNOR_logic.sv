module Three_XNOR_logic(input logic a,b,c, output logic y);
	assign y = ~(a^b^c);

endmodule