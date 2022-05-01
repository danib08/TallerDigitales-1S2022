module testFSMJuegoGeneral ();

	logic clk;
	logic rst;
	logic [2:0] x;
	logic j;
	logic m;
	
	
	FSMJuegoGeneral juegoTest(clk, rst, x, j, m);
	
	initial begin
		clk = 1; rst = 0; x = 3'b000; #10;
		clk = 0; rst = 0; x = 3'b000; #10;
		clk = 1; rst = 0; x = 3'b000; #10;
		clk = 0; rst = 0; x = 3'b011; #10;
		clk = 1; rst = 0; x = 3'b100; #10;
		clk = 0; rst = 0; x = 3'b101; #10;
		clk = 1; rst = 0; x = 3'b110; #10;
	
	end
	
	
endmodule