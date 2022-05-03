module testModuloJuego();
	logic rst;
	logic clk;
	logic btnLeft;
	logic btnRight;
	logic btnUp;
	logic btnDown;
	logic btnSelect;
	logic l;
	logic counter1;
	logic counter2;
	
	ModuloJuego moduloJuego(rst, clk, btnLeft, btnRight, btnUp, btnDown, btnSelect, l, counter1,counter2);
	
	initial begin
	
		clk = 1; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 1; btnSelect = 0; #10;
		clk = 0; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 0; btnSelect = 0; #10;
		clk = 1; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 1; btnSelect = 0; #10;
		clk = 0; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 0; btnSelect = 0; #10;
		clk = 1; rst = 0; btnLeft = 0;  btnRight = 1;  btnUp = 0;  btnDown = 0; btnSelect = 0; #10;
		clk = 0; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 0; btnSelect = 0; #10;
		clk = 1; rst = 0; btnLeft = 0;  btnRight = 1;  btnUp = 0;  btnDown = 0; btnSelect = 0; #10;
		clk = 0; rst = 0; btnLeft = 0;  btnRight = 0;  btnUp = 0;  btnDown = 0; btnSelect = 1; #10;
	
	end


endmodule
