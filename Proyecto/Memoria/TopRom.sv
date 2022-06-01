module TopRom (input clk, rst, output [7:0] q);

	logic [7:0] address;
	Counter contador(clk, rst, 1'b1, address);
	DataRom memoria (address, clk, q);

endmodule