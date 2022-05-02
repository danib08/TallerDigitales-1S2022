module contador(input rst, j,m, output cj1,cj2);
	
	always_ff @(posedge rst, posedge j) begin
		if(rst) begin
			cj1=0;
			cj2=0;
			end
		else
			if(m==0) begin
				cj1=cj1+1;
				end
			else 
				cj2=cj2+1;
	end
	
	
endmodule