module memory(input rst, clk, btnSelect, j, input logic [1:0] posX, posY, input reg [4:0]segundo, output logic [3:0] x, output flagTempAux, selection, output reg [3:0] memoryGameAux [0:3][0:3] );
	 

	logic [3:0] xAux;
	logic contadorSeleccion=0;
	logic [1:0] x1,x2,y1,y2;
	reg [3:0] memoryGame [0:3][0:3];
	logic flagTemp=0;
	logic flagVuelta=1;
	logic [1:0]posXaux;
	logic [1:0]posYaux;
	logic selectionAux;
	

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
	
	
	always @(posedge clk) begin
		selectionAux=0;
		
		
		if(btnSelect) begin
			selectionAux=1;
			if(contadorSeleccion == 0 && memoryGame[posY][posX][3] == 0) begin
				x1=posX;
				y1=posY;
				memoryGame[posY][posX][3]=1;
				contadorSeleccion = 1;
				$display("______________________");
				$display("Carta 1");
				xAux = memoryGame[posY][posX];
				$display("Valor de x %b", memoryGame[posY][posX]);
				$display("Valor de X1: %d", x1);
				$display("Valor de Y1: %d", y1);
			end
			else if(contadorSeleccion == 1 && memoryGame[posY][posX][3] ==0) begin
				memoryGame[posY][posX][3]=1;
				x2=posX;
				y2=posY;
				// 0100-> 1100
				xAux = memoryGame[posY][posX];
				contadorSeleccion = 0;
				$display("______________________");
				$display("Carta 2");
				$display("Valor de x %b", memoryGame[posY][posX]);
				$display("Valor de X1: %d", x1);
				$display("Valor de Y1: %d", y1);
				$display("Valor de X2: %d", x2);
				$display("Valor de Y2: %d", y2);
				// ----------- PONER COMO UN TEMPORIZADOR O DELAY --------------
				if(memoryGame[y1][x1]!= memoryGame[y2][x2])  begin
					$display("No son pareja entonces las vuelve a tapar");
					$display("______________________");
					memoryGame[y1][x1][3]=0;
					memoryGame[y2][x2][3]=0;
					// 0100
					xAux = memoryGame[posY][posX];
					
					end
				$display("Valor de Carta1: %b", memoryGame[y1][x1]);
				$display("Valor de Carta2: %b", memoryGame[y2][x2]);
			end 
		end
		// entra al else la primera vez que se hace el clock cuando se esta en 30segundos
		//una vez entra la flag se activa y así ya no vuelve a entrar mientras que el clk este en 30s
		
		/**
		else if(segundo >= 30 && flagTemp == 0) begin
			flagTemp = 1; // se activa la flag la primera vez que entra
			selectionAux=1;
			
			if(memoryGame[2][0][3] == 0) begin
				$display("---1---");
				memoryGame[2][0][3] = 1;
				xAux = memoryGame[2][0];
			end	
			else if(memoryGame[1][3][3] == 0) begin
				$display("---2---");
				memoryGame[1][3][3] = 1;
				xAux = memoryGame[1][3];
			end
			else if(memoryGame[0][2][3] == 0)begin
				$display("---3---");
				memoryGame[0][2][3]= 1;
				xAux = memoryGame[0][2];
			end
			else if(memoryGame[3][0][3] == 0) begin
				$display("---4---");
				memoryGame[3][0][3] = 1;
				xAux = memoryGame[3][0];
			end
			else if(memoryGame[2][2][3] == 0) begin
				$display("---5---");
				memoryGame[2][2][3] = 1;
				xAux = memoryGame[2][2];
			end
		end
		
		else if(segundo == 1) begin
			flagTemp = 0;
		end
		
		**/
	end
	
	assign memoryGameAux = memoryGame;
	assign x = xAux;
	assign flagTempAux= flagTemp;
	assign selection=selectionAux;
	
	
endmodule