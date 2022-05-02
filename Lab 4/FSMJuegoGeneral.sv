module FSMJuegoGeneral(input rst, clk,input logic [2:0] x, output j, m);

	logic [1:0] estadoActual=2'b00;
	logic [1:0] estadoSiguiente=2'b00;
	logic [2:0] cartaActual=3'b000;
	logic mAux;
	logic jAux;
	
	
	always_ff @(posedge clk, posedge rst) begin
		if(rst==1) begin
			estadoActual = 2'b00;
			end
		else begin
			estadoActual= estadoSiguiente;
			end
		end
	
	always_comb begin
		$display("Carta Actual %b",cartaActual);
		$display("Carta X %b",x);
		
		cartaActual=x;
		//estadoActual= estadoSiguiente;
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