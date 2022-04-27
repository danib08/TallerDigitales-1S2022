module vga_toplevel
	(
		input logic clk50MHz,
		output logic clk25MHz, 
		output logic vga_hs,
		output logic vga_vs,
		output logic [7:0] vga_red,
		output logic [7:0] vga_green,
		output logic [7:0] vga_blue
	);
	
	logic vga_clk;
	
	clockDivider clock_convertor(clk50MHz, vga_clk);
	
	vga_sync sync(vga_clk, vga_hs, vga_vs, clk25MHz, vga_red, vga_green, vga_blue);
	
endmodule