module testFSMJuegoGeneral ();

	logic clk;
	logic rst;
	logic j;
	logic m;
	logic [1:0] posX, posY;
	logic btnSelect;
	logic [3:0]x;
	logic flagTemp;
	logic selection;
	
	 FSMJuegoGeneral juegoGeneral(rst, clk, btnSelect, x, flagTemp, selection, j, m );

	
	
	
	initial begin
		clk = 0; rst = 0; btnSelect=0; x=4'b0000;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=1; x=4'b0000;selection=1;flagTemp=0;  #10;
		clk = 0; rst = 0; btnSelect=0; x=4'b0000;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=1; x=4'b0100;selection=1;flagTemp=0;  #10;
		clk = 0; rst = 0; btnSelect=0; x=4'b0011;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=1; x=4'b0100;selection=1;flagTemp=0;  #10;
		clk = 0; rst = 0; btnSelect=0; x=4'b0000;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=0; x=4'b0011;selection=1;flagTemp=0;  #10;
		
		
		clk = 0; rst = 0; btnSelect=0; x=4'b0000;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=1; x=4'b0100;selection=1;flagTemp=0;  #10;
		clk = 0; rst = 0; btnSelect=0; x=4'b0011;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=1; x=4'b0100;selection=1;flagTemp=0;  #10;
		clk = 0; rst = 0; btnSelect=0; x=4'b0000;selection=0;flagTemp=0;  #10;
		clk = 1; rst = 0; btnSelect=0; x=4'b0011;selection=1;flagTemp=0;  #10;
		
	
	end
	
	
endmodule