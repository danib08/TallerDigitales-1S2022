module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, contadorL, input reg [2:0] memoryGame [0:3][0:3], output x);
	logic posXactual;
	logic posYactual;
	logic posXsig=0;
	logic posYsig=0;
	logic [2:0] xAux;
	
	
	// memoryGame [0:3][0:3]
	
	
	always @(negedge btnLeft, negedge btnRight, posedge contadorL)
	begin
	
		posXactual= posXsig;
		
		if(contadorL==0) begin
			case(posXactual)
				0:
					if(btnLeft) posXsig= 0;
					else if (btnRight) posXsig= 1;
				1:
					if(btnLeft) posXsig= 0;
					else if (btnRight) posXsig= 2;
				2:
					if(btnLeft) posXsig= 1;
					else if (btnRight) posXsig= 3;
				3:
					if(btnLeft) posXsig= 2;
					else if (btnRight) posXsig= 3;
				default: posXsig=0;
			endcase
			
		end
	end
	
	
	always @(negedge btnUp, negedge btnDown, posedge contadorL)
	begin
	
		posYactual= posYsig;
		
		if(contadorL==0) begin
			case(posYactual)
				0:
					if(btnUp) posYsig= 0;
					else if (btnDown) posYsig= 1;
				1:
					if(btnUp) posXsig= 0;
					else if (btnDown) posYsig= 2;
				2:
					if(btnUp) posXsig= 1;
					else if (btnDown) posYsig= 3;
				3:
					if(btnUp) posXsig= 2;
					else if (btnDown) posYsig= 3;
			endcase
			
		end
	end
	
	always @(negedge btnSelect) begin
		xAux= memoryGame[posXactual][posYactual];
	end
	
	assign x=xAux;
	

endmodule
