module randomModule(input clk, rst, input reg [3:0] memoryGame [0:3][0:3], output x);

	initial begin
      reg[15:0]a;
      reg [15:0] b;
		integer fa;
      fa=$urandom(10); 
      
      $display("A %d",fa); 
      $finish;
   end
	

endmodule