module testFSMJuegoGeneral ();

	logic clk;
	logic rst;
	logic j;
	logic m;
	logic [1:0] posX, posY;
	logic btnSelect;
	reg [3:0] memoryGame [0:3][0:3];
	reg [4:0]segundo;
	
	
	/*FSMJuegoGeneral juegoTest(rst, clk, btnSelect,posX, posY,segundo,j, m, memoryGame);
	
	initial begin
		clk = 1; rst = 0; btnSelect=1; posX=1; posY=1; segundo=5'b00000;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00100;  #10;
		clk = 1; rst = 0; btnSelect=1; posX=3; posY=2; segundo=5'b11000;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b01000;  #10;
		clk = 1; rst = 0; btnSelect=1; posX=0; posY=2; segundo=5'b00100;  #10;
		clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b11000;  #10;
		$display("____________AQUI________________");
		clk = 1; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b11110;  #10;
		//clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00000;  #10;
		//clk = 1; rst = 0; btnSelect=0; posX=2; posY=1; segundo=5'b00000;  #10;
		//clk = 0; rst = 0; btnSelect=0; posX=0; posY=0; segundo=5'b00000;  #10;
		
	
	end
	*/
	
endmodule