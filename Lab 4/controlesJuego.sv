 module controlesJuego(input clk, btnMove, btnSelect, output[1:0] posX, posY, posXalways, posYalways);
	logic [1:0] posXactual= 2'b00;
	logic [1:0] posYactual= 2'b00;
	logic [1:0] posXsig = 2'b00;
	logic [1:0] posYsig = 2'b00;
	logic [1:0] posXaux;
	logic [1:0] posYaux;
	logic tiempo=0;
		
	
	always @( posedge btnMove)
		begin
			$display(posXactual);
			case(posXactual)
				2'b00:
					begin
						$display("x - 00");
						posXsig = 2'b01;
					end
				
				2'b01:
					begin
						$display("x - 01");
						posXsig = 2'b10;
					end
					
				2'b10:
					begin
						$display("x - 10");
						posXsig = 2'b11;
					end
					
				2'b11:
					begin
						$display("x - 11");
						posXsig = 2'b00;
						
						case(posYactual)
							2'b00:
								posYsig = 2'b01;
							2'b01:
								posYsig = 2'b10;		
							2'b10:
								posYsig = 2'b11;
							2'b11:
								posYsig = 2'b00;
							default: 
								posYsig = 2'b00;
						endcase
						posYactual = posYsig;
					end
					
				default: 
					posXsig = 2'b00;
			endcase
			posXactual = posXsig;
		end
	
	assign posXalways = posXactual;
	assign posYalways = posYactual;
	
	
	always @(posedge btnSelect) 
		begin
			$display("____Select____");
			posXaux=posXactual;
			posYaux=posYactual;
		end	
		
	assign posX = posXaux;
	assign posY = posYaux;
	

endmodule
