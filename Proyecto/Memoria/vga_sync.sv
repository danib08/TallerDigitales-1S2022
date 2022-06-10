module vga_sync 
	( 
		input logic VGA_CLK_IN,  //25MHz
		input reset,
		output logic video_on,
		output logic hsync,    // horizontal sync
		output logic vsync,    // vertical sync
		output logic[9:0] pixel_x, pixel_y,
		output logic VGA_CLK_OUT
	); 
	
	localparam h_border_left = 145;	
	localparam h_border_right = 783;
	localparam v_border_up = 36;
	localparam v_border_down= 515;

	// ------- Variables internas --------
	reg [9:0] counter_x = 0; // horizontal counter
	reg [9:0] counter_y = 0; // vertical counter
	
	// ------- Counters --------
	always @(posedge VGA_CLK_IN) // horizontal counter
		if (reset)
			counter_x <= 0;
		else
			begin
				if (counter_x < 799)
					counter_x <= counter_x +1; // including borders
				else
					counter_x <= 0;
			end
			
	always @(posedge VGA_CLK_IN) // vertical counter
		if (reset)
			counter_y <= 0;
		else
			begin
				if (counter_x == 799) 
					begin
						if (counter_y < 525)
							counter_y <= counter_y +1;
						else 
							counter_y <= 0;
					end
			end
				
	// Hsync and Vsync
	assign hsync = (counter_x > 0 && counter_x < 96) ? 1 : 0; // hsync for 96 counts
	assign vsync = (counter_y >= 0 && counter_y < 2) ? 1 : 0; // vsync for 2 counts
		
	assign pixel_x = counter_x;
	assign pixel_y = counter_y;
	assign video_on = counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down;
	assign VGA_CLK_OUT = VGA_CLK_IN;

endmodule