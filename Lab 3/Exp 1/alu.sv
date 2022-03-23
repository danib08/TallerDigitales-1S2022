module alu #(parameter n = 4)(input [n-1:0] a,b, output [n:0] rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, 
										output [n:0] fs, fr, fd, fm, fmod, fa, fo, fx, fsl, fsr);

	logic [n:0] rauxs, rauxr, rauxm, rauxd, rauxmod, rauxa, rauxo, rauxx, rauxsl, rauxsr;
	logic [n:0] auxfs, auxfr, auxfd, auxfm, auxfmod, auxfa, auxfo, auxfx, auxfsl, auxfsr;
	
	sumador suma (a, b, rauxs, auxfs);
	restador rest (a, b, rauxr, auxfr);
	multiplicador multi (a, b, rauxm, auxfd);
	divisor div (a, b, rauxd, auxfm);
	modulo mod (a, b, rauxmod, auxfmod);
	andGate gateAnd (a, b, rauxa, auxfa);
	orGate gateOr (a, b, rauxo, auxfo);
	xorGate gateXor (a, b, rauxx, auxfx);
	shiftL sll (a, b, rauxsl, auxfsl);
	shiftR srl (a, b, rauxsr, auxfsr);
	
	assign rs = rauxs; 
	assign rr = rauxr;
	assign rm = rauxm;
	assign rd = rauxd;
	assign rmod = rauxmod;
	assign ra = rauxa;
	assign ro = rauxo;
	assign rx = rauxx;
	assign rsl = rauxsl;
	assign rsr = rauxsr;
	
	assign fs = auxfs;
	assign fr = auxfr;
	assign fd = auxfd;
	assign fm = auxfm;
	assign fmod = auxfmod;
	assign fa = auxfa;
	assign fo = auxfo;
	assign fx = auxfx;
	assign fsl = auxfsl;
	assign fsr = auxfsr;
	
	
endmodule