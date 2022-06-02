module multiplexor #(parameter WIDTH = 4)
	(input logic [WIDTH-1:0] pc, d1,
	input logic s,
	output logic [WIDTH-1:0] y);

	assign y = s ? d1 : pc;

endmodule