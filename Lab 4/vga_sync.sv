`define WHITE 24'hFFFFFF;

module vga_sync 
	( 
		input logic VGA_CLK_IN,  //25MHz
		output logic hsync,    // horizontal sync
		output logic vsync,    // vertical sync
		output logic VGA_CLK_OUT,
		output logic [7:0] red,
		output logic [7:0] green,
		output logic [7:0] blue
	); 

	// ------- Variables internas --------
	reg [9:0] counter_x = 0; // horizontal counter
	reg [9:0] counter_y = 0; // vertical counter
	
	// Se manejan a R, G y B como variables internas para poder verificar que se asignan a la salidas
	reg [7:0] r_red = 0;
	reg [7:0] r_green = 0;
	reg [7:0] r_blue = 0;
	
	
	// ------- Counters --------
	always @(posedge VGA_CLK_IN) // horizontal counter
		begin
			if (counter_x < 799)
				counter_x <= counter_x +1; // including borders
			else
				counter_x <= 0;
		end
		
	always @(posedge VGA_CLK_IN) // vertical counter
		begin
			if (counter_x == 799) 
				begin
					if (counter_y < 525)
						counter_y <= counter_y +1;
					else 
						counter_y <= 0;
				end
		end
		
		
	// ------- Pattern -------
	always @(posedge VGA_CLK_IN) 
		begin	
			if ((counter_x <= 315 || counter_x >= 620) || (counter_y < 125 || counter_y > 430))
				begin
					{r_red, r_green, r_blue} <= `WHITE;
				end
		end
	
	// Hsync and Vsync
	assign hsync = (counter_x > 0 && counter_x < 96) ? 1 : 0; // hsync for 96 counts
	assign vsync = (counter_y >= 0 && counter_y < 2) ? 1 : 0; // vsync for 2 counts
		
	assign VGA_CLK_OUT = VGA_CLK_IN;
	
	// Color outputs
	assign red = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 515) ? r_red : 8'h00;
	assign green = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 515) ? r_green : 8'h00;
	assign blue = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 515) ? r_blue : 8'h00;

endmodule