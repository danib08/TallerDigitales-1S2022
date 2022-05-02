module ModuloJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown, btnSelect, output l, counter1,counter2);

	logic m;
	logic j;
	logic ganador;

	
	logic [2:0] cartaJugador;
	FSMJuegoGeneral juegoGeneral(rst,clk, cartaJugador, j, m);
	FSMParejasTotales parejasTotales(clk,rst, j, l);
	contador contadorJ1(rst,j,m,counter1,counter2);
	
	
	
	
	


endmodule