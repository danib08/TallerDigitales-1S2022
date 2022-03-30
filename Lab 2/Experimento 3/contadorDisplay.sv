module contadorDisplay(input clk, input reset, output logic [6:0] outDecenas, output logic [6:0] outUnidades);

	reg [5:0] counter;
	reg [3:0] decena;
	reg [3:0] unidad;
	
	contador #(6) contador6bits(clk, reset, counter);
	
	decoDecenas decoDecenas(decena, outDecenas[6:0]);
	decoDecenas decoUnidades(unidad, outUnidades[6:0]);
	
	always@ (counter) begin
		unidad = counter % 10;
		decena = (counter - unidad)/10;
	end
endmodule