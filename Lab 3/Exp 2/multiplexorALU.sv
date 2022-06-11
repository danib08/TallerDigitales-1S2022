module multiplexorALU #(parameter n = 4) (input [n-1:0] a, b, c, d, e, f, g, h, i, j, input [3:0] ss, output [n-1:0] salida);
	logic [n-1:0] aux;
	
	always_comb begin
		case (ss)
			0:
				aux = a;
			1:
				aux = b;
			2:
				aux = c;
			3:
				aux = d;
			4:
				aux = e;
			5:
				aux = f;
			6:
				aux = g;
			7:
				aux = h;
			8:
				aux = i;
			9:
				aux = j;
			default:
				aux = 0;
		endcase
	end
	assign salida = aux;
endmodule