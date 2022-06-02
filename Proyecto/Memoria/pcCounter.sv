module pcCounter #(parameter N=32) (input clk, rst, en, output logic [N-1:0] q);

	always_ff @(posedge clk or posedge rst)
		if(rst)
			q=32'h00;
		else
			if(en)
				q=q+4;
				
endmodule