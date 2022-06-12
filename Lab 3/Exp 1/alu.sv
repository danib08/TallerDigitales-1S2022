module alu #(parameter n = 32)(input [n-1:0] a, b, output [n-1:0] rs, rr, rm, rd, rmod, ra, ro, rx, rsl, rsr, rmov, 
										output [n-1:0] fs, fr, fd, fm, fmod, fa, fo, fx, fsl, fsr, fmov);

	logic [n-1:0] rauxs, rauxr, rauxm, rauxd, rauxmod, rauxa, rauxo, rauxx, rauxsl, rauxsr, rauxmov;
	logic [3:0] auxfs, auxfr, auxfd, auxfm, auxfmod, auxfa, auxfo, auxfx, auxfsl, auxfsr, auxfmov;
	
	sumador #(32) suma (a, b, rauxs, auxfs);
	restador #(32) rest (a, b, rauxr, auxfr);
	multiplicador #(32) multi (a, b, rauxm, auxfd);
	divisor #(32) div (a, b, rauxd, auxfm);
	modulo #(32) mod (a, b, rauxmod, auxfmod);
	andGate #(32) gateAnd (a, b, rauxa, auxfa);
	orGate #(32) gateOr (a, b, rauxo, auxfo);
	xorGate #(32) gateXor (a, b, rauxx, auxfx);
	shiftL #(32) sll (a, b, rauxsl, auxfsl);
	shiftR #(32) srl (a, b, rauxsr, auxfsr);
	mov #(32) mov1 ( b, rauxmov, auxfmov);
	
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
	assign rmov = rauxmov;
	
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
	assign fmov = auxfmov;
	
	
endmodule