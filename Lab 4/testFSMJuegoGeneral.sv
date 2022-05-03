module testFSMJuegoGeneral ();

	logic clk;
	logic rst;
	logic j;
	logic m;
	logic [1:0] posX, posY;
	logic btnSelect;
	reg [3:0] memoryGame [0:3][0:3];
	
	
	FSMJuegoGeneral juegoTest(rst, clk, btnSelect, posX, posY,  j, m, memoryGame);
	
	initial begin
		clk = 1; rst = 0; btnSelect=0; posX=0; posY=0;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=1; posY=0;  #10;
		clk = 1; rst = 0; btnSelect=1; posX=0; posY=2;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0;  #10;
		clk = 1; rst = 0; btnSelect=1; posX=2; posY=1;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0;  #10;
		
	
	end
	
	
endmodule