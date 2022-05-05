module contador(input clk, rst, j, m, output reg [3:0] cj1, output reg [3:0] cj2);
	
	reg [3:0] counter1 = 0;
	reg [3:0] counter2 = 0;
		 
		 
	always_ff @(posedge clk, posedge rst) begin
		if(rst) begin 
			counter1 <= 0;
			counter2 <= 0;
		end
		else begin
			if(m == 0 &&  j == 1) 
				counter1 <= counter1 + 1;
			else if (m == 0 &&  j == 1)
				counter2 <= counter2 + 1;
		end
	end
	
	assign cj1 = counter1;
	assign cj2 = counter2;
	
endmodule