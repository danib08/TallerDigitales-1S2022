module testInstrucciont();

    logic clk, reset, we3;
    logic [31:0] PCNext, PC, dataOut;
	 logic [3:0]  ra2, ra3;
	 logic [31:0] wd3, r15;
	 logic [31:0] rd1, rd2;

	 
	 pcCounter pcCount(clk, reset, PCNext, PC);
	 InstructionMemory InstructionM(PC, dataOut);
	 RegisterFile registerFile(clk, we3, dataOut[19:16], dataOut[3:0], dataOut[15:12], wd3, PC+8, rd1, rd2);

    initial begin 
        #1;
        reset = 0;
        #1;
        reset = 1;
        #1;
        reset = 0;
        #1;
		  
		  PCNext = 32'd00;
		  we3=0;
		  

    end
	 
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end


endmodule