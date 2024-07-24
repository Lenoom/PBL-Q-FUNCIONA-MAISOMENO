module divisores(clockPlaca,clockGerador,clockDisplay,clock1s,clockMeio);
	input clockPlaca,clockGerador;
	output clockDisplay,clock1s,clockMeio;
	wire preset,reset;
	wire [15:0]aux;
	
	// Divisor pro clockDisplay
	FlipFlopT(preset,reset,1,clockPlaca,aux[0]);
	FlipFlopT(preset,reset,1,aux[0],aux[1]);
	FlipFlopT(preset,reset,1,aux[1],aux[2]);
	FlipFlopT(preset,reset,1,aux[2],aux[3]);
	FlipFlopT(preset,reset,1,aux[3],aux[4]);
	FlipFlopT(preset,reset,1,aux[4],aux[5]);
	FlipFlopT(preset,reset,1,aux[5],aux[6]);
	FlipFlopT(preset,reset,1,aux[6],aux[7]);
	FlipFlopT(preset,reset,1,aux[7],aux[8]);
	FlipFlopT(preset,reset,1,aux[8],aux[9]);
	FlipFlopT(preset,reset,1,aux[9],aux[10]);
	FlipFlopT(preset,reset,1,aux[10],aux[11]);
	FlipFlopT(preset,reset,1,aux[11],aux[12]);
	FlipFlopT(preset,reset,1,aux[12],aux[13]);
	FlipFlopT(preset,reset,1,aux[13],aux[14]);
	FlipFlopT(preset,reset,1,aux[14],clockDisplay);
	
	// Divisor pro 1s, 0.5s 
	FlipFlopT(preset,reset,1,clockGerador,aux[15]);
	FlipFlopT(preset,reset,1,aux[15],clockMeio);
	FlipFlopT(preset,reset,1,clockMeio,clock1s);

endmodule