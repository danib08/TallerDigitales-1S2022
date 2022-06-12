module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlags,
						output logic [1:0] RegSrc,
						output logic RegWrite,
						output logic [1:0] ImmSrc,
						output logic ALUSrc,
						output logic [3:0] ALUControl,
						output logic MemWrite, MemtoReg,
						output logic PCSrc);
						
	logic [1:0] FlagW;
	logic pcs, RegW, MemW, NoWrite;

	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12], FlagW, pcs, RegW, MemW, MemtoReg, ALUSrc, NoWrite, ImmSrc, RegSrc, ALUControl);

	condlogic cl(clk, reset, NoWrite, Instr[31:28], ALUFlags, FlagW, pcs, RegW, MemW, PCSrc, RegWrite, MemWrite);

endmodule