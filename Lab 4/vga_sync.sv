`define WHITE 24'hFFFFFF
`define PINK 24'hFF35B8
`define BLACK 24'h000000
`define GRAY 24'hC0C0C0
`define CARTA1 24'hD60E10 // ROJO
`define CARTA2 24'hEE620F // NARANJA
`define CARTA3 24'hF0E511 // AMARILLO
`define CARTA4 24'h65D20D // VERDE
`define CARTA5 24'hF245C0 // ROSADO
`define CARTA6 24'h10A6ED // CELESTE
`define CARTA7 24'h0D15B7 // AZUL
`define CARTA8 24'hA83CAB // MORADO

module vga_sync 
	( 
		input logic [1:0] posX, posY,
		input reg [3:0] memoryGame [0:3][0:3],
		input logic VGA_CLK_IN,  //25MHz
		output logic hsync,    // horizontal sync
		output logic vsync,    // vertical sync
		output logic VGA_CLK_OUT,
		output logic [7:0] red,
		output logic [7:0] green,
		output logic [7:0] blue
	); 
	
	localparam h_border_left = 145;	
	localparam h_border_right = 783;
	localparam v_border_up = 36;
	localparam v_border_down= 515;
	localparam card_width = 40;
	localparam card_height = 60;

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
			// First row cards
			if ((counter_x > 350 && counter_x <= 350 + card_width) &&  (counter_y > 100 && counter_y <= 100 + card_height)) //[0,0]
				begin
					if(memoryGame[0][0][3]==1)
						{r_red, r_green, r_blue} <= `CARTA1;
					else
						{r_red, r_green, r_blue} <= `BLACK;
					
					if((posX==2'b00 && posY==2'b00) && (counter_x > 367 && counter_x <= 372 && counter_y > 100 && counter_y <= 105))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 400 && counter_x <= 400 + card_width) &&  (counter_y > 100 && counter_y <= 100 + card_height)) //[1, 0]
				begin
					if(memoryGame[0][1][3]==1)
						{r_red, r_green, r_blue} <= `CARTA4;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b01 && posY==2'b00) && (counter_x > 417 && counter_x <= 422 && counter_y > 100 && counter_y <= 105))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 450 && counter_x <= 450 + card_width) &&  (counter_y > 100 && counter_y <= 100 + card_height)) //[2,0]
				begin
					if(memoryGame[0][2][3]==1)
						{r_red, r_green, r_blue} <= `CARTA7;
					else
						{r_red, r_green, r_blue} <= `BLACK;
					
					if((posX==2'b10 && posY==2'b00) && (counter_x > 467 && counter_x <= 472 && counter_y > 100 && counter_y <= 105))
						{r_red, r_green, r_blue} <= `WHITE;
					end
				
			else if ((counter_x > 500 && counter_x <= 500 + card_width) &&  (counter_y > 100 && counter_y <= 100 + card_height)) //[3, 0]
				begin 
					if(memoryGame[0][3][3]==1)
						{r_red, r_green, r_blue} <= `CARTA3;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b11 && posY==2'b00) && (counter_x > 517 && counter_x <= 522 && counter_y > 100 && counter_y <= 105))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			// Second row cards
			else if ((counter_x > 350 && counter_x <= 350 + card_width) &&  (counter_y > 170 && counter_y <= 170 + card_height)) //[0, 1]
				begin
					if(memoryGame[1][0][3]==1)
						{r_red, r_green, r_blue} <= `CARTA7;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b00 && posY==2'b01) && (counter_x > 367 && counter_x <= 372 && counter_y > 170 && counter_y <= 175))
						{r_red, r_green, r_blue} <= `WHITE;

				end
			else if ((counter_x > 400 && counter_x <= 400 + card_width) &&  (counter_y > 170 && counter_y <= 170 + card_height)) //[1, 1]
				begin
					if(memoryGame[1][1][3]==1)
						{r_red, r_green, r_blue} <= `CARTA5;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b01 && posY==2'b01) && (counter_x > 417 && counter_x <= 422 && counter_y > 170 && counter_y <= 175))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 450 && counter_x <= 450 + card_width) &&  (counter_y > 170 && counter_y <= 170 + card_height)) //[2, 1]
				begin
					if(memoryGame[1][2][3]==1)
						{r_red, r_green, r_blue} <= `CARTA2;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b10 && posY==2'b01) && (counter_x > 467 && counter_x <= 472 && counter_y > 170 && counter_y <= 175))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 500 && counter_x <= 500 + card_width) &&  (counter_y > 170 && counter_y <= 170 + card_height)) //[3, 1]
				begin
					if(memoryGame[1][3][3]==1)
						{r_red, r_green, r_blue} <= `CARTA8;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b11 && posY==2'b01) && (counter_x > 517 && counter_x <= 522 && counter_y > 170 && counter_y <= 175 ))
						{r_red, r_green, r_blue} <= `WHITE;
				end	
				
			// Third row cards
			else if ((counter_x > 350 && counter_x <= 350 + card_width) &&  (counter_y > 240 && counter_y <= 240 + card_height)) //[0, 2]
			begin
					if(memoryGame[2][0][3]==1)
						{r_red, r_green, r_blue} <= `CARTA2; 
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b00 && posY==2'b10) && (counter_x > 367 && counter_x <= 372 && counter_y > 240 && counter_y <= 245))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 400 && counter_x <= 400 + card_width) &&  (counter_y > 240 && counter_y <= 240 + card_height)) //[1, 2]
				begin
					if(memoryGame[2][1][3]==1)
						{r_red, r_green, r_blue} <= `CARTA6;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b01 && posY==2'b10) && (counter_x > 417 && counter_x <= 422 && counter_y > 240 && counter_y <= 245))
						{r_red, r_green, r_blue} <= `WHITE;
				end	
				
			else if ((counter_x > 450 && counter_x <= 450 + card_width) &&  (counter_y > 240 && counter_y <= 240 + card_height)) //[2, 2]
				begin
					if(memoryGame[2][2][3]==1)
						{r_red, r_green, r_blue} <= `CARTA8;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b10 && posY==2'b10) && (counter_x > 467 && counter_x <= 472 && counter_y > 240 && counter_y <= 245))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 500 && counter_x <= 500 + card_width) &&  (counter_y > 240 && counter_y <= 240 + card_height)) //[3, 2]
				begin
					if(memoryGame[2][3][3]==1)
						{r_red, r_green, r_blue} <= `CARTA1;
					else
						{r_red, r_green, r_blue} <= `BLACK;

					if((posX==2'b11 && posY==2'b10) && (counter_x > 517 && counter_x <= 522 && counter_y > 240 && counter_y <= 245))
						{r_red, r_green, r_blue} <= `WHITE;	
				end	
				
			// Fourth row cards
			else if ((counter_x > 350 && counter_x <= 350 + card_width) &&  (counter_y > 310 && counter_y <= 310 + card_height)) //[0, 3]
				begin
					if(memoryGame[3][0][3]==1)
						{r_red, r_green, r_blue} <= `CARTA5;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b00 && posY==2'b11) && (counter_x > 367 && counter_x <= 372 && counter_y > 310 && counter_y <= 315))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 400 && counter_x <= 400 + card_width) &&  (counter_y > 310 && counter_y <= 310 + card_height)) //[1, 3]
				begin
					if(memoryGame[3][1][3]==1)
						{r_red, r_green, r_blue} <= `CARTA3;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b01 && posY==2'b11) && (counter_x > 417 && counter_x <= 422 && counter_y > 310 && counter_y <= 315))
						{r_red, r_green, r_blue} <= `WHITE;
				end	
			
			else if ((counter_x > 450 && counter_x <= 450 + card_width) &&  (counter_y > 310 && counter_y <= 310 + card_height)) //[2, 3]
				begin
					if(memoryGame[3][2][3]==1)
						{r_red, r_green, r_blue} <= `CARTA6;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b10 && posY==2'b11) && (counter_x > 467 && counter_x <= 472 && counter_y > 310 && counter_y <= 315))
						{r_red, r_green, r_blue} <= `WHITE;
				end
				
			else if ((counter_x > 500 && counter_x <= 500 + card_width) &&  (counter_y > 310 && counter_y <= 310 + card_height)) //[3, 3]
				begin
					if(memoryGame[3][3][3]==1)
						{r_red, r_green, r_blue} <= `CARTA4;
					else
						{r_red, r_green, r_blue} <= `BLACK;
						
					if((posX==2'b11 && posY==2'b11) && (counter_x > 517 && counter_x <= 522 && counter_y > 310 && counter_y <= 315))
						{r_red, r_green, r_blue} <= `WHITE;
				end			
				
			else 
				begin
					{r_red, r_green, r_blue} <= `GRAY;
				end	
			
			end
					
		
	// Hsync and Vsync
	assign hsync = (counter_x > 0 && counter_x < 96) ? 1 : 0; // hsync for 96 counts
	assign vsync = (counter_y >= 0 && counter_y < 2) ? 1 : 0; // vsync for 2 counts
		
	assign VGA_CLK_OUT = VGA_CLK_IN;
	
	// Color outputs (on/off)
	assign red = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_red : 8'h00;
	assign green = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_green : 8'h00;
	assign blue = (counter_x >= h_border_left && counter_x <= h_border_right && counter_y >= v_border_up && counter_y <= v_border_down) ? r_blue : 8'h00;

endmodule