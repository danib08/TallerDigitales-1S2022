module testRandomModule();
	logic clk;
	logic rst;
	logic x;
	reg [3:0] memoryGame [0:3][0:3];
	
	randomModule randM(clk, rst, memoryGame,x);
	
	always @ (negedge rst) begin
	
		memoryGame[0][0] = 4'b0000;
		memoryGame[0][1] = 4'b0011;
		memoryGame[0][2] = 4'b0111;
		memoryGame[0][3] = 4'b0010;
		memoryGame[1][0] = 4'b0110;
		memoryGame[1][1] = 4'b0100;
		memoryGame[1][2] = 4'b0001;
		memoryGame[1][3] = 4'b0111;
		memoryGame[2][0] = 4'b0001;
		memoryGame[2][1] = 4'b0101;
		memoryGame[2][2] = 4'b0111;
		memoryGame[2][3] = 4'b0000;
		memoryGame[3][0] = 4'b0100;
		memoryGame[3][1] = 4'b0010;
		memoryGame[3][2] = 4'b0101;
		memoryGame[3][3] = 4'b0011;
	
	end
	
	initial begin
		clk = 1; rst = 0;  #10;
		clk = 0; rst = 0;  #10;
		clk = 1; rst = 0;  #10;
		clk = 0; rst = 0;  #10;
		clk = 1; rst = 0;  #10;
		clk = 0; rst = 0;  #10;
		clk = 1; rst = 0;  #10;
	
	end

endmodule