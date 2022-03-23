module testSum();
	logic [3:0] a,b;
	logic [3:0] c;
	logic [3:0] flags;
	
	restador #(4) sumTest(a, b, c, flags);
	initial begin

		a= 4'b1010; b = 4'b0001; #10;
		assert (c == 9) $display ("Exito SUMA 1 ",c);
			else $error("Fallo SUMA 1 ",c);
			
		a= 4'b1010; b = 4'b0010; #10;
		assert (c == 8) $display ("Exito SUMA 1 ",c);
			else $error("Fallo SUMA 1 ",c);
			

	end

endmodule