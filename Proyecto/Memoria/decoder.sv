module decoder(input logic [1:0] Op,
					input logic [5:0] Funct,
					input logic [3:0] Rd,
					output logic [1:0] FlagW,
					output logic PCS, RegW, MemW,
					output logic MemtoReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc, output logic [3:0] ALUControl);

	logic [9:0] controls;
	logic Branch, ALUOp;

	// Always para Opcode
	always_comb
	casex(Op)
	
		// Instrucción tipo procesamiento de datos
		2'b00: 
			// Inmediatos
			if (Funct[5]) 
				controls = 10'b0000101001;
			
			// Registro
			else 
				controls = 10'b0000001001;
		
		//Instrucciones de almacenamiento
		2'b01: 
			// LDR
			if (Funct[0]) 
				controls = 10'b0001111000;
				
			// STR
			else 
				controls = 10'b1001110100;
				
		// Instrucciones de Branch
		2'b10: 
			controls = 10'b0110100010;
		
		// No implementadas
		default: controls = 10'bx;
	endcase
	
	//Asigna a salidas con el controls
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp} = controls;
	
	// Always para la ALU
	always_comb
		if (ALUOp) begin 
			case(Funct[4:1])
				// add
				4'b0100: 
					ALUControl = 4'b0000; 
					
				// sub
				4'b0010: 
					ALUControl = 4'b0001; 
					
				// and
				4'b0000: 
					ALUControl = 4'b0101; 
					
				//or
				4'b1100: 
					ALUControl = 4'b0110;
					
				//mov
				4'b1101:
					ALUControl = 4'b1010;
					
				//cmp
				4'b1010:
					if (Funct[0]) 
						ALUControl = 4'b0001; 
               else
						ALUControl = 4'bx;
						
				//No implementadas
				default: 
					ALUControl = 4'bx; 
			endcase

		// update flags if S bit is set (C & V only for arith)
		FlagW[1] = Funct[0]; // actualiza todas las flags NZCV, es un ADD o SUB
		
		// Setea las flags C y V, es un AND 00 o ORR 01
		FlagW[0] = Funct[0] & (ALUControl == 4'b0000 | ALUControl == 4'b0001); 
		
		end 
		else begin
		ALUControl = 4'b0000; // add for non-DP instructions
		FlagW = 2'b00; // don't update Flags
	end
	
// PC Logic, chequea si la intruccion es escribir en PC o es un ranch, RD es el registro actual
assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule