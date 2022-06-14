module TopLevel
	(
		input clk, rst,
		output MemWrite, 
		output logic [31:0] WriteData, DataAdr
	);

	logic [31:0] Pc, instr;
	logic [7:0] ReadData;
	
	processor processorARM(clk, rst, {24'b0, ReadData}, instr, Pc, MemWrite, DataAdr, WriteData);
	
	InstructionMemory instructionMemory(Pc, instr);
	
	DataMemory Ram(DataAdr[7:0], clk, WriteData[7:0], MemWrite, ReadData);
				
	
endmodule