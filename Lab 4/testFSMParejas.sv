module testFSMParejas();

	logic clk;
	logic rst;
	logic j;
	logic m;
	

	FSMParejasTotales paresjasTest (clk, rst, j, m, l);
	
		
	initial begin
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
		clk = 1; rst = 0; j = 1; m = 0; #10;
		clk = 0; rst = 0; j = 1; m = 0; #10;
	end
	
endmodule