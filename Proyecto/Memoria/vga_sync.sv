`define GRAY 24'hC0C0C0

module vga_sync 
	( 
		input logic clk_in,  	//25MHz
		input logic reset,
		output logic video_on,
		output logic hsync,		// horizontal sync
		output logic vsync,		// vertical sync
		output logic clk_out,
		output logic [9:0] pixel_x,
		output logic [9:0] pixel_y
	); 

	//logic [7:0] red,
	//logic [7:0] green,
	//logic [7:0] blue

	//localparam h_border_left = 145;	
	//localparam h_border_right = 783;
	//localparam v_border_up = 36;
	//localparam v_border_down= 515;

	// ------- Variables internas --------
	reg [9:0] counter_x = 0;	// horizontal counter
	reg [9:0] counter_y = 0;	// vertical counter
	
	// Se manejan a R, G y B como variables internas para poder verificar que se asignan a la salidas
	reg [7:0] r_red = 0;
	reg [7:0] r_green = 0;
	reg [7:0] r_blue = 0;
	
	
	// ------- Counters --------
	always @(posedge clk_in) // horizontal counter
		if (reset)
			counter_x <= 0;
		else
			begin
			    if (counter_x < 799)
				    counter_x <= counter_x +1; // including borders
			    else
				    counter_x <= 0;
			end
		
	always @(posedge clk_in) // vertical counter
		if (reset)
			counter_x <= 0;
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
		
	// ------- Pattern -------
	//always @(posedge clk_in)
		//begin
			//{r_red, r_green, r_blue} <= `GRAY;
		//end	
					
	// Hsync and Vsync
	assign hsync = (counter_x > 0 && counter_x < 96) ? 1 : 0; // hsync for 96 counts
	assign vsync = (counter_y >= 0 && counter_y < 2) ? 1 : 0; // vsync for 2 counts

	// Video On
	assign video_on = counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down;
		
	assign clk_out = clk_in;
	assign pixel_x = counter_x;
	assign pixel_y = counter_y;
	
	// Color outputs (on/off)
	//assign red = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_red : 8'h00;
	//assign green = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_green : 8'h00;
	//assign blue = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_blue : 8'h00;

endmodule