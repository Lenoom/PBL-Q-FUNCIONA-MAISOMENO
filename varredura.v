module varredura(clock,unid_out,dez_out,estado_out,digito,segmentos,botao,agroDef);
	input clock,botao;
	output [3:0]digito;
	output [6:0]segmentos;
	wire [1:0]preset,Q;
	input [6:0]unid_out,dez_out,estado_out,agroDef;
	
	// Definindo o preset de 3 (11)
	or(preset[0],digito[0],!digito[0]);
	or(preset[1],digito[0],!digito[0]);
	
	contadortres(clock,preset,botao,Q);
	
	or(digito[0],Q[0],Q[1]);
	
	or(digito[1],Q[1],!Q[0]);
	
	or(digito[2],Q[0],!Q[1]);
	
	or(digito[3],!Q[0],!Q[1]);
	
	// Mux segmentos
	muxDigitos(Q,unid_out,dez_out,estado_out,agroDef,segmentos);
	
endmodule