// Listing 13.2
module new_vga_toplevel
   (
    input wire clk, reset,
    input wire [2:0] sw,
    output logic clk25MHz, 
    output wire hsync, vsync,
    output wire [2:0] rgb
   );

   // signal declaration
   reg [2:0] rgb_reg;
   wire video_on;

   // generates 25MHz clock
   clock_divider clock_convertor(clk, clk25MHz);

   // instantiate vga sync circuit
   new_vga_sync vsync_unit
      (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
       .video_on(video_on), .p_tick(), .pixel_x(), .pixel_y());
		 
   // rgb buffer
   always @(posedge clk, posedge reset)
      if (reset)
         rgb_reg <= 0;
      else
         rgb_reg <= sw;
   // output
   assign rgb = (video_on) ? rgb_reg : 3'b0;

endmodule