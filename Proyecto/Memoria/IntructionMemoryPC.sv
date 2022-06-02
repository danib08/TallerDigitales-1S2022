module IntructionMemoryPC(input clk, rst, en, input[31:0] pc, output [31:0] dataOut);
	
	pcCounter pcCount(clk, rst, en, pc);
	InstructionMemory InstructionM(pc, dataOut);

endmodule