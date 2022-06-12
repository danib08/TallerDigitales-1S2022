module testInstrucciont();

    logic clk, reset;
    logic [31:0] PCNext, PC, dataOut;

	 
	 pcCounter pcCount(clk, reset, PCNext, PC);
	 InstructionMemory InstructionM(PC, dataOut);

    initial begin 
        #1;
        reset = 0;
        #1;
        reset = 1;
        #1;
        reset = 0;
        #1;
		  PCNext = 32'd00;

    end
	 
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end


endmodule