module FSMJuegoGeneral(input rst, clk, x, output j, m);

	logic [1:0] estadoActual, estadoSiguiente;
	logic [2:0] cartaActual=3'b000;
	logic mAux;
	logic jAux;
	
	
	always_ff @(posedge clk or posedge rst)
		if(rst) 
			estadoActual = 2'b00;
		else
			estadoActual= estadoSiguiente;
	
	always_comb begin
		$display("Carta Actual %b",cartaActual);
		$display("Estado Actual %d",estadoActual);
		cartaActual=x;
		case(estadoActual)
			0: begin
					$display("Estado 0");
					estadoSiguiente = 2'b01;
					mAux = 0;
					jAux = 0;
				end
				
			1: begin
					$display("Estado 1");
					if(x==cartaActual) begin
						estadoSiguiente = 2'b00;
						jAux=1;
						end
					else begin
						estadoSiguiente = 2'b10;
						jAux=0;
						end
					mAux=0;
				end
			2: begin
					$display("Estado 2");
					estadoSiguiente= 2'b11;
					mAux=1;
					jAux=0;
				end
			3: begin
					$display("Estado 3");
					if(x==cartaActual) begin
						estadoSiguiente= 2'b10;
						jAux=1;
						end
					else begin
						estadoSiguiente = 2'b00;
						jAux=0;
						end
					mAux=1;
				end
			default: estadoSiguiente = 2'b00;
		endcase
	end
	assign m = mAux;
	assign j = jAux;
	

endmodule