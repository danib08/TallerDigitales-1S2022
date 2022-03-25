module autoChequeo();
	logic [3:0] a,b,operacion;
	logic [3:0] resultado;
	logic [3:0] flagsResult;
	
	
	calculadora #(4)calcuTest(a,b,operacion, resultado, flagsResult);
	
	initial begin
	//=======================TESTS 1=============================
	
	//----------TEST SUMA---------------
		a = 4'b1010;b = 4'b0010; operacion = 4'b0000; #10;
		assert (resultado == 4'b1100) $display ("Exito SUMA 1 ",resultado); //8
			else $error("Fallo SUMA 1 ",resultado);
			
		a= 4'b1010;b = 4'b0001; operacion = 4'b0000; #10;
		assert (resultado == 4'b1011) $display ("Exito SUMA 2 ",resultado); //9
			else $error("Fallo SUMA 2 ",resultado);
			
		a = 4'b1000;b = 4'b0011; operacion = 4'b0000; #10;
		assert (resultado == 4'b1011) $display ("Exito SUMA 3 ",resultado); //5
			else $error("Fallo SUMA 3 ",resultado);
			
		a = 4'b1110;b = 4'b0010; operacion = 4'b0000; #10;
		assert (resultado == 4'b0000) $display ("Exito SUMA 4 ",resultado); //Da cero por 16=10000
			else $error("Fallo SUMA 4 ", resultado);
			
	//----------TEST RESTA---------------
		
		a = 4'b1010;b = 4'b0001; operacion = 4'b0001; #10;
		assert (resultado == 4'b1001) $display ("Exito RESTA 1 ",resultado);
			else $error("Fallo RESTA 1 ",resultado);
			
		a = 4'b1100;b = 4'b0110; operacion = 4'b0001; #10;
		assert (resultado == 4'b0110) $display ("Exito RESTA 2 ",resultado);
			else $error("Fallo RESTA 2 ",resultado);			
			
		a = 4'b1010;b = 4'b1011; operacion = 4'b0001; #10;
		assert (resultado == 4'b1111) $display ("Exito RESTA 3 ",resultado);//res -1 con flag = 15
			else $error("Fallo RESTA 3 ",resultado);

		a = 4'b0010;b = 4'b0100; operacion = 4'b0001; #10;
		assert (resultado == 4'b1110) $display ("Exito RESTA 4 ", resultado);// res -2 con flag  result = 14
			else $error("Fallo RESTA 4 ", resultado);
			
			
	//----------TEST MULTIPLICACION---------------
		
		a = 4'b0101;b = 4'b0011; operacion = 4'b0010; #10; 
		assert (resultado == 4'b1111) $display ("Exito MULTIPLICACION 1"); //15
			else $error("Fallo MULTIPLICACION 1");
			
		a = 4'b1000;b = 4'b0010; operacion = 4'b0010; #10;
		assert (resultado == 4'b0000) $display ("Exito MULTIPLICACION 2",resultado);//res 16 con desborde  = 0
			else $error("Fallo MULTIPLICACION 2",resultado);

		a = 4'b1000;b = 4'b0011; operacion = 4'b0010; #10;
		assert (resultado == 4'b1000) $display ("Exito MULTIPLICACION 3",resultado); // res 24=11000  =  8
			else $error("Fallo MULTIPLICACION 3",resultado);

		a = 4'b0100;b = 4'b0011; operacion = 4'b0010; #10;
		assert (resultado == 4'b1100) $display ("Exito MULTIPLICACION 4",resultado);//12
			else $error("Fallo MULTIPLICACION 4",resultado);

					
			
	//----------TEST DIVISION---------------
	
		a = 4'b0101;b = 4'b0010; operacion = 4'b0011; #10;
		assert (resultado == 4'b0010) $display ("Exito DIVISION 1",resultado);  //2
			else $error("Fallo DIVISION 1",resultado);
			
		a = 4'b1010;b = 4'b0101; operacion = 4'b0011; #10;
		assert (resultado == 4'b0010) $display ("Exito DIVISION 2",resultado);  //2
			else $error("Fallo DIVISION 2",resultado);
			
		a = 4'b1010;b = 4'b0010; operacion = 4'b0011; #10;
		assert (resultado == 4'b0101) $display ("Exito DIVISION 3",resultado);  //5
			else $error("Fallo DIVISION 3",resultado);
			
		a= 4'b0011;b=4'b0100; operacion=4'b0011; #10;
		assert (resultado == 4'b0000) $display ("Exito DIVISION 4",resultado);  //0
			else $error("Fallo DIVISION 4",resultado);

			
	//----------TEST MODULO---------------
	
		a = 4'b1010;b = 4'b0101; operacion = 4'b0100; #10;
		assert (resultado == 4'b0000) $display ("Exito MODULO 1");  //0
			else $error("Fallo MODULO 1");
			
		a = 4'b1000;b = 4'b0011; operacion = 4'b0100; #10;
		assert (resultado == 4'b0010) $display ("Exito MODULO 2"); //2
			else $error("Fallo MODULO 2");	
			
		a = 4'b0111;b = 4'b0100; operacion = 4'b0100; #10;
		assert (resultado == 4'b0011) $display ("Exito MODULO 3");  //3
			else $error("Fallo MODULO 3");

		a = 4'b1011;b = 4'b1010; operacion = 4'b0100; #10;
		assert (resultado == 4'b0001) $display ("Exito MODULO 4");  //1
			else $error("Fallo MODULO 4");	
		
	

	//----------TEST AND GATE---------------
	
		a = 4'b1010;b = 4'b0001; operacion = 4'b0101; #10;
		assert (resultado == 4'b0000) $display ("Exito AND GATE 1 ",resultado); //0
			else $error("Fallo AND GATE 1 ",resultado);	
			
		a = 4'b1111;b = 4'b1111; operacion = 4'b0101; #10;
		assert (resultado == 4'b1111) $display ("Exito AND GATE 2 ",resultado); //15 F
			else $error("Fallo AND GATE 2 ",resultado);	
			
		a = 4'b1010;b = 4'b1001; operacion = 4'b0101; #10;
		assert (resultado == 4'b1000) $display ("Exito AND GATE 3 ",resultado); // 8
			else $error("Fallo AND GATE 3 ",resultado);
			
		a = 4'b1111;b = 4'b0000; operacion = 4'b0101; #10;
		assert (resultado == 4'b0000) $display ("Exito AND GATE 4 ",resultado); //0
			else $error("Fallo AND GATE 4 ",resultado);	

			
	//----------TEST OR GATE---------------
	
		a = 4'b1010;b = 4'b0001; operacion = 4'b0110; #10;
		assert (resultado == 4'b1011) $display ("Exito OR GATE 1"); //11  b
			else $error("Fallo OR GATE 1");

		a = 4'b1010;b = 4'b0000; operacion = 4'b0110; #10;
		assert (resultado == 4'b1010) $display ("Exito OR GATE 2"); //10 A
			else $error("Fallo OR GATE 2");	
			
		a = 4'b1111;b = 4'b1111; operacion = 4'b0110; #10;
		assert (resultado == 4'b1111) $display ("Exito OR GATE 3"); //15 f
			else $error("Fallo OR GATE 3");
		
		a = 4'b1001;b = 4'b0001; operacion = 4'b0110; #10;
		assert (resultado == 4'b1001) $display ("Exito OR GATE 4 ", resultado); //9
			else $error("Fallo OR GATE 4 ", resultado);	

		
	//----------TEST XOR GATE---------------
	
		a = 4'b1010;b = 4'b0001; operacion = 4'b0111; #10;
		assert (resultado == 4'b1011) $display ("Exito XOR GATE 1"); //11 b
			else $error("Fallo XOR GATE 1");
		
		a = 4'b1010;b = 4'b1010; operacion = 4'b0111; #10;
		assert (resultado == 4'b0000) $display ("Exito XOR GATE 2"); //0
			else $error("Fallo XOR GATE 2");
			
		a = 4'b1010;b = 4'b0101; operacion = 4'b0111; #10;
		assert (resultado == 4'b1111) $display ("Exito XOR GATE 3"); //15 f
			else $error("Fallo XOR GATE 3");

		a = 4'b0000;b = 4'b1001; operacion = 4'b0111; #10;
		assert (resultado == 4'b1001) $display ("Exito XOR GATE 4"); //9
			else $error("Fallo XOR GATE 4");

	//----------TEST SHIFT L---------------
	
		a = 4'b1101;b = 4'b0001; operacion = 4'b1000; #10;
		assert (resultado == 4'b1010) $display ("Exito SHIFT L 1 ",resultado); //10
			else $error("Fallo SHIFT L 1 ",resultado);
			

		a = 4'b1010;b = 4'b0001; operacion=4'b1000; #10;
		assert (resultado == 4'b0100) $display ("Exito SHIFT L 2 ",resultado); //4
			else $error("Fallo SHIFT L 2 ",resultado);	
			
		a = 4'b1010;b = 4'b0011; operacion = 4'b1000; #10;
		assert (resultado == 4'b0000) $display ("Exito SHIFT L 3 ",resultado); //0
			else $error("Fallo SHIFT L 3 ",resultado);
		
		a = 4'b0010;b = 4'b0010; operacion = 4'b1000; #10;
		assert (resultado == 4'b1000) $display ("Exito SHIFT L 4 ",resultado); //8
			else $error("Fallo SHIFT L 4 ",resultado);	
		
	//----------TEST SHIFT R---------------
	
		a = 4'b1010;b = 4'b0001; operacion = 4'b1001; #10;
		assert (resultado == 4'b0101) $display ("Exito SHIFT R 1 ",resultado); //5
			else $error("Fallo SHIFT R 1 ",resultado);
			
		a = 4'b1010;b = 4'b0010; operacion = 4'b1001; #10;
		assert (resultado == 4'b0010) $display ("Exito SHIFT R 2 ",resultado); //2
			else $error("Fallo SHIFT R 2 ",resultado);	
	
		a = 4'b1010;b = 4'b1010; operacion = 4'b1001; #10;
		assert (resultado == 4'b0000) $display ("Exito SHIFT R 3 ",resultado); //0
			else $error("Fallo SHIFT R 3 ",resultado);

		a = 4'b1111;b = 4'b0001; operacion = 4'b1001; #10;
		assert (resultado == 4'b0111) $display ("Exito SHIFT R 4 ",resultado); //7
			else $error("Fallo SHIFT R 4 " );	
			

	end
endmodule
	