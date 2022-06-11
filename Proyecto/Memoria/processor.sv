module processor( input logic clk, reset,
						input logic [7:0] ReadData,
						input logic [31:0] Instr,
						output logic [31:0] PC,
						output logic MemWrite,
						output logic [31:0] ALUResult, WriteData);

	logic [3:0] ALUFlags,  ALUControl;
	logic writeEnable, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] registerSelector, ImmSrc;

	controller controlUnit(clk, reset, Instr[31:12], ALUFlags, registerSelector, writeEnable, ImmSrc,
						ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc);
						
	datapath dp(clk, reset, writeEnable,MemtoReg, registerSelector, ImmSrc, ALUSrc, PCSrc, ALUControl, ReadData,
	Instr, ALUResult,WriteData, PC, ALUFlags);
	
	




endmodule