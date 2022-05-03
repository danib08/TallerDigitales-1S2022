module ModuloJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown, btnSelect, output l, counter1,counter2);

	logic m;
	logic j;
	logic ganador;
	logic flagJ;
	logic flagL;
	reg [3:0] memoryJuego [0:3][0:3];
	logic [1:0] posX, posY;
	
	
	logic [3:0] cartaJugador;
	memory memoria(rst, memoryJuego);
	
	FSMJuegoGeneral juegoGeneral(rst, clk, memoryJuego, posX, posY, j, m);
	//FSMParejasTotales parejasTotales(clk,rst, j, l);
	//contador contadorJ1(rst,j,m,counter1,counter2);
	
	controlesJuego controlesJuego(rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, flagJ, flagL, posX, posY);
	
	
	


endmodule