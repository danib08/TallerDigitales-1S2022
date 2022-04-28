module ModuloJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown, btnSelect);

	logic contadorM;
	logic contadorJ;
	logic contadorL;
	logic ganador;
	
	logic [2:0] cartaJugador;
	FSMJuegoGeneral juegoGeneral(rst,clk, cartaJugador, contadorJ, contadorM);
	FSMParejasTotales parejasTotales(rst,clk, contadorJ, contadorM, contadorL);
	
	


endmodule