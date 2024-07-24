module cronometro(clock,sinal,sinal15,botao,casoEsp,unid_preset,dez_preset,unidade,dezena);
	input clock,casoEsp,botao;
	input [1:0]dez_preset;
	input [3:0]unid_preset;
	output [1:0]dezena;
	output [3:0]unidade;
	output sinal,sinal15;
	wire sinal,clock2,clock3,clock4;
	wire flag,key;
	
	and(key,sinal,!casoEsp,clock);
	or(flag,key,botao);
	
	contadornove(clock,unid_preset,flag,unidade);
	
	and(clock2,unidade[3],!unidade[2],!unidade[1],unidade[0]);
	or(clock3,flag,clock2);
	contadortres(clock3,dez_preset,flag,dezena);
	
	and(sinal,!dezena[0],!dezena[1],!unidade[3],!unidade[2],!unidade[1],!unidade[0]);
	and(sinal15,!dezena[1],dezena[0],!unidade[3],unidade[2],!unidade[1],unidade[0]);
	
endmodule