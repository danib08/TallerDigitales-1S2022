module FSMJuegoGeneral(input rst, clk, btnSelect, input logic [1:0] posX, posY,input reg [4:0]segundo, output j, m, output reg [3:0] memoryGameAux [0:3][0:3]);

	logic [1:0] estadoActual;
	logic [1:0] estadoSiguiente = 2'b00;
	logic [3:0] cartaActual;
	logic mAux;
	logic jAux;
	logic [3:0] x;
	logic contadorSeleccion=0;
	logic [1:0] x1,x2,y1,y2;
	reg [3:0] memoryGame [0:3][0:3];
	logic flagTemp=0;
	logic flagVuelta=1;
	logic [1:0]posXaux;
	logic [1:0]posYaux;
	
	
	always @(segundo)
	begin
		$display(segundo);
		if(segundo == 5'b11110) begin
			flagTemp=1;
			$display("Se elije carta Random");
			end
	end
	
	
	initial begin	
		memoryGame[0][0] = 4'b0000;
		memoryGame[0][1] = 4'b0011;
		memoryGame[0][2] = 4'b0110;
		memoryGame[0][3] = 4'b0010;
		memoryGame[1][0] = 4'b0110;
		memoryGame[1][1] = 4'b0100;
		memoryGame[1][2] = 4'b0001;
		memoryGame[1][3] = 4'b0111;
		memoryGame[2][0] = 4'b0001;
		memoryGame[2][1] = 4'b0101;
		memoryGame[2][2] = 4'b0111;
		memoryGame[2][3] = 4'b0000;
		memoryGame[3][0] = 4'b0100;
		memoryGame[3][1] = 4'b0010;
		memoryGame[3][2] = 4'b0101;
		memoryGame[3][3] = 4'b0011;
	
	end 
	
	always_ff @(posedge clk, posedge rst) begin
		if(rst==1) begin
			estadoActual = 2'b00;
			end
		else begin
			estadoActual = estadoSiguiente;
			end
		end
		
	always @(posedge clk) begin
		if(btnSelect) begin
			if(contadorSeleccion == 0 ) begin
						x1=posX;
						y1=posY;
						memoryGame[posY][posX][3]=1;
						contadorSeleccion = 1;
						$display("Carta 1");
				  end
			else if(contadorSeleccion == 1) begin
						memoryGame[posY][posX][3]=1;
						x2=posX;
						y2=posY;
						
						contadorSeleccion = 0;
						$display("Carta 2");
			end 
		end
		else if(flagTemp) begin
		posXaux=2'b11;
		posYaux=2'b11;
		memoryGame[posYaux][posXaux][3]=1;
		$display("-------");
		$display("MemoryGame carta: %b",memoryGame[posXaux][posYaux]);
		$display("-------");
			/*
			while(flagVuelta) begin
				if(memoryGame[posY][posX][3]==0)
					flagVuelta=0;
					x2=posX;
					y2=posY;
			end
			*/
		end
   end
	
	always @(posedge btnSelect) begin	
		x= memoryGame[posY][posX];
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
	
	
	/**always @(clk) begin
		if(~jAux) begin
			memoryGame[y1][x1][3]=0;
			memoryGame[y2][x2][3]=0;
			  end
   end **/
	
	
	assign m = mAux;
	assign j = jAux;
	assign memoryGameAux=memoryGame;
	

endmodule