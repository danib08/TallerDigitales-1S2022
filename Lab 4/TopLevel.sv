module TopLevel
	(
		input rst,
		input btnMove,
		input btnSelect,
		input logic clk50MHz,
		output logic clk25MHz, 
		output logic vga_hs,
		output logic vga_vs,
		output logic [7:0] vga_red,
		output logic [7:0] vga_green,
		output logic [7:0] vga_blue,
		output logic [6:0] outDecenas,
		output logic [6:0] outUnidades,
		output logic [6:0] outUnidades1,
		output logic [6:0] outUnidades2
	);
	
	logic m;
	logic j;
	logic [1:0] posX, posY;
	logic xAux;
	reg [3:0] memoryGameAux [0:3][0:3];
	reg [4:0] segundo;
	reg [2:0] cartasJ1;
	reg [2:0] cartasJ2;
	reg [3:0] decena;
	reg [3:0] unidad;
	reg [3:0] unidad1;
	reg [3:0] unidad2;
	logic flagTemp;
	logic selection;
	
	
	//Game
	controlesJuego controlesJuego(vga_clk, ~btnMove, ~btnSelect, posX, posY);
	Temporizador temp(clk50MHz, segundo);
	memory memoryG(rst, vga_clk, ~btnSelect, j, posX, posY ,segundo, xAux, flagTemp,selection, memoryGameAux);

	FSMJuegoGeneral juegoGeneral(rst, vga_clk, ~btnSelect, xAux, flagTemp,selection, j, m );
	

	contador contadorParejas(rst, j, m, cartasJ1, cartasJ2);
	decodificador decoDecenas(decena, outDecenas[6:0]);
	decodificador decoUnidades(unidad, outUnidades[6:0]);
	decodificador decoUnidades1(unidad1, outUnidades1[6:0]);
	decodificador decoUnidades2(unidad2, outUnidades2[6:0]);
	
	always@ (segundo) begin
        unidad = segundo % 10;
        decena = (segundo - unidad)/10;
   end
	
	always@ (cartasJ1) begin
        unidad1 = cartasJ1 % 10;
   end
	
	always@ (cartasJ2) begin
        unidad2 = cartasJ2 % 10;
   end
	

	
	//VGA Controller
	logic vga_clk;
	clockDivider clock_convertor(clk50MHz, vga_clk);
	vga_sync sync(posX, posY, memoryGameAux, vga_clk, vga_hs, vga_vs, clk25MHz, vga_red, vga_green, vga_blue);



endmodule