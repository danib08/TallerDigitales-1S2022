module calculadora #(parameter n = 4) (input [n-1:0] a,b, input [3:0] operacion, output [n:0] resultado, output [n:0] flagsResult);
	
	logic [n:0] rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr;
	logic [n:0] fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr;
	
	alu aluCalcu(a, b, rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr);
	multiplexor muxCalcu(rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, operacion, resultado);
	multiplexor muxFlags(fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr, operacion, flagsResult);

endmodule