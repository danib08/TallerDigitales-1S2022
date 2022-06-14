module decodificador(input logic [7:0] in, output logic [6:0] out);
    always_comb
    case(in)
            8'd97: 
					out = 7'b0000001;
            8'd36: 
					out = 7'b0000100;
				8'd118:
					out = 7'b1111111;
					default:
				out = 7'b1111111;

    endcase
endmodule