module calculadora #(parameter n = 4) (input [n-1:0] a,b, input [3:0] operacion, output [6:0] resultado, output [3:0] flagsResult);
	
	logic [n-1:0] rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr;
	logic [n-1:0] fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr;
	logic [n-1:0] auxResult;

	
	alu #(4) aluCalcu(a, b, rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr);
	multiplexor #(4) muxCalcu(rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, operacion, auxResult);
	multiplexor #(4) muxFlags(fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr, operacion, flagsResult);
	
	decodificador decoCalcu(auxResult, resultado);
	
	

endmodule