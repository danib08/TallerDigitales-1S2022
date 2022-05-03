module randomModule(input clk, rst, input reg [3:0] memoryGame [0:3][0:3], output x);

	initial begin
		integer fa;
		logic posX;
		logic posY;
      fa=$urandom(10); 
      
      $display("A %d",fa); 
      $finish;
		
		//for(int i=0; i<6; i++)begin
			
		//end
		
		
   end
	

endmodule