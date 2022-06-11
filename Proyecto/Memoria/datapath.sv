module datapath(input clk, rst, RegWrite, MemtoReg, input [1:0] RegSrc, ImmSrc, ALUSrc, PCSrc,
					input logic [3:0] ALUControl,input logic [7:0] ReadData, input logic [31:0] instruction,
					output logic [31:0] ALUResult, WriteData, pc, output logic [3:0] ALUFlags);

	logic [31:0] pcPlus4, pcPlus8;
	logic [31:0] ExtImm,SrcB, SrcA, resultALU;

	logic [31:0] PCAux;
	logic selectorMuxPC;
	logic [3:0] Ra2Aux;
	logic [3:0] Ra1Aux;
	
	
	
	// ------ Next PC logic
	multiplexor #(32) muxx(pcPlus4,resultALU, PCSrc,PCAux);
	pcCounter pcCount(clk, rst, PCAux, pc);
	adder adderPlus4 ( pc, 32'b100, pcPlus4);
	adder adderPlus8 ( pcPlus4, 32'b100, pcPlus8);
	
	//------- Register File Logic
	multiplexor #(4) muxRa1(instruction[19:16], 4'b1111, RegSrc[0],Ra1Aux);
	multiplexor #(4) muxRa2(instruction[3:0],instruction[15:12], RegSrc[1],Ra2Aux);
	RegisterFile registerFile(clk, RegWrite, Ra1Aux, Ra2Aux, instruction[15:12], resultALU,  pcPlus8, SrcA, WriteData);
	multiplexor #(32) resMux(ALUResult, ReadData,  MemtoReg, resultALU);
	extend extendImm(instruction[23:0], ImmSrc, ExtImm);
	
	multiplexor #(32) muxRd2(WriteData, ExtImm, ALUSrc, SrcB);
		
	//Conexion con ALU
	calculadora #(32) ALUcalc(SrcA, SrcB, ALUControl, ALUResult, ALUFlags);
	
	

	
endmodule