`define GRAY 24'hC0C0C0

module vga_top_level
	(
		input logic clk50MHz,
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
 
	// Se manejan a R, G y B como variables internas para poder verificar que se asignan a la salidas
	reg [7:0] r_red = 0;
	reg [7:0] r_green = 0;
	reg [7:0] r_blue = 0;

     // generate new 25MHz clock
     clock_divider divider(clk50MHz, clk);

     // instantiate vga sync circuit
     vga_sync vsync_unit(clk, video_on, hsync, vsync, pixel_x, pixel_y, clk25MHz);

     // font generation circuit
     //font_print font_print_unit(clk, video_on, pixel_x, pixel_y, rgb_next);
   
     // rgb buffer
     //always @(posedge clk)
          //rgb_reg <= rgb_next;
        
     // output
     //assign rgb = rgb_reg;

     always @(posedge clk)
		begin
			{r_red, r_green, r_blue} <= `GRAY;	
		end

     // Color outputs (on/off)
     assign red = (video_on) ? r_red : 8'h00;
     assign green = (video_on) ? r_green : 8'h00;
     assign blue = (video_on) ? r_blue : 8'h00;


endmodule

