module digitoAgrodef(clock,botaoAgro,estado,sinal,segmentos,pisca,agroDef);
	input clock,botaoAgro,sinal;
	input [1:0]estado;
	output [6:0]segmentos; // a = 0 g = 6
	output pisca,agroDef;
	wire [2:0]Q,ff;
	wire [6:0] segments1, segments2,aux;
	wire agroDef;
    
	and(ff[0],botaoAgro,!estado[1],estado[0]);
	and(ff[1],!sinal,estado[1],estado[0]);
	and(aux[2],estado[1],estado[0],sinal);
 	and(aux[3],ff[0],botaoAgro);
	or(guarda,aux[3],aux[2]);
    
	FlipFlopT(ff[0],ff[1],0,guarda,agroDef);
    
	and(pisca,agroDef,!botaoAgro,clock);
    
    
	contadorseis(clock,botao,Q);
    
	// A
	and(segments1[0],Q[0],!Q[1],Q[2],agroDef);
	// B
	and(segments1[1],!Q[0],!Q[1],!Q[2],agroDef);
	// C
	and(segments1[2],Q[0],!Q[1],!Q[2],agroDef);
	// D
	and(segments1[3],!Q[0],Q[1],!Q[2],agroDef);
	// E
	and(segments1[4],Q[0],Q[1],!Q[2],agroDef);
	// F
	and(segments1[5],!Q[0],!Q[1],Q[2],agroDef);
	// G
	or(aux[5],Q[1],!Q[1]);
 	and(segmentos[6],aux[5],agroDef);
    
	or(aux[4],Q[1],!Q[1]);
 	and(segments2[0],aux[4],!agroDef);
 	and(segments2[1],aux[4],!agroDef);
 	and(segments2[2],aux[4],!agroDef);
 	and(segments2[3],aux[4],!agroDef);
 	and(segments2[4],aux[4],!agroDef);
 	and(segments2[5],aux[4],!agroDef);
    
	or(segmentos[0],segments1[0],segments2[0]);
	or(segmentos[1],segments1[1],segments2[1]);
	or(segmentos[2],segments1[2],segments2[2]);
	or(segmentos[3],segments1[3],segments2[3]);
	or(segmentos[4],segments1[4],segments2[4]);
	or(segmentos[5],segments1[5],segments2[5]);
    
endmodule
