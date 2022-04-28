module testFSMJuegoGeneral ();

	logic clk;
	logic rest;
	logic [2:0] x;
	logic j;
	logic m;
	
	
	FSMJuegoGeneral juegoTest(clk, rst, x, j, m);
	
	initial begin
		clk = 1; rst = 0; x = 3'b000; #10;
		assert (j == 0 & m == 0) $display ("Exito se saco la primera carta ", j); //8
			else $error("Fallo ", j);
			
		clk = 0; rst = 0; x = 3'b000; #10;
		assert (j == 0 & m == 0) $display ("Exito se saco la primera carta ", j); //8
			else $error("Fallo ", j);
			
		clk = 1; rst = 0; x = 3'b000; #10;
		assert (j == 1 & m == 0) $display ("Exito se saco la segunda carta ", j); //8
			else $error("Fallo ", j);
	
	
	end
	
	
endmodule