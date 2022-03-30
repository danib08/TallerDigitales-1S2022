module testContador();
    logic clk;
    logic reset;
    logic [1:0] q;
    parameter n = 2;
    logic [n:0] i;

    contador cont1(clk, reset, q);

    initial begin
        clk = 0; reset = 1; #10
        for(i = 0; i < 2**n; i = i + 1) begin
            clk = 1; reset = 0; #10;
            clk = 0; reset = 0; #10;
        end
    end
endmodule