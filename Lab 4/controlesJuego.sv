 module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, output posX, posY);
	logic [1:0] posXactual= 2'b00;
	logic [1:0] posYactual= 2'b00;
	logic [1:0] posXsig = 2'b00;
	logic [1:0] posYsig = 2'b00;
	logic [3:0] xAux;
	logic contadorSeleccion=0;
	logic [1:0] posXaux;
	logic [1:0] posYaux;
	
	
	always @(clk, btnLeft, btnRight)
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
	
	always @(clk,btnUp, btnDown)
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
			  
				posXaux=posXactual;
				posYaux=posYactual;
				
			  end	  
   end
	assign posX=posXaux;
	assign posY=posYaux;
	
	
endmodule
