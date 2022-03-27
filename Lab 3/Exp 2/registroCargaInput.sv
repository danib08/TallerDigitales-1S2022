module registroCargaInput #(parameter n = 4) (input [n-1:0] a, b, input clk, rst, btn, output [(2*n)-1:0] s);
	
	logic saux = 0;
	
	always @ (posedge clk, negedge rst, negedge btn) begin
		if (rst == 0) begin
			saux = 0;
		end else if (btn == 0) begin 
			saux = {a,b};
		end else begin 
			saux = 0;
		end
	end
	assign s = saux;

endmodule