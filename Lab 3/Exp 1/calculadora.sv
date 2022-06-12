module calculadora #(parameter n = 32) (input [n-1:0] a,b, input [3:0] operacion, output [n-1:0] resultado, output [3:0] flagsResult);
	
	logic [n-1:0] rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, rmov;
	logic [3:0] fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr, fmov;
	
	alu aluCalcu(a, b, rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, rmov, fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr, fmov);
	multiplexorALU muxCalcu(rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, rmov, operacion, resultado);
	multiplexorALU muxFlags(fs, fr, fm, fd, fmod, fa, fo, fx, fsl, fsr, fmov, operacion, flagsResult);
	
	

endmodule