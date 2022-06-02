module datapath(input clk, rst,WriteEnable);

	logic [31:0] pc;
	logic [31:0] instruction;
	logic [31:0] resultALU;
	logic [31:0] PCAux;
	logic selectorMuxPC;
	logic [31:0] pcPlus4;
	logic [31:0] pcPlus8;
	logic [3:0] Ra2Aux;
	logic [3:0] Ra1Aux;
	logic [31:0] rd1,rd2;
	
	
	
	InstructionMemory instructionMemory(pc, clk, instruction);
	multiplexor #(32) muxx(pcPlus4,resultALU, selectorMuxPC,PCAux);
	pcCounter pcCount(clk, rst, PCAux, pc);
	adder adderPlus4 ( pc, 32'b100, pcPlus4);
	adder adderPlus8 ( pcPlus4, 32'b100, pcPlus8);
	RegisterFile registerFile(clk, WriteEnable,
		Ra1Aux, Ra2Aux, instruction[15:12], resultALU,  pcPlus8, rd1, rd2);
		
	multiplexor #(4) muxRa1(instruction[19:16],4'b1111, selectorRegister,Ra1Aux);
	multiplexor #(4) muxRa2(instruction[3:0],instruction[15:12], selectorRegister,Ra2Aux);

	
endmodule