module geraPreset(estado,casoEsp,unid_preset,dez_preset);
	input [1:0]estado;
	input casoEsp;
	output [3:0]unid_preset;
	output [1:0]dez_preset;
	wire [10:0]aux;

	
	// Preset 4 digitos unidade.
	
	// 000X 
	and(aux[0],estado[1],estado[0]);
	and(aux[1],!estado[1],estado[0],!casoEsp);
	or U0(unid_preset[0],aux[0],aux[1]);
	
	// 00X0
	and U1(unid_preset[1],!estado[1],estado[0],casoEsp);
	
	// 0X00
	and(aux[6],estado[1],estado[0]);
	and(aux[7],!estado[1],estado[0],!casoEsp);
	or U2(unid_preset[2],aux[6],aux[7]);
	
	// X000
	assign unid_preset[3] = 0;

	
	// Preset 2 digitos dezena.
	// 0X
	nor(aux[2],estado[1],estado[0]);
	and(aux[3],!estado[1],estado[0],!casoEsp);
	and(aux[4],estado[1],!estado[0],!casoEsp);
	or D0(dez_preset[0],aux[2],aux[3],aux[4]);
	
	// X0
	and(aux[8],estado[1],!estado[0],!casoEsp);
	and(aux[9],!estado[1],estado[0],casoEsp);
	or(dez_preset[1],aux[8],aux[9]);
		
endmodule