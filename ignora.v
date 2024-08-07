// Contador 3 -> 0
module ignora(clock,preset,botao,Q);
 input clock,botao;
 input [1:0]preset;
 output [1:0]Q;
 wire [1:0]resetin;
 wire [1:0] presetout,resetout;
 
 not(resetin[0],preset[0]);
 not(resetin[1],preset[1]);

 and(presetout[0], botao, preset[0]);
 and(presetout[1], botao, preset[1]);
 
 and(resetout[0], botao, resetin[0]);
 and(resetout[1], botao, resetin[1]);

 // Flip-Flop 0.
 FlipFlopT(presetout[0],resetout[0],1,clock,Q[0]);
 
 //Flip-Flop 1.
 not(T1,Q[0]);
 FlipFlopT(presetout[1],resetout[1],T1,clock,Q[1]);
 
endmodule