module FSMJuegoGeneral(input clk, rst, x, output j, m);

	logic [1:0] estadoActual, estadoSiguiente;
	logic [2:0] cartaActual=0;
	logic mAux;
	logic jAux;
	
	
	always_ff @(posedge clk or posedge rst)
		if(rst) 
			estadoActual=0;
		else
			estadoActual= estadoSiguiente;
	
	always_comb
		case(estadoActual)
			0: begin
					estadoSiguiente=1;
					mAux=0;
				end
				
			1: begin
					if(x==cartaActual) begin
						estadoSiguiente=0;
						//jAux=1;
						end
					else begin
						estadoSiguiente=2;
						//jAux=0;
						end
					mAux=0;
				end
			2: begin
					estadoSiguiente= 3;
					mAux=1;
				end
			3: begin
					if(x==cartaActual) begin
						estadoSiguiente=2;
						//jAux=1;
						end
					else begin
						estadoSiguiente=0;
						//jAux=0;
						end
					mAux=1;
				end
			default: estadoSiguiente=0;
		endcase
	assign m = mAux;
	assign j = jAux;
	

endmodule