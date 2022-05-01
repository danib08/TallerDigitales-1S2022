module testFSMParejas();

	/**
	logic clk;
	logic rest;
	logic [2:0] x;
	logic btnLeft;
	logic btnUp;
	logic btnDown;
	logic btnRight;
	logic contadorL;	
	
	
	controlesJuego controlesJuegoTest(rst, clk, btnLeft, btnRight, btnUp, btnDown,btnSelect, contadorL, x);
	
	initial begin
		clk = 1; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 1;  contadorL = 1;#10;
	
	end
	**/
	logic a;
	logic b;
	logic y;
	testPrueba prueba(a,b,y);
	
	initial begin
		a=1; b=1; #10;
		a=0; b=1; #10;
		a=1; b=0; #10;
	end

endmodule