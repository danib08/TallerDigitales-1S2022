module TopLevel
	(
		input clk, rst, 
		output MemWrite, 
		output logic clkVGA, hsync, vsync, 
		output logic [7:0] red, green, blue,
		output logic [31:0] WriteData, DataAdr
	);

	logic [31:0] Pc, instr;
	logic [7:0] ReadData;
	
	processor processorARM(clk,rst, {24'b0,ReadData}, instr, Pc, MemWrite, DataAdr, WriteData);
	
	InstructionMemory instructionMemory(Pc, instr);
	
	DataMemory Ram(DataAdr[7:0], clk, WriteData[7:0], MemWrite, ReadData);
		
	vga_top_level VGA(clk, rst, 8'h63, clkVGA, hsync, vsync, red, green, blue);
	
endmodule