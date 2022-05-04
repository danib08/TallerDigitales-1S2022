module contador(input rst, j,m, output reg [2:0] cj1, output reg [2:0] cj2);
	
	reg [2:0] counter1 = 0;
	reg [2:0] counter2 = 0;
		 
		 
	always_ff @(posedge rst, posedge j) begin
		if(rst) begin
			counter1 <= 0;
			counter2 <= 0;
			end
		else
			if(m == 0) begin
				counter1 <= counter1 + 1;
			end
			else 
				counter2 <= counter2 + 1;
			end
	
		assign cj1 = counter1;
		assign cj2 = counter2;
	
endmodule