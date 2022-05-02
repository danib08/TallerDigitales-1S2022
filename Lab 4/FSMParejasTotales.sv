module FSMParejasTotales(input clk, rst, j, output l);

	logic [3:0] contador; 
	logic [3:0] estadoActual;
	logic [3:0] estadoSiguiente = 4'b0000;
	//logic [2:0] cartaActual=0;
	logic lAux=0;
	
	always_ff @(posedge clk or posedge rst)
		if(rst) 
			estadoActual=4'b0000;
		else
			estadoActual= estadoSiguiente;
	
	always @(clk) begin
		$display("Contador", contador);
		case(estadoActual)
			0: begin
					if(j==1) estadoSiguiente= 4'b0001;
					else estadoSiguiente=4'b0000;
					contador = 4'b0000;
					lAux=0;
					
				end
			1: begin
					if(j==1) estadoSiguiente=4'b0010;
					else estadoSiguiente=4'b0001;
					contador =4'b0001;
					lAux=0;
					
				end
			2: begin
					if(j==1) estadoSiguiente=4'b0011;
					else estadoSiguiente=4'b0010;
					contador = 4'b0010;
					lAux=0;
					
				end	
			3: begin
					if(j==1) estadoSiguiente=4'b0100;
					else estadoSiguiente=4'b0011;
					contador =4'b0011;
					lAux=0;
					
				end	
			4: begin
					if(j==1) estadoSiguiente=4'b0101;
					else estadoSiguiente=4'b0100;
					contador =4'b0100;
					lAux=0;
					
				end	
			5: begin
					if(j==1) estadoSiguiente=4'b0110;
					else estadoSiguiente=4'b101;
					contador =4'b0101;
					lAux=0;
					
				end
			6: begin
					if(j==1) estadoSiguiente=4'b0111;
					else estadoSiguiente=4'b0110;
					contador =4'b0110;
					lAux=0;
					
				end	
			7: begin
					if(j==1) estadoSiguiente=4'b1000;
					else estadoSiguiente=4'b0111;
					contador =4'b0111;
					lAux=0;
					
				end
			8: begin
					if(j==1) estadoSiguiente=4'b1001;
					else estadoSiguiente=4'b1000;
					contador =4'b1000 ;
					lAux=0;
					
				end
			9: begin
					estadoSiguiente=4'b1001;
					contador =4'b1001;
					lAux=1;
				end		
			
			default: begin 
				estadoSiguiente=0;
				contador =4'b0000;
				$display("sal de aqui-----------------------------");
				lAux=0;
				end
		endcase	
	end
	assign l=lAux;
		


	
	

endmodule