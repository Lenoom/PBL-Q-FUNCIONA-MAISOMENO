module main(clockPlaca,clockGerador,agroDef,Us,Ua,T,button,segmentos,digito,sinal,sinal15);
	input Us,Ua,T,agroDef,button,clockPlaca,clockGerador;
	
	output sinal,sinal15;
	
	output [3:0]digito;
	output [6:0]segmentos;
	wire [1:0]estado,dez_preset,dezena;
	wire [3:0]unid_preset,unidade;
	wire botao,sinal,sinal15,casoEsp,clockDisplay,clock1s,clockMeio;
	wire [6:0]unid_out,dez_out,estado_out,agroDef_out;
	
	// Divide os Clocks
	divisores(clockPlaca,clockGerador,clockDisplay,clock1s,clockMeio);
	
	// Passa o sinal do botão por um debouncer.
	Debouncer(clock1s,button,botao);
	
	// Decide qual será o estado atual com base nos estados passados e entradas atuais.
	estados(botao,sinal,sinal15,Us,Ua,T,estado,casoEsp);
	
	// Pega o estado atual e gera um preset pro tempo.
	geraPreset(estado,casoEsp,unid_preset,dez_preset,sinal,sinal15);
	
	// Manda os presets pro cronometro.
	cronometro(clock1s,sinal,sinal15,botao,casoEsp,unid_preset,dez_preset,unidade,dezena);
	
	// Pega os números binário e decodifica.
	decodificadores(estado,unidade,dezena,unid_out,dez_out,estado_out);
	
	// Faz o Digito do Agrodefensivo que gira.
	digitoAgrodef(clockGerador,sinal,botao,agroDef_out);
	
	// Manda os estados, os números, clock rápido e botão e retorna digito e segmentos.
	varredura(clockDisplay,unid_out,dez_out,estado_out,digito,segmentos,botao,agroDef_out);
	
endmodule