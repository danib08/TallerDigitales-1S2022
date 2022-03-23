module autoChequeo();
	logic [3:0] a,b,operacion;
	logic [3:0] resultado;
	logic [3:0] flagsResult;
	
	
	calculadora #(4)calcuTest(a,b,operacion, resultado, flagsResult);
	
	initial begin
	//=======================TESTS 1=============================
	
	//----------TEST SUMA---------------
		a= 4'b1010;b=4'b0010; operacion=4'b0000; #10;
		assert (resultado==12) $display ("Exito SUMA 1 ",resultado);
			else $error("Fallo SUMA 1 ",resultado);
			
	//----------TEST RESTA---------------
		
		a= 4'b1010;b=4'b0001; operacion=4'b0001; #10;
		assert (resultado==9) $display ("Exito RESTA 1 ",resultado);
			else $error("Fallo RESTA 1 ",resultado);
			
	//----------TEST MULTIPLICACION---------------
		
		a= 4'b0101;b=4'b0011; operacion=4'b0010; #10; 
		assert (resultado==15) $display ("Exito MULTIPLICACION 1");
			else $error("Fallo MULTIPLICACION 1");
			
	//----------TEST DIVISION---------------
	
		a= 4'b0101;b=4'b0010; operacion=4'b0011; #10;
		assert (resultado==2) $display ("Exito DIVISION 1",resultado);
			else $error("Fallo DIVISION 1",resultado);
			
	//----------TEST MODULO---------------
	
		a= 4'b1010;b=4'b0101; operacion=4'b0100; #10;
		assert (resultado==0) $display ("Exito MODULO 1");
			else $error("Fallo MODULO 1");

	//----------TEST AND GATE---------------
	
		a= 4'b1010;b=4'b0001; operacion=4'b0101; #10;
		assert (resultado==0) $display ("Exito AND GATE 1 ",resultado);
			else $error("Fallo AND GATE 1 ",resultado);	
			
	//----------TEST OR GATE---------------
	
		a= 4'b1010;b=4'b0001; operacion=4'b0110; #10;
		assert (resultado==11) $display ("Exito OR GATE 1");
			else $error("Fallo OR GATE 1");

	//----------TEST XOR GATE---------------
	
		a= 4'b1010;b=4'b0001; operacion=4'b0111; #10;
		assert (resultado==11) $display ("Exito XOR GATE 1");
			else $error("Fallo XOR GATE 1");

	//----------TEST SHIFT L---------------
	
		a= 4'b1101;b=4'b0001; operacion=4'b1000; #10;
		assert (resultado==10) $display ("Exito SHIFT L 1 ",resultado);
			else $error("Fallo SHIFT L 1 ",resultado);

	//----------TEST SHIFT R---------------
	
		a= 4'b1010;b=4'b0001; operacion=4'b1001; #10;
		assert (resultado==5) $display ("Exito SHIFT R 1 ",resultado);
			else $error("Fallo SHIFT R 1 ",resultado);
			
	//=======================TESTS 2=============================


	//----------TEST SUMA---------------	
		a= 4'b1010;b=4'b0001; operacion=4'b0000; #10;
		assert (resultado==11) $display ("Exito SUMA 2 ",resultado);
			else $error("Fallo SUMA 2 ",resultado);
			
	//----------TEST RESTA---------------
		a= 4'b1100;b=4'b0110; operacion=4'b0001; #10;
		assert (resultado==6) $display ("Exito RESTA 2 ",resultado);
			else $error("Fallo RESTA 2 ",resultado);
		
			
	//----------TEST MULTIPLICACION---------------
		a= 4'b1000;b=4'b0010; operacion=4'b0010; #10;
		assert (resultado==0) $display ("Exito MULTIPLICACION 2",resultado);//res 16 con desborde
			else $error("Fallo MULTIPLICACION 2",resultado);

			
	//----------TEST DIVISION---------------
	
		a= 4'b1010;b=4'b0101; operacion=4'b0011; #10;
		assert (resultado==2) $display ("Exito DIVISION 2",resultado);
			else $error("Fallo DIVISION 2",resultado);	

		
			
	//----------TEST MODULO---------------
		a= 4'b1000;b=4'b0011; operacion=4'b0100; #10;
		assert (resultado==2) $display ("Exito MODULO 2");
			else $error("Fallo MODULO 2");	
	
		

	//----------TEST AND GATE---------------
		a= 4'b1111;b=4'b1111; operacion=4'b0101; #10;
		assert (resultado==15) $display ("Exito AND GATE 2 ",resultado);
			else $error("Fallo AND GATE 2 ",resultado);	
	
			
			
	//----------TEST OR GATE---------------
		a= 4'b1010;b=4'b0000; operacion=4'b0110; #10;
		assert (resultado==10) $display ("Exito OR GATE 2");
			else $error("Fallo OR GATE 2");	
		

	//----------TEST XOR GATE---------------
	a= 4'b1010;b=4'b1010; operacion=4'b0111; #10;
		assert (resultado==0) $display ("Exito XOR GATE 2");
			else $error("Fallo XOR GATE 2");
	
		

	//----------TEST SHIFT L---------------
		a= 4'b1010;b=4'b0001; operacion=4'b1000; #10;
		assert (resultado==4) $display ("Exito SHIFT L 2 ",resultado);
			else $error("Fallo SHIFT L 2 ",resultado);	
		

	//----------TEST SHIFT R---------------
		a= 4'b1010;b=4'b0010; operacion=4'b1001; #10;
		assert (resultado==2) $display ("Exito SHIFT R 2 ",resultado);
			else $error("Fallo SHIFT R 2 ",resultado);	

		
			
	//=======================TESTS 3=============================

	//----------TEST SUMA---------------
		a= 4'b1000;b=4'b0011; operacion=4'b0000; #10;
		assert (resultado==11) $display ("Exito SUMA 3 ",resultado);
			else $error("Fallo SUMA 3 ",resultado);
			
	//----------TEST RESTA---------------
		a= 4'b1010;b=4'b1011; operacion=4'b0001; #10;
		assert (resultado==15) $display ("Exito RESTA 3 ",resultado);//res -1 con flag
			else $error("Fallo RESTA 3 ",resultado);

		
			
	//----------TEST MULTIPLICACION---------------
		a= 4'b1000;b=4'b0011; operacion=4'b0010; #10;
		assert (resultado==8) $display ("Exito MULTIPLICACION 3",resultado); // res 24=11000
			else $error("Fallo MULTIPLICACION 3",resultado);

		
			
	//----------TEST DIVISION---------------
		a= 4'b1010;b=4'b0010; operacion=4'b0011; #10;
		assert (resultado==5) $display ("Exito DIVISION 3",resultado);
			else $error("Fallo DIVISION 3",resultado);

		
			
	//----------TEST MODULO---------------
		a= 4'b0111;b=4'b0100; operacion=4'b0100; #10;
		assert (resultado==3) $display ("Exito MODULO 3");
			else $error("Fallo MODULO 3");

		

	//----------TEST AND GATE---------------
		a= 4'b1010;b=4'b1001; operacion=4'b0101; #10;
		assert (resultado==8) $display ("Exito AND GATE 3 ",resultado);
			else $error("Fallo AND GATE 3 ",resultado);

			
			
	//----------TEST OR GATE---------------
		a= 4'b1111;b=4'b1111; operacion=4'b0110; #10;
		assert (resultado==15) $display ("Exito OR GATE 3");
			else $error("Fallo OR GATE 3");

		

	//----------TEST XOR GATE---------------
		a= 4'b1010;b=4'b0101; operacion=4'b0111; #10;
		assert (resultado==15) $display ("Exito XOR GATE 3");
			else $error("Fallo XOR GATE 3");

		

	//----------TEST SHIFT L---------------
		a= 4'b1010;b=4'b0011; operacion=4'b1000; #10;
		assert (resultado==0) $display ("Exito SHIFT L 3 ",resultado);
			else $error("Fallo SHIFT L 3 ",resultado);

		

	//----------TEST SHIFT R---------------
	
		a= 4'b1010;b=4'b1010; operacion=4'b1001; #10;
		assert (resultado==0) $display ("Exito SHIFT R 3 ",resultado);
			else $error("Fallo SHIFT R 3 ",resultado);

			
			
	//=======================TESTS 4=============================
			
	//----------TEST SUMA---------------
		a= 4'b1110;b=4'b0010; operacion=4'b0000; #10;
		assert (resultado==0) $display ("Exito SUMA 4 ",resultado); //Da cero por 16=10000
			else $error("Fallo SUMA 4 ", resultado);
			
	//----------TEST RESTA---------------
		a= 4'b0010;b=4'b0100; operacion=4'b0001; #10;
		assert (resultado==14) $display ("Exito RESTA 4 ", resultado);// res -2 con flag
			else $error("Fallo RESTA 4 ", resultado);

		
			
	//----------TEST MULTIPLICACION---------------
		a= 4'b0100;b=4'b0011; operacion=4'b0010; #10;
		assert (resultado==12) $display ("Exito MULTIPLICACION 4",resultado);//12
			else $error("Fallo MULTIPLICACION 4",resultado);

		
			
	//----------TEST DIVISION---------------
		a= 4'b0011;b=4'b0100; operacion=4'b0011; #10;
		assert (resultado==0) $display ("Exito DIVISION 4",resultado);
			else $error("Fallo DIVISION 4",resultado);

		
			
	//----------TEST MODULO---------------
		a= 4'b1011;b=4'b1010; operacion=4'b0100; #10;
		assert (resultado==1) $display ("Exito MODULO 4");
			else $error("Fallo MODULO 4");	

		

	//----------TEST AND GATE---------------
		a= 4'b1111;b=4'b0000; operacion=4'b0101; #10;
		assert (resultado==0) $display ("Exito AND GATE 4 ",resultado);
			else $error("Fallo AND GATE 4 ",resultado);	

			
			
	//----------TEST OR GATE---------------
		a= 4'b1001;b=4'b0001; operacion=4'b0110; #10;
		assert (resultado==9) $display ("Exito OR GATE 4 ", resultado);
			else $error("Fallo OR GATE 4 ", resultado);	

		

	//----------TEST XOR GATE---------------
		a= 4'b0000;b=4'b1001; operacion=4'b0111; #10;
		assert (resultado==9) $display ("Exito XOR GATE 4");
			else $error("Fallo XOR GATE 4");

		

	//----------TEST SHIFT L---------------
		a= 4'b0010;b=4'b0010; operacion=4'b1000; #10;
		assert (resultado==8) $display ("Exito SHIFT L 4 ",resultado);
			else $error("Fallo SHIFT L 4 ",resultado);	
		

	//----------TEST SHIFT R---------------
		a= 4'b1111;b=4'b0001; operacion=4'b1001; #10;
		assert (resultado==7) $display ("Exito SHIFT R 4 ",resultado);
			else $error("Fallo SHIFT R 4 " );	
			

	end
endmodule
	