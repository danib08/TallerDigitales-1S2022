module contador #(parameter n = 6) (input clk, input reset, output reg [n-1:0] q);

    reg [n-1:0] counter = 0;
    always_ff @ (posedge clk, posedge reset) 
    begin
        if (reset)
            counter <= 0;
        else 
            counter <= counter + 1;
    end
    assign q = counter;
endmodule