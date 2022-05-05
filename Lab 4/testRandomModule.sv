/**
=========================Test para el modulo Memory====================
**/

module testRandomModule();

	logic clk;
	logic rst;
	logic xAux;
	logic btnSelect;
	logic [1:0]posX;
	logic [1:0]posY;
	logic flagTemp;
	logic selection;
	reg [3:0] memoryGame [0:3][0:3];
	reg [4:0]segundo;
	
	memory memoryG(rst, clk, btnSelect, posX, posY ,segundo, xAux, flagTemp,selection, memoryGame);
//input rst, clk, btnSelect,  posX, posY , segundo, x, flagTempAux, selection, memoryGameAux 
	
	initial begin
		$display("________Seleccion___________");
		clk = 1; rst = 0; btnSelect=1; posX=1; posY=1; segundo=5'b00000;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00100;  #10;
		clk = 1; rst = 0; btnSelect=0; posX=3; posY=2; segundo=5'b11000;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b01000;  #10;
		clk = 1; rst = 0; btnSelect=1; posX=0; posY=2; segundo=5'b00100;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b11000;  #10;
		
		$display("________Random___________");
		clk = 1; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b11110;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00000;  #10;
		clk = 1; rst = 0; btnSelect=0; posX=2; posY=1; segundo=5'b00000;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00000;  #10;
	
	end

endmodule