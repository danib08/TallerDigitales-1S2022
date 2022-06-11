module highLevel #(parameter n = 4) (input [n-1:0] a,b, input [3 :0] operacion, output [6:0] display, output [3:0] flagsResult);
	logic [n-1:0] resultado;
	
	calculadora #(4) calcu(a ,b , ~operacion, resultado, flagsResult);
	
	decodificador deco(resultado, display);
	

endmodule