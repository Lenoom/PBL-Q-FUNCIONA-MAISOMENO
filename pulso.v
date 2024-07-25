module pulso(estado,sinal,sinal15,casoEsp,pulso);
	input [1:0]estado;
	input sinal,sinal15,casoEsp;
	output pulso;
	wire [1:0]estadoant;
	wire [2:0]aux;
	
	and(aux[2],sinal15,casoEsp);
	or(flag,sinal,aux[2]);
	
	FlipFlopD(preset,reset,estado[0],flag,estadoant[0]);
	
	FlipFlopD(preset,reset,estado[1],flag,estadoant[1]);
	
	xor(aux[0],estadoant[0],estado[0]);
	xor(aux[1],estadoant[1],estado[1]);
	
	or(pulso,aux[0],aux[1]);
	
endmodule