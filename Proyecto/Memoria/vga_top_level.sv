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
	logic clk;

	// generate new 25MHz clock
	clock_divider divider(clk50MHz, clk);

	// instantiate vga sync circuit
	vga_sync vsync_unit(clk, reset, hsync, vsync, red, green, blue, clk25MHz);

	// instantiate data memory
	//DataMemory Ram(DataAdr[7:0], clk, WriteData[7:0], MemWrite, ReadData);	
	
    // rgb buffer
    //always @(posedge clk)
	//	begin
	//		{red, green, blue} <= 24'hFFFFFF;
	//	end

endmodule