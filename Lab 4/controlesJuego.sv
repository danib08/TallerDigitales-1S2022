 module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, flagJ, flagL, output x);
	logic [1:0] posXactual= 2'b00;
	logic [1:0] posYactual= 2'b00;
	logic [1:0] posXsig = 2'b00;
	logic [1:0] posYsig = 2'b00;
	logic [3:0] xAux;
	logic contadorSeleccion=0;
	logic posXC1;
	logic posXC2;
	logic posYC1;
	logic posYC2;
	
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
		$display("posXActual ", posXactual);
			case(posXactual)
				2'b00:
					if (btnLeft) begin
					posXsig = 2'b00;
					$display("caso X 1 IF");
					end
					else if (btnRight) begin
					posXsig = 2'b01;
					$display("caso X 1 ELSE IF");
					end
				2'b01:
					if (btnLeft) begin
					posXsig = 2'b00;
					$display("caso X 2 IF");
					end
					else if (btnRight) begin
					posXsig = 2'b10;
					$display("caso X 2 ELSE IF");
					end
				2'b10:
					if (btnLeft) begin
					posXsig = 2'b01;
					$display("caso X 3 if");
					end
					else if (btnRight) begin
					posXsig = 2'b11;
					$display("caso X 3 else if");
					end
				2'b11:
					if (btnLeft) begin
					posXsig = 2'b10;
					$display("caso X 4 if");
					end
					else if (btnRight) begin
					posXsig = 2'b11;
					$display("caso X 4 else if");
					end
				default: posXsig = 2'b00;
			endcase
			posXactual = posXsig;
	end
	
	always @(clk,btnUp, btnDown, flagL)
	begin	
	$display("posYActual ", posYactual);
			case(posYactual)
				2'b00:
					if (btnUp) begin
					posYsig = 2'b00;
					$display("caso Y 1 if");
					end
					else if (btnDown) begin
					posYsig = 2'b01;
					$display("caso Y 1 else if");
					end
				2'b01:
					if (btnUp) begin
					posYsig = 2'b00;
					$display("caso Y 2 if");
					end
					else if (btnDown) begin
					posYsig = 2'b10;
					$display("caso Y 2 else if");
					end
				2'b10:
					if (btnUp) begin
					posYsig = 2'b01;
					$display("caso Y 3 if");
					end
					else if (btnDown) begin
					posYsig = 2'b11;
					$display("caso Y 3 else if");
					end
				2'b11:
					if (btnUp) begin
					posYsig = 2'b10;
					$display("caso Y 4 if");
					end
					else if (btnDown) begin
					posYsig = 2'b11;
					$display("caso Y 4 else if");
					end
			endcase
			posYactual = posYsig;
	end
	
	always @(clk) begin
			if (btnSelect) begin
				memoryGame[posYactual][posXactual] [3] = 1;
				xAux = memoryGame[posYactual][posXactual];
			  
				$display("_________________");
				$display("Pos x: ",posXactual);
				$display("Pos y: ",posYactual);
			  
				$display("aux %b",xAux);
				$display("_________________");
			  
			  
				if(contadorSeleccion == 0) begin
					posXC1 = posXactual;
					posYC1 = posYactual;
					contadorSeleccion = 1;
					$display("Carta 1");
			  end
			  else if(contadorSeleccion == 1) begin
					posXC2 = posXactual; 
					posYC2 = posYactual;
					contadorSeleccion = 0;
					$display("Carta 2");
				end
				if (~flagJ) begin
					memoryGame[posYC1][posXC1][3] = 0;
					memoryGame[posYC2][posXC2][3] = 0;
				end
			  end	  
   end
	assign x = xAux;	
endmodule
