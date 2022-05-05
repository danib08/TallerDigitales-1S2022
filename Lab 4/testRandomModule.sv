/**
=========================Test para el modulo Memory====================
**/

module testRandomModule();

	logic clk;
	logic rst;
	logic [3:0]xAux;
	logic btnSelect;
	logic [1:0]posX;
	logic [1:0]posY;
	logic flagTemp;
	logic selection;
	reg [3:0] memoryGame [0:3][0:3];
	reg [4:0]segundo;
	logic j;
	
	memory memoryG(rst, clk, btnSelect, j, posX, posY ,segundo, xAux, flagTemp,selection, memoryGame);
//module memory( rst, clk, btnSelect, j,  posX, posY, segundo, output x, flagTempAux, selection, memoryGameAux );
	
	initial begin
		clk = 0; rst = 0; btnSelect=0; posX=1; posY=1; segundo=5'b00000; j=0; #10;
		clk = 1; rst = 0; btnSelect=1; posX=1; posY=2; segundo=5'b00100; j=0; #10;
		clk = 0; rst = 0; btnSelect=0; posX=3; posY=2; segundo=5'b11000; j=0; #10;
		clk = 1; rst = 0; btnSelect=1; posX=1; posY=0; segundo=5'b01000; j=1; #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=2; segundo=5'b00100; j=0; #10;
		clk = 1; rst = 0; btnSelect=1; posX=3; posY=1; segundo=5'b11000; j=0; #10;
		
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b11100; j=0; #10;
		clk = 1; rst = 0; btnSelect=1; posX=1; posY=1; segundo=5'b00000; j=0; #10;
		clk = 0; rst = 0; btnSelect=0; posX=2; posY=1; segundo=5'b00000; j=0; #10;
		clk = 1; rst = 0; btnSelect=0; posX=0; posY=1; segundo=5'b00000; j=0; #10;
	
	end

endmodule