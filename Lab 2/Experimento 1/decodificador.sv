module decodificador(input A, B, C, D, E,output a, b, c, d, e, f, g);
	
	assign a = (~A&B&~C)|(~B&C&D&E)|(A&~B&D&E)|(A&~B&C&~D&~E)|(A&B&C&~D&E)|(A&B&C&D&~E);
	
	assign b = (~A&C&~D)|(~A&~B&D&~E)|(~A&B&~D&~E)|(A&~B&~C&D)|(A&B&~C&~D)|(~A&B&~C&D&E);
	
	assign c = (~A&C&~D)|(~B&C&~D&E)|(~A&B&~D&~E)|(~A&B&D&E)|(B&C&D&E)|(~A&~B&~C&D&~E)|(A&~B&~C&D&E);
	
	assign d = (~A&~C&~D&~E)|(~A&~B&C&E)|(~A&C&D&E)|(~B&C&D&E)|(~A&B&~C&~E)|(A&~B&~D&~E)|(A&~B&~C&E)|(A&B&D&~E);
	
	assign e = (A&~C&~E)|(A&~D&~E)|(A&~B&C&D)|(~A&B&~C&~D&E);
	
	assign f = (A&~B&C&~D)|(A&~B&C&~E)|(~A&B&~C&~D&E)|(A&B&~C&D&~E)|(A&B&C&D&E);
	
	assign g = (~A&~B&~C&D)|(~A&~C&D&E)|(~A&B&~C&~D)|(~A&B&C&D&~E)|(A&~B&C&~D&~E)|(A&B&~C&D&~E)|(A&B&C&~D&E);

endmodule