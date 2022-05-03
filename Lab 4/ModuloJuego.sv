module ModuloJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown, btnSelect, output l, output reg [3:0] memoryGameAux [0:3][0:3]);

	logic m;
	logic j;
	logic ganador;
	reg [3:0] memoryJuego [0:3][0:3];
	logic [1:0] posX, posY;
	logic [3:0] cartaJugador;
	
	
	
	FSMJuegoGeneral juegoGeneral(rst, clk, btnSelect, posX, posY, j, m, memoryG/ameAux);
	//FSMParejasTotales parejasTotales(clk,rst, j, l);
	//scontador contadorJ(rst,j,m,counter1,counter2);
	
	controlesJuego controlesJuego(rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, posX, posY);
	
	
	


endmodule