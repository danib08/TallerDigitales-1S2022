`define WHITE 24'hFFFFFF
`define PINK 24'hFF35B8
`define BLACK 24'h000000
`define GRAY 24'hC0C0C0
`define GREEN 24'h00FF00

module font_print
   (
      input logic clk,
      input logic video_on,
      input logic [9:0] pixel_x, pixel_y,
      output logic [7:0] red,
		output logic [7:0] green,
		output logic [7:0] blue
   );

   // signal declaration
   logic [10:0] rom_addr;
   logic [6:0] char_addr;
   logic [3:0] row_addr;
   logic [2:0] bit_addr;
   logic [7:0] font_word;
   logic font_bit, text_bit_on;

   // instantiate font ROM
   font_rom rom(clk, rom_addr, font_word);

   // font ROM interface
   assign char_addr = {pixel_y[5:4], pixel_x[7:3]};
   assign row_addr = pixel_y[3:0];
   assign rom_addr = {char_addr, row_addr};
   assign bit_addr = pixel_x[2:0];
   assign font_bit = font_word[~bit_addr];

   // "on" region limited to top-left corner
   assign text_bit_on = (pixel_x[9:8] == 0 && pixel_y[9:6] == 0) ? font_bit : 1'b0;

   // rgb multiplexing circuit
   always @*
      if (~video_on)
		   {red, green, blue} <= `BLACK;	
      else
        if (text_bit_on)
            {red, green, blue} = `GREEN;  // green
        else    
            {red, green, blue} = `BLACK;  // black

endmodule
