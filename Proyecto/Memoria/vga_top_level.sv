module vga_top_level
	(
		input logic clk50MHz,
      input logic reset,
		input reg[9:0] text,
		output logic clk25MHz, 
		output logic hsync, vsync,
		output logic [7:0] red,
		output logic [7:0] green,
		output logic [7:0] blue
	);

	// signal declaration
	logic clk;

	// generate new 25MHz clock
	clock_divider divider(clk50MHz, clk);

	// instantiate vga sync circuit
	vga_sync vsync_unit(clk, reset, text, hsync, vsync, red, green, blue, clk25MHz);

endmodule