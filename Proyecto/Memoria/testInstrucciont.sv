module testInstrucciont();


    logic clk, reset, PCSrc;
    logic [31:0] dataOut, result, pc;


    InstructionMemory modInst(pc, clk, dataOut);

    initial begin 
        #1;
        reset = 0;
        #1;
        reset = 1;
        #1;
        reset = 0;
        #1;
		  pc = 32'd10;




    end
always
begin
clk <= 1; # 2; clk <= 0; # 2;
end


endmodule