module NAND_logic (input logic a, b, output logic y);
	
	assign y = ~(a&b);
	
endmodule