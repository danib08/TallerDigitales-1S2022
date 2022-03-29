module restador #(parameter n = 4) ( input [n-1:0] a, b, output [n-1:0] c, output [3:0] banderas);
	
	logic [n:0] result;
	
	assign result = a - b; 
	
	assign banderas[0] = result[n]; //Negativo
   assign banderas[1] = result == 0;
   assign banderas [2] = 0;   //Acarreo
   assign banderas[3] = 0;    //Desbordamiento
	
	assign c = result;
	
endmodule
