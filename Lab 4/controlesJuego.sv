module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, contadorL, output x);
	logic posXactual = 0;
	logic posYactual = 0;
	logic posXsig = 0;
	logic posYsig = 0;
	logic [3:0] xAux;
	
	reg [3:0] memoryGame [0:3][0:3];

	
	always @ (negedge rst) begin
	
		memoryGame[0][0] = 4'b0000;
		memoryGame[0][1] = 4'b0011;
		memoryGame[0][2] = 4'b0111;
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
			if(btnSelect) begin
			  xAux = memoryGame[posXactual][posYactual];
			  $display("aux %b",xAux);
			  xAux[3]=1;
			  $display("aux %b",xAux);
			  $display(" aux %b",xAux[3]);
			  $display("______________");
			  end
   end
	
	assign x = xAux;
	
endmodule
