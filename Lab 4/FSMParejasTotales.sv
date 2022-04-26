module FSMParejasTotales(input rst, clk, j, output l);

	logic [2:0] contador=0; 
	logic [1:0] estadoActual, estadoSiguiente;
	logic [2:0] cartaActual=0;
	logic lAux=0;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) 
			estadoActual=0;
		else
			estadoActual= estadoSiguiente;
	
	always_comb
		case(estadoActual)
			0: begin
					if(j==1) estadoSiguiente=1;
					//contador +=1;
				end
			1: begin
					if(j==1) estadoSiguiente=2;
					//contador +=1;
				end
			2: begin
					if(j==1) estadoSiguiente=3;
				end	
			3: begin
					if(j==1) estadoSiguiente=4;
				end	
			4: begin
					if(j==1) estadoSiguiente=5;
				end	
			5: begin
					if(j==1) estadoSiguiente=6;
				end
			6: begin
					if(j==1) estadoSiguiente=7;
				end	
			7: begin
					if(j==1) estadoSiguiente=8;
				end
			8: begin
					if(j==1) estadoSiguiente=9;
				end
			9: begin
					//lAux=1;
				end		
			
			default: estadoSiguiente=0;
		endcase
		
		assign l=lAux;

	
	

endmodule