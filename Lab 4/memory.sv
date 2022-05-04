module memory(input rst, clk, btnSelect, input logic [1:0] posX, posY , output x, input reg [4:0]segundo, output reg [3:0] memoryGameAux [0:3][0:3]);
	 

	logic [3:0] xAux;
	logic contadorSeleccion=0;
	logic [1:0] x1,x2,y1,y2;
	reg [3:0] memoryGame [0:3][0:3];
	logic flagTemp=0;
	logic flagVuelta=1;
	logic [1:0]posXaux;
	logic [1:0]posYaux;
	

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
		if(btnSelect) begin
			if(contadorSeleccion == 0 ) begin
						x1=posX;
						y1=posY;
						memoryGame[posY][posX][3]=1;
						contadorSeleccion = 1;
						$display("Carta 1");
						xAux = memoryGame[posY][posX];
				  end
			else if(contadorSeleccion == 1) begin
						memoryGame[posY][posX][3]=1;
						x2=posX;
						y2=posY;
						contadorSeleccion = 0;
						$display("Carta 2");
						xAux = memoryGame[posY][posX];
			end 
		end
		// entra al else la primera vez que se hace el clock cuando se esta en 30segundos
		//una vez entra la flag se activa y así ya no vuelve a entrar mientras que el clk este en 30s
		else if(segundo >= 30 && flagTemp == 0) begin
			flagTemp = 1; // se activa la flag la primera vez que entra
			
			if(memoryGame[2][0][3] == 0) begin
				memoryGame[2][0][3] = 1;
				xAux = memoryGame[2][0];
			end	
			else if(memoryGame[1][3][3] == 0) begin
				memoryGame[1][3][3] = 1;
				xAux = memoryGame[1][3];
			end
			else if(memoryGame[0][2][3] == 0)begin
				memoryGame[0][2][3]= 1;
				xAux = memoryGame[0][2];
			end
			else if(memoryGame[3][0][3] == 0) begin
				memoryGame[3][0][3] = 1;
				xAux = memoryGame[3][0];
			end
			else if(memoryGame[2][2][3] == 0) begin
				memoryGame[2][2][3] = 1;
				xAux = memoryGame[2][2];
			end
		end
		else if(segundo == 1) begin
			flagTemp = 0;
		end
	end	
	
	assign memoryGameAux = memoryGame;
	assign x = xAux;
	
	
endmodule