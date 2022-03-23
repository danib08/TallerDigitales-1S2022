module testBench();
	reg [3:0] a,b,op;
	reg [4:0] result;
	
	calculadora calcuTest(a,b,op,result);
	
	initial begin
	//----------TEST SUMA---------------
		a= 1010;b=0010; op=0000; #10;
		assert (result==12) $display ("Exito SUMA 1 ",result);
			else $error("Fallo SUMA 1 ",$realtobits(result));
		
		a= 1010;b=0001; op=0000; #10;
		assert (result==01011) $display ("Exito SUMA 2");
			else $error("Fallo SUMA 2");
			
		a= 1000;b=0011; op=0000; #10;
		assert (result==01011) $display ("Exito SUMA 3");
			else $error("Fallo SUMA 3");
		
		a= 1110;b=0010; op=0000; #10;
		assert (result==10000) $display ("Exito SUMA 4");
			else $error("Fallo SUMA 4");
			
	//----------TEST RESTA---------------
		
		a= 1010;b=0001; op=0001; #10;
		assert (result==01001) $display ("Exito RESTA 1");
			else $error("Fallo RESTA 1");
		
		a= 1100;b=0110; op=0001; #10;
		assert (result==00110) $display ("Exito RESTA 2");
			else $error("Fallo RESTA 2");
		
		a= 1010;b=1011; op=0001; #10;
		assert (result==10001) $display ("Exito RESTA 3");
			else $error("Fallo RESTA 3");
		
		a= 0010;b=0100; op=0001; #10;
		assert (result==10010) $display ("Exito RESTA 4");
			else $error("Fallo RESTA 4");
			
	//----------TEST MULTIPLICACION---------------
		
		a= 0101;b=0011; op=0010; #10; 
		assert (result==00101) $display ("Exito MULTIPLICACION 1");
			else $error("Fallo MULTIPLICACION 1");
		
		a= 1000;b=0010; op=0010; #10;
		assert (result==10000) $display ("Exito MULTIPLICACION 2");
			else $error("Fallo MULTIPLICACION 2");	
		
		a= 1000;b=0011; op=0010; #10;
		assert (result==11000) $display ("Exito MULTIPLICACION 3");
			else $error("Fallo MULTIPLICACION 3");
		
		a= 0100;b=0101; op=0010; #10;
		assert (result==10100) $display ("Exito MULTIPLICACION 4");
			else $error("Fallo MULTIPLICACION 4");	
			
	//----------TEST DIVISION---------------
	
		a= 0101;b=0010; op=0011; #10;
		assert (result==00010) $display ("Exito DIVISION 1");
			else $error("Fallo DIVISION 1");
		
		a= 1010;b=0101; op=0011; #10;
		assert (result==00010) $display ("Exito DIVISION 2");
			else $error("Fallo DIVISION 2");	
		
		a= 1010;b=0010; op=0011; #10;
		assert (result==00101) $display ("Exito DIVISION 3");
			else $error("Fallo DIVISION 3");
		
		a= 0011;b=0100; op=0011; #10;
		assert (result==00000) $display ("Exito DIVISION 4");
			else $error("Fallo DIVISION 4");	
			
	//----------TEST MODULO---------------
	
		a= 1010;b=0101; op=0100; #10;
		assert (result==00000) $display ("Exito MODULO 1");
			else $error("Fallo MODULO 1");
		
		a= 1000;b=0011; op=0100; #10;
		assert (result==00010) $display ("Exito MODULO 2");
			else $error("Fallo MODULO 2");	
		
		a= 0111;b=0100; op=0100; #10;
		assert (result==00011) $display ("Exito MODULO 3");
			else $error("Fallo MODULO 3");
		
		a= 1011;b=1010; op=0100; #10;
		assert (result==00001) $display ("Exito MODULO 4");
			else $error("Fallo MODULO 4");	
			
	//----------TEST AND GATE---------------
	
		a= 1010;b=0001; op=0101; #10;
		assert (result==00000) $display ("Exito AND GATE 1");
			else $error("Fallo AND GATE 1");
		
		a= 1111;b=1111; op=0101; #10;
		assert (result==01111) $display ("Exito AND GATE 2");
			else $error("Fallo AND GATE 2");	
		
		a= 1010;b=1001; op=0101; #10;
		assert (result==01000) $display ("Exito AND GATE 3");
			else $error("Fallo AND GATE 3");
		
		a= 1111;b=0000; op=0101; #10;
		assert (result==00000) $display ("Exito AND GATE 4");
			else $error("Fallo AND GATE 4");	
			
	//----------TEST OR GATE---------------
	
		a= 1010;b=0001; op=0110; #10;
		assert (result==01011) $display ("Exito OR GATE 1");
			else $error("Fallo OR GATE 1");
		
		a= 1010;b=0000; op=0110; #10;
		assert (result==01010) $display ("Exito OR GATE 2");
			else $error("Fallo OR GATE 2");	
		
		a= 1111;b=1111; op=0110; #10;
		assert (result==01111) $display ("Exito OR GATE 3");
			else $error("Fallo OR GATE 3");
		
		a= 1001;b=0001; op=0110; #10;
		assert (result==00001) $display ("Exito OR GATE 4");
			else $error("Fallo OR GATE 4");	
			
	//----------TEST XOR GATE---------------
	
		a= 1010;b=0001; op=0111; #10;
		assert (result==01011) $display ("Exito XOR GATE 1");
			else $error("Fallo XOR GATE 1");
		
		a= 1010;b=1010; op=0111; #10;
		assert (result==00000) $display ("Exito XOR GATE 2");
			else $error("Fallo XOR GATE 2");	
		
		a= 1010;b=0101; op=0111; #10;
		assert (result==01111) $display ("Exito XOR GATE 3");
			else $error("Fallo XOR GATE 3");
		
		a= 0000;b=1001; op=0111; #10;
		assert (result==01001) $display ("Exito XOR GATE 4");
			else $error("Fallo XOR GATE 4");
			
	//----------TEST SHIFT L---------------
	
		a= 1101;b=0001; op=1000; #10;
		assert (result==11010) $display ("Exito SHIFT L 1");
			else $error("Fallo SHIFT L 1");
		
		a= 1010;b=0001; op=1000; #10;
		assert (result==10100) $display ("Exito SHIFT L 2");
			else $error("Fallo SHIFT L 2");	
		
		a= 1010;b=0011; op=1000; #10;
		assert (result==10000) $display ("Exito SHIFT L 3");
			else $error("Fallo SHIFT L 3");
		
		a= 0010;b=0010; op=1000; #10;
		assert (result==01000) $display ("Exito SHIFT L 4");
			else $error("Fallo SHIFT L 4");	
			
	//----------TEST SHIFT R---------------
	
		a= 1010;b=0001; op=1001; #10;
		assert (result==00101) $display ("Exito SHIFT R 1");
			else $error("Fallo SHIFT R 1");
		
		a= 1010;b=0010; op=1001; #10;
		assert (result==00010) $display ("Exito SHIFT R 2");
			else $error("Fallo SHIFT R 2");	
		
		a= 1010;b=1010; op=1001; #10;
		assert (result==00000) $display ("Exito SHIFT R 3");
			else $error("Fallo SHIFT R 3");
		
		a= 1111;b=0001; op=1001; #10;
		assert (result==00111) $display ("Exito SHIFT R 4");
			else $error("Fallo SHIFT R 4");	
		

	end
endmodule
	