module InstructionMemory(input [31:0] pc, output [31:0] dataOut);

	//logic [7:0] rom [528:0];
	logic [31:0] rom [528:0];
	
	initial
		$readmemh("instructions.dat",rom);
	
	//always @(posedge clk)
	//begin
	//	dataOutAux= {rom[pc], rom[pc+1], rom[pc+2], rom[pc+3]};
	//end
	
	assign dataOut = {rom[pc], rom[pc+1], rom[pc+2], rom[pc+3]}; // word aligned

endmodule 

