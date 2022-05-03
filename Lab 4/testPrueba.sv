module testPrueba();
	
	logic btnMove;
	logic btnSelect;
	logic [1:0] x;
	logic [1:0] y;
	
	controlesJuego controlesJuegoTest(btnMove, btnSelect, x, y);
	
	initial begin
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 0;  btnSelect = 1; #10;

		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 1;  btnSelect = 0; #10;
		clk = 0; btnMove= 0;  btnSelect = 0; #10;
		clk = 1; btnMove= 0;  btnSelect = 1; #10;

	end
	

endmodule