module  Registro #(parameter n = 2) (input [n-1:0] a, b, input clk, rst, output [n-1:0] salida, input [3:0] operacion);
	
	logic [n-1:0] x,y,raux;
	logic [3:0] flagsAux;
	
	
	registroCargaInput #(n) registro1( a, b, clk, rst, {x,y});
	calculadora #(n) calcuAlu(x, y, operacion, raux, flagsAux);
	registroCargaOutput #(n) registro2(raux, clk, rst, salida);


endmodule