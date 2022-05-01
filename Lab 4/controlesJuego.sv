module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, contadorL, output x);
	logic posXactual = 0;
	logic posYactual = 0;
	logic posXsig = 0;
	logic posYsig = 0;
	logic [2:0] xAux;
	reg [2:0] memoryGame [0:3][0:3];
		
	
	always @ (negedge rst) begin
		memoryGame[0][0] = 3'b000;
		memoryGame[0][1] = 3'b011;
		memoryGame[0][2] = 3'b111;
		memoryGame[0][3] = 3'b010;
		memoryGame[1][0] = 3'b110;
		memoryGame[1][1] = 3'b100;
		memoryGame[1][2] = 3'b001;
		memoryGame[1][3] = 3'b111;
		memoryGame[2][0] = 3'b001;
		memoryGame[2][1] = 3'b101;
		memoryGame[2][2] = 3'b111;
		memoryGame[2][3] = 3'b000;
		memoryGame[3][0] = 3'b100;
		memoryGame[3][1] = 3'b010;
		memoryGame[3][2] = 3'b101;
		memoryGame[3][3] = 3'b011;
	end
	
	
	always @(btnLeft, btnRight, contadorL)
	begin
		posXactual=posXsig;
			case(posXactual)
				0:
					if(btnLeft) posXsig = 0;
					else if (btnRight) posXsig = 1;
				1:
					if(btnLeft) posXsig= 0;
					else if (btnRight) posXsig= 2;
				2:
					if(btnLeft) posXsig = 1;
					else if (btnRight) posXsig = 3;
				3:
					if(btnLeft) posXsig = 2;
					else if (btnRight) posXsig = 3;
				default: posXsig = 0;
			endcase
	end
	
	always @(btnUp, btnDown, contadorL)
	begin	
		posYactual=posYsig;
			case(posYactual)
				0:
					if(btnUp) posYsig = 0;
					else if (btnDown) posYsig = 1;
				1:
					if(btnUp) posYsig = 0;
					else if (btnDown) posYsig = 2;
				2:
					if(btnUp) posYsig = 1;
					else if (btnDown) posYsig = 3;
				3:
					if(btnUp) posYsig = 2;
					else if (btnDown) posYsig = 3;
			endcase
	end
	
	always @(clk) begin
        xAux = memoryGame[posXactual][posYactual];
		  $display("%b",xAux);
   end
	
	assign x = xAux;
	
endmodule
