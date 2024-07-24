module estados(botao,sinal,sinalquinze,Us,Ua,T,estado,casoEsp);
	input sinal,sinalquinze,botao,Us,Ua,T;
	output [1:0]estado;
	output casoEsp;
	wire [1:0]estado,D,preset,reset;
	wire [10:0]aux;
	wire troca;
	
	and(sinal15,sinalquinze,casoEsp,!estado[1],estado[0]);
	or(troca,botao,sinal,sinal15,Us);
	
	
	// Define o Caso Específico
	and(casoEsp,Ua,!T);
	
	// Aspersão
	or(cu,!T,!Ua);
	and(aspersao,!estado[0],!estado[1],sinal,cu);
	
	// Gotejamento
	and(gotejamento1,!estado[1],!estado[0],!casoEsp,sinal,Ua,T);
	and(gotejamento2,!estado[1],estado[0],casoEsp,sinal15);
	or(gotejamento,gotejamento1,gotejamento2);
	
	// Limpeza
	and(aux[2],estado[1],!estado[0],sinal);
	and(aux[3],!estado[1],estado[0],sinal,!casoEsp);
	or(limpeza,aux[2],aux[3]);
	
	// Enchimento
	and(enchimento,estado[1],estado[0],sinal);
	
	// Define entrada dos flip flops
	or(aux[4],aspersao,limpeza);
	and(D[0],aux[4],!gotejamento,!enchimento,!botao,!Us);
	
	
	or(aux[5],sinal15,limpeza,gotejamento);
	and(D[1],aux[5],!aspersao,!enchimento,!botao,!Us);
	
	FlipFlopD(preset[0],reset[0],D[0],troca,estado[0]);
	
	FlipFlopD(preset[1],reset[1],D[1],troca,estado[1]);
	
endmodule