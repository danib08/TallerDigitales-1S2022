module modulo #(parameter n = 4) ( input [n-1:0] a, b, output [n-1:0] c, output [3:0] banderas);
	
	logic [n:0] result;
	
	assign result = a % b; 
		
	assign banderas[0] = 1; //Negativo
	assign banderas [2] = ~result[n]; // Acarreo
	assign banderas[3] = ~result[n];	// Desbordamiento

	assign c = result;	
	
endmodule