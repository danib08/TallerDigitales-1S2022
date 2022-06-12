module mov #(parameter n = 32) ( input [n-1:0] b, output [n-1:0] c, output [3:0] banderas);
	
	logic [n-1:0] result;
	
	assign result = b;
	
	assign banderas[3] = 0; 
	assign banderas[2] = 0; 
	assign banderas[1] = 0; 		
	assign banderas[0] = 0;			
	
	assign c = result;	
		
endmodule