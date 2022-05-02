module randomModule(input clk, rst, input reg [3:0] memoryGame [0:3][0:3], output x);

	initial begin
			logic posX;
			logic posY;
			logic flag=1;
			//rand integer;

			while (flag)  
			  begin
			   posX=$urandom%10;
				posY=$urandom(10); 
				$display("Random X %d",posX);
				$display("Random Y %d",posY);
				if(memoryGame[posX][posY] < 4'b1000)
					flag=0;
				 
			  end
			
		end
	

endmodule