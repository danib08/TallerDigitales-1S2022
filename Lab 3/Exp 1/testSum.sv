module testSum();
	reg [3:0] a,b;
	reg [4:0] c;
	reg [3:0] flags;
	
	sumador sumTest(a, b, c, flags);
	initial begin
		a= 1111;b=0010; #10;
		assert (c == 1) $display ("Exito SUMA 1 ",c);
			else $error("Fallo SUMA 1 ",c);
	end

endmodule