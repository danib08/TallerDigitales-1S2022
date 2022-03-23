module registroCargaOutput #(parameter n = 4) ( input [n-1:0] s, input clk, rst, output [n-1:0] r);
	
	logic raux = 0;
	
	always @ (negedge clk or posedge rst)
		if (rst)
			raux = 0;
		else
			raux = s;
	
	assign r = raux;

endmodule