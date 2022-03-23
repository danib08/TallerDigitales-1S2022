module autoChequeo();
	reg [3:0] a,b,op;
	reg [3:0] result;
	
	calculadora calcuTest(a,b,op,result);
	
	initial begin
	//----------TEST SUMA---------------
		a= 1010;b=0010; op=0000; #50;
		assert (result==12) $display ("Exito SUMA 1 ",result);
			else $error("Fallo SUMA 1 ",result);
			
		
		a= 1010;b=0001; op=0000; #50;
		assert (result==11) $display ("Exito SUMA 2 ",result);
			else $error("Fallo SUMA 2 ",result);
			
		a= 1000;b=0011; op=0000; #50;
		assert (result==11) $display ("Exito SUMA 3 ",result);
			else $error("Fallo SUMA 3 ",result);
		
		a= 1110;b=0010; op=0000; #50;
		assert (result==0) $display ("Exito SUMA 4",result); //Da cero por 16=10000
			else $error("Fallo SUMA 4",result);
	
		

	end
endmodule
	