module FSMJuegoGeneral(input clk, rst, x, output j, m);

	logic [1:0] estadoActual, estadoSiguiente;
	logic [2:0] cartaActual;
	
	
	always_ff @(posedge clk or posedge rst)
		if(rst) 
			estadoActual=0;
		else:
			estadoActual= estadoSiguiente;
	
	always_comb
		case(estadoActual)
			0: estadoSiguiente=1;
				assign m=0;
			1: if(x==cartaActual)
					estadoSiguiente=0;
					assign j=1;
					
				else
					estadoSiguiente=2;
					assign j=0;
				assign m=0;
			2: estadoSiguiente= 3;
				assign m=1;
			3: if(x==cartaActual)
					estadoSiguiente=2;
					assign j=1;
				else
					estadoSiguiente=0;
					assign j=0;
				assign m=1;
			default: estadoSiguiente=0;
		endcase	
	

endmodule