module controlesJuego(input rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, contadorL, output x);
	logic [1:0] posXactual;
	logic [1:0] posYactual;
	logic [1:0] posXsig;
	logic [1:0] posYsig;
	
	
	always @(negedge btnLeft, negedge btnRight, posedge contadorL)
	begin
		posXactual= posXsig;
		if(contadorL==0) begin
			case(posXactual)
				2'b00:
					if(btnLeft) posXsig= 2'b00;
					else if (btnRight) posXsig= 2'b01;
				2'b01:
					if(btnLeft) posXsig= 2'b00;
					else if (btnRight) posXsig= 2'b01;
				
			endcase
		end
	end
	

endmodule
