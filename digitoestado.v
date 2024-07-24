module digitoestado(estado,clock,segmentos); // IGNORAR ESTE MODULO!!!!!!!!!!!
	input clock;
	input [1:0]estado;
	output [6:0]segmentos; // a = 0 g = 6
	wire [2:0]Q,aux;
	wire [6:0]segments;
	// A
	and(segmentos[0],Q[1],Q[0]);
	// B
	xnor(aux[0],Q[1],Q[0]);
	and(aux[1],!Q[0],Q[1]);
	or(segmentos[1],aux[0],aux[1]);
	// C
	xnor(segmentos[2],Q[0],Q[1]);
	// D
	and(segmentos[3],Q[0],!Q[1]);
	// E
	and(segmentos[4],Q[0],!Q[0]);
	// F
	and(segmentos[5],Q[0],!Q[0]);
	// G
	and(segmentos[6],Q[1],Q[1]);
	
endmodule