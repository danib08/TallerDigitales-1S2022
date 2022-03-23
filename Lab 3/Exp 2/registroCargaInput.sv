module registroCargaInput #(parameter n = 4) (input [n-1:0] a, b, input clk, rst, output [3*(n-1):0] s);
	
	logic saux = 0;
	
	always @ (posedge clk or posedge rst)
		if (rst)
			saux = 0;
		else 
			saux = {a,b};
			
	assign s = saux;

endmodule