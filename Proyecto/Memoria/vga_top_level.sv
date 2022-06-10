`define GRAY 24'hC0C0C0
`define WHITE 24'hFFFFFF

module vga_top_level
     (
        input logic clk50MHz,
        input logic reset,
        output logic clk25MHz, 
        output logic hsync, vsync,
        output logic [7:0] vga_red,
	   output logic [7:0] vga_green,
	   output logic [7:0] vga_blue
	);

     localparam h_border_left = 145;	
	localparam h_border_right = 783;
	localparam v_border_up = 36;
	localparam v_border_down= 515;

     // signal declaration
     logic [9:0] pixel_x, pixel_y;
     logic video_on, pixel_tick;
     logic [2:0] rgb_reg;
     logic [2:0] rgb_next;
     logic clk;
 
	// Se manejan a R, G y B como variables internas para poder verificar que se asignan a la salidas
	reg [7:0] r_red = 0;
	reg [7:0] r_green = 0;
	reg [7:0] r_blue = 0;

     // generate new 25MHz clock
     clock_divider divider(clk50MHz, clk);

     // instantiate vga sync circuit
     vga_sync vsync_unit(clk, reset, video_on, hsync, vsync, clk25MHz, pixel_x, pixel_y);

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
     assign red = (pixel_x >= h_border_left && pixel_x <= h_border_right && pixel_y >= v_border_up && pixel_y <= v_border_down) ? r_red : 8'h00;
     assign green = (pixel_x >= h_border_left && pixel_x <= h_border_right && pixel_y >= v_border_up && pixel_y <= v_border_down) ? r_green : 8'h00;
     assign blue = (pixel_x >= h_border_left && pixel_x <= h_border_right && pixel_y >= v_border_up && pixel_y <= v_border_down) ? r_blue : 8'h00;


endmodule

