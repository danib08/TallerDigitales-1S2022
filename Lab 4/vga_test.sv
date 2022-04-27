module vga_test ();

	logic clk50MHz;
	logic clk25MHz;
	logic vga_hs;
	logic vga_vs;
	logic [7:0] vga_r;
	logic [7:0] vga_g;
	logic [7:0] vga_b;

	vga_toplevel controller(clk50MHz, clk25MHz, vga_hs, vga_vs, vga_r, vga_g, vga_b);
	
	initial begin
		clk50MHz = 0;
		clk25MHz = 0;
	end
	
	always begin
		clk50MHz = ~clk50MHz; 
		#50;	
	end
	
	always begin
		clk25MHz = ~clk25MHz; 
		#100;
	end
	
endmodule

