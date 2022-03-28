module registroCargaOutput #(parameter n = 4) ( input [n-1:0] s, input clk, rst, output [n-1:0] r);
	
	logic raux = 0;
	
	always @ (negedge clk, posedge rst) begin
		if (rst == 1) begin
			raux = 0;
		end else begin
			raux = s;
		end
	end
	
	assign r = raux;

endmodule