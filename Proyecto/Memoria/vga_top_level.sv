module vga_top_level
	(
		input logic clk50MHz,
          input logic reset,
		output logic clk25MHz, 
		output logic hsync, vsync,
		output logic [7:0] red,
		output logic [7:0] green,
		output logic [7:0] blue
	);

	// signal declaration
	logic [9:0] pixel_x, pixel_y;
	logic video_on;
	logic clk;
 
	reg [7:0] r_red = 0;
	reg [7:0] r_green = 0;
	reg [7:0] r_blue = 0;


     // generate new 25MHz clock
     clock_divider divider(clk50MHz, clk);

     // instantiate vga sync circuit
     vga_sync vsync_unit(clk, reset, video_on, hsync, vsync, pixel_x, pixel_y, clk25MHz);

     // font generation circuit
     font_print font_print_unit(clk, video_on, pixel_x, pixel_y, r_red, r_green, r_blue);
   
     // rgb buffer
     always @(posedge clk)
			begin
          red <= r_red;
          green <= r_green;
          blue <= r_blue;
			end

endmodule

