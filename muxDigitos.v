module muxDigitos(seletor,unid_out,dez_out,estado_out,agroDef,segmentos);
	input [6:0] unid_out,dez_out,estado_out,agroDef;
	input [1:0]seletor;
	output [6:0]segmentos;
	wire [27:0]auxi;
	
	// Mux p baixo.
	and(auxi[0],unid_out[0],!seletor[0],!seletor[1]);
	and(auxi[1],dez_out[0],seletor[0],!seletor[1]);
	and(auxi[2],agroDef[0],!seletor[0],seletor[1]);
	and(auxi[3],estado_out[0],seletor[0],seletor[1]);
	
	and(auxi[4],unid_out[1],!seletor[0],!seletor[1]);
	and(auxi[5],dez_out[1],seletor[0],!seletor[1]);
	and(auxi[6],agroDef[1],!seletor[0],seletor[1]);
	and(auxi[7],estado_out[1],seletor[0],seletor[1]);
	
	and(auxi[8],unid_out[2],!seletor[0],!seletor[1]);
	and(auxi[9],dez_out[2],seletor[0],!seletor[1]);
	and(auxi[10],agroDef[2],!seletor[0],seletor[1]);
	and(auxi[11],estado_out[2],seletor[0],seletor[1]);
	
	and(auxi[12],unid_out[3],!seletor[0],!seletor[1]);
	and(auxi[13],dez_out[3],seletor[0],!seletor[1]);
	and(auxi[14],agroDef[3],!seletor[0],seletor[1]);
	and(auxi[15],estado_out[3],seletor[0],seletor[1]);
	
	and(auxi[16],unid_out[4],!seletor[0],!seletor[1]);
	and(auxi[17],dez_out[4],seletor[0],!seletor[1]);
	and(auxi[18],agroDef[4],!seletor[0],seletor[1]);
	and(auxi[19],estado_out[4],seletor[0],seletor[1]);
	
	and(auxi[20],unid_out[5],!seletor[0],!seletor[1]);
	and(auxi[21],dez_out[5],seletor[0],!seletor[1]);
	and(auxi[22],agroDef[5],!seletor[0],seletor[1]);
	and(auxi[23],estado_out[5],seletor[0],seletor[1]);
	
	and(auxi[24],unid_out[6],!seletor[0],!seletor[1]);
	and(auxi[25],dez_out[6],seletor[0],!seletor[1]);
	and(auxi[26],agroDef[6],!seletor[0],seletor[1]);
	and(auxi[27],estado_out[6],seletor[0],seletor[1]);
	
	
	or(segmentos[0], auxi[0], auxi[1], auxi[2], auxi[3]);
	or(segmentos[1], auxi[4], auxi[5], auxi[6], auxi[7]);
	or(segmentos[2], auxi[8], auxi[9], auxi[10], auxi[11]);
	or(segmentos[3], auxi[12], auxi[13], auxi[14], auxi[15]);
	or(segmentos[4], auxi[16], auxi[17], auxi[18], auxi[19]);
	or(segmentos[5], auxi[20], auxi[21], auxi[22], auxi[23]);
	or(segmentos[6], auxi[24], auxi[25], auxi[26], auxi[27]);

	
endmodule