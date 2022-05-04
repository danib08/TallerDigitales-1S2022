module Temporizador (input clk, output reg [4:0] segundo);
    reg [4:0] counter = 0;
    reg [25:0] accum = 0;
    wire pps = (accum == 0);

    always @(posedge clk) begin
        accum <= (pps ? 50_000_000 : accum) - 1;

        if (pps) begin
            counter <= counter + 1;
        end 
    end

    assign segundo = counter;

endmodule