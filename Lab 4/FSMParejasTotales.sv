module FSMParejasTotales(input rst, clk, j, m, output l);

	logic [3:0] contador; 
	logic [1:0] estadoActual;
	logic [1:0] estadoSiguiente = 2'b00;
	//logic [2:0] cartaActual=0;
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
					else estadoSiguiente=0;
					contador = 4'b0000;
					lAux=0;
					
				end
			1: begin
					if(j==1) estadoSiguiente=2;
					else estadoSiguiente=1;
					contador =4'b0001;
					lAux=0;
					
				end
			2: begin
					if(j==1) estadoSiguiente=3;
					else estadoSiguiente=2;
					contador = 4'b0010;
					lAux=0;
					
				end	
			3: begin
					if(j==1) estadoSiguiente=4;
					else estadoSiguiente=3;
					contador =4'b0011;
					lAux=0;
					
				end	
			4: begin
					if(j==1) estadoSiguiente=5;
					else estadoSiguiente=4;
					contador =4'b0100;
					lAux=0;
					
				end	
			5: begin
					if(j==1) estadoSiguiente=6;
					else estadoSiguiente=5;
					contador =4'b0101;
					lAux=0;
					
				end
			6: begin
					if(j==1) estadoSiguiente=7;
					else estadoSiguiente=6;
					contador =4'b0110;
					lAux=0;
					
				end	
			7: begin
					if(j==1) estadoSiguiente=8;
					else estadoSiguiente=7;
					contador =4'b0111;
					lAux=0;
					
				end
			8: begin
					if(j==1) estadoSiguiente=9;
					else estadoSiguiente=8;
					contador =4'b1000 ;
					lAux=0;
					
				end
			9: begin
					estadoSiguiente=9;
					contador =4'b1001;
					lAux=1;
				end		
			
			default: begin 
				estadoSiguiente=0;
				contador =4'b0000;
				lAux=0;
				end
		endcase
		
		assign l=lAux;

	
	

endmodule