 module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, flagL, output x);
	logic posXactual;
	logic posYactual;
	logic [1:0] posXsig = 2'b00;
	logic [1:0] posYsig = 2'b00;
	logic [3:0] xAux;
	
	reg [3:0] memoryGame [0:3][0:3];

	
	always @ (flagL) begin
	
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
	
	
	always @(clk, btnLeft, btnRight, flagL)
	begin
		posXactual = posXsig;
			case(posXactual)
				2'b00:
					if(btnLeft) posXsig = 2'b00;
					else if (btnRight) posXsig = 2'b01;
				2'b01:
					if(btnLeft) posXsig= 2'b10;
					else if (btnRight) posXsig= 2'b00;
				2'b10:
					if(btnLeft) posXsig = 2'b01;
					else if (btnRight) posXsig = 2'b11;
				2'b11:
					if(btnLeft) posXsig = 2'b10;
					else if (btnRight) posXsig = 2'b11;
				default: posXsig = 2'b00;
			endcase
	end
	
	always @(btnUp, btnDown, flagL)
	begin	
		posYactual=posYsig;
			case(posYactual)
				2'b00:
					if(btnUp) posYsig = 2'b01;
					else if (btnDown) posYsig = 2'b00;
				2'b01:
					if(btnUp) posYsig = 2'b10;
					else if (btnDown) posYsig = 2'b00;
				2'b10:
					if(btnUp) posYsig = 2'b11;
					else if (btnDown) posYsig = 2'b01;
				2'b11:
					if(btnUp) posYsig = 2'b11;
					else if (btnDown) posYsig = 2'b10;
			endcase
	end
	
	always @(clk) begin
			if(btnSelect) begin
			  xAux = memoryGame[posXactual][posYactual];
			  xAux[3]=1;
			  $display("aux %b",xAux);
			  $display("______________");
			  end
   end

	
	
endmodule
