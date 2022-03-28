module registroALU #(parameter n = 4) (input [n-1:0] a, b, input [3:0] operacion, output [6:0] display, input clk, rst, btn);
	
	logic [n-1:0] saux;
	
	Registro #(n) registroDisplay(a, b, clk, rst, btn, saux, ~operacion);
	decodificador deco(saux, display);		
	
endmodule