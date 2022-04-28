module memory(input logic clk, reset,up, down left, rigth, output x);
	
	reg [2:0] memoryGame [0:3][0:3]
	logic yActual = 0;
	logic xActual = 0;
	
	always @ (negedge reset) begin
	memoryGame[0][0] = 3'b000;
	memoryGame[0][1] = 3'b011;
	memoryGame[0][2] = 3'b111;
	memoryGame[0][3] = 3'b010;
	memoryGame[1][0] = 3'b110;
	memoryGame[1][1] = 3'b100;
	memoryGame[1][2] = 3'b001;
	memoryGame[1][3] = 3'b111;
	memoryGame[2][0] = 3'b001;
	memoryGame[2][1] = 3'b101;
	memoryGame[2][2] = 3'b111;
	memoryGame[2][3] = 3'b000;
	memoryGame[3][0] = 3'b100;
	memoryGame[3][1] = 3'b010;
	memoryGame[3][2] = 3'b101;
	memoryGame[3][3] = 3'b011;
	end
	
	always @ (negedge reset) begin
		if (up == 0) begin
			
		end
	
	end
	
	
endmodule