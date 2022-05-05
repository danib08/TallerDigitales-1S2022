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
		output logic [6:0] outUnidades2,
		output logic e0,
		output logic e1,
		output logic e2,
		output logic e3,
		output logic l
	);
	
	logic m;
	logic j;
	logic [1:0] posX, posY;
	logic [1:0] posXalways, posYalways;
	logic [3:0] xAux;
	reg [3:0] memoryGameAux [0:3][0:3];
	reg [4:0] segundo;
	reg [3:0] cartasJ1;
	reg [3:0] cartasJ2;
	reg [3:0] decena;
	reg [3:0] unidad;
	reg [3:0] unidad1;
	reg [3:0] unidad2;
	logic flagTemp;
	logic selection;
	logic btnSelectAux;
	logic btnMoveAux;
	logic PB_downAux1;
	logic PB_downAux2;
	logic PB_upAux1;
	logic PB_upAux2;
	
	
	//Game
	
	PushButton_Debouncer selectBtn(vga_clk, btnSelect, btnSelectAux, PB_downAux1, PB_upAux1);
	
	PushButton_Debouncer moveBtn(vga_clk, btnMove, btnMoveAux, PB_downAux2, PB_upAux2);
	
	controlesJuego controlesJuego(vga_clk, btnMoveAux, btnSelectAux, posX, posY, posXalways, posYalways);
	
	Temporizador temp(clk50MHz, btnSelectAux, segundo);
	
	memory memoryG(rst, vga_clk, btnSelectAux, j, posX, posY ,segundo, xAux, flagTemp, selection, memoryGameAux);

	FSMJuegoGeneral juegoGeneral(rst, vga_clk, btnSelectAux, xAux, selection, j, m);
	
	FSMParejasTotales parejas(vga_clk, rst, j, l);
	
	

	contador contadorParejas(vga_clk, rst, j, m, cartasJ1, cartasJ2);
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
	vga_sync sync(posXalways, posYalways, memoryGameAux, vga_clk, vga_hs, vga_vs, clk25MHz, vga_red, vga_green, vga_blue);



endmodule