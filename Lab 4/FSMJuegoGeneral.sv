module FSMJuegoGeneral(input rst, clk, btnSelect, input [3:0] x, flagTemp, selection, output j, m );

	logic [1:0] estadoActual= 2'b00;
	logic [1:0] estadoSiguiente = 2'b00;
	logic [3:0] cartaActual;
	logic mAux;
	logic jAux;
	logic [3:0] xAux;

	
	always_ff @(posedge clk, posedge rst) begin
		if(rst==1) begin
			estadoActual = 2'b00;
			end
		else begin
			estadoActual = estadoSiguiente;
			end
		end
		
		
	always @(posedge selection) begin	
		xAux = x;
		$display("X es: %b",xAux);
		case(estadoActual)
			2'b00: begin
					$display("Estado 0");
					estadoSiguiente = 2'b01;
					mAux = 0;
					jAux = 0;
					cartaActual = xAux;
				end
				
			2'b01: begin
					$display("Estado 1");
					if(x == cartaActual) begin
						estadoSiguiente = 2'b00;
						jAux=1;
						cartaActual = xAux;
						
						end
					else begin
						$display("NUNCA ENTRO AQUI");
						estadoSiguiente = 2'b10;
						jAux=0;
						cartaActual = xAux;
						end
					mAux=0;
				end-
			2'b10: begin
					$display("Estado 2");
					estadoSiguiente= 2'b11;
					mAux=1;
					jAux=0;
					cartaActual = xAux;
				end
			2'b11: begin
					$display("Estado 3");
					if(x==cartaActual) begin
						estadoSiguiente= 2'b10;
						jAux=1;
						cartaActual = xAux;
						end
					else begin
						estadoSiguiente = 2'b00;
						jAux=0;
						cartaActual = xAux;
						end
					mAux=1;
				end
			default: estadoSiguiente = 2'b00;
		endcase
	end
	
	
	/**always @(clk) begin
		if(~jAux) begin
			memoryGame[y1][x1][3]=0;
			memoryGame[y2][x2][3]=0;
			  end
   end **/
	
	
	assign m = mAux;
	assign j = jAux;


endmodule