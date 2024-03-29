module registroCargaInput #(parameter n = 4) (input [n-1:0] a, b, input clk, rst, btn, output [(2*n)-1:0] s);
	
	reg [(n*2)-1:0] saux;
	
	always @ (posedge clk, posedge rst, posedge btn) begin
		if (rst == 1) begin
			saux = 0;
		end else if (btn == 1) begin 
			saux = {a,b};
		end else begin
			saux=0;
		end
	end
	assign s = saux;

endmodule