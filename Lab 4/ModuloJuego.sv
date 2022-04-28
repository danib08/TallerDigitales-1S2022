module ModuloJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown);

	logic contadorM;
	logic contadorJ;
	logic contadorL;
	logic [1:0] posXactual;
	logic [1:0] posYactual;
	logic [1:0] posXsig;
	logic [1:0] posYsig;
	logic ganador;
	
	logic [2:0] cartaJugador;
	FSMJuegoGeneral juegoGeneral(rst,clk, cartaJugador, contadorJ, contadorM);
	FSMParejasTotales parejasTotales(rst,clk, contadorJ, contadorM, contadorL);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//always @(negedge btnLeft, negedge btnRight, posedge contadorL)
	//begin
	//	posXactual= posXsig;
	//	if(contadorL==0) begin
	//		case(posXactual)
	//			2'b00:
	//				if(btnLeft) posXsig= 2'b00;
	//				else if (btnRight) posXsig= 2'b01;
	//			2'b01:
	//				if(btnLeft) posXsig= 2'b00;
	//				else if (btnRight) posXsig= 2'b01;
	//			
	//		endcase
	//	end
	//end

endmodule