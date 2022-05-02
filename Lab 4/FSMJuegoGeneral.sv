module FSMJuegoGeneral(input rst, clk,input logic [2:0] x, output j, m);

	logic [1:0] estadoActual;
	logic [1:0] estadoSiguiente = 2'b00;
	logic [2:0] cartaActual;
	logic mAux;
	logic jAux;
	
	
	always_ff @(posedge clk, posedge rst) begin
		if(rst==1) begin
			estadoActual = 2'b00;
			end
		else begin
			estadoActual = estadoSiguiente;
			end
		end
	
	always @(clk) begin	
		
		//estadoActual= estadoSiguiente;
		case(estadoActual)
			2'b00: begin
					$display("Estado 0");
					estadoSiguiente = 2'b01;
					mAux = 0;
					jAux = 0;
					cartaActual = x;
				end
				
			2'b01: begin
					$display("Estado 1");
					if(x == cartaActual) begin
						estadoSiguiente = 2'b00;
						jAux=1;
						cartaActual = x;
						end
					else begin
						$display("NUNCA ENTRO AQUI");
						estadoSiguiente = 2'b10;
						jAux=0;
						cartaActual = x;
						end
					mAux=0;
				end-
			2'b10: begin
					$display("Estado 2");
					estadoSiguiente= 2'b11;
					mAux=1;
					jAux=0;
					cartaActual = x;
				end
			2'b11: begin
					$display("Estado 3");
					if(x==cartaActual) begin
						estadoSiguiente= 2'b10;
						jAux=1;
						cartaActual = x;
						end
					else begin
						estadoSiguiente = 2'b00;
						jAux=0;
						cartaActual = x;
						end
					mAux=1;
				end
			default: estadoSiguiente = 2'b00;
		endcase
	end
	assign m = mAux;
	assign j = jAux;
	

endmodule