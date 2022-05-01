module contador(input rst, j, output salida);
	
	always_ff @(posedge rst, posedge j) begin
		if(rst)
			salida=0;
		else
			salida=salida+1;
	end
	
	
endmodule