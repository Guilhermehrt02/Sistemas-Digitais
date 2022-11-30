module sisDigital(Dados, Instrucao, clk, rst, Fim, HexA, HexB, HexS, estado);

input [3:0] Dados;
input clk, rst, Instrucao;

output [6:0] HexA, HexB, HexS;
output Fim;
output [2:0] estado;

wire EnA, EnB, Sel;
wire [1:0] Op, OpReg;
wire [5:0] SaidaA, SaidaB, SaidaS, SaidaU, Saida;

//module controle(Instrucao, clk, rst, EnA, EnB, Sel, Op, OpReg, Fim, estado);
controle c(Instrucao, clk, rst, EnA, EnB, Sel, Op, OpReg, Fim, estado);

//module registro(Dados, clk, rst, En, Saida); 
registro RegA({2'b00,Dados[3:0]}, clk, rst, EnA, SaidaA); 

//module registro(Dados, clk, rst, En, Saida); 
registro RegB({2'b00,Dados[3:0]}, clk, rst, EnB, SaidaB); 

//module seletor(A, B, sel, Saida);
seletor s(SaidaB, Saida, Sel, SaidaS);

//module ULA(A, B, Op, Saida);
ULA u(SaidaA, SaidaS, Op, SaidaU);

//module deslocamento(Dados, clk, rst, OpReg, Saida);
deslocamento RegC(SaidaU, clk, rst, OpReg, Saida);

//module display (Entrada, Hex);
display d1(SaidaA, HexA);

//module display (Entrada, Hex);
display d2(SaidaB, HexB);

//module display (Entrada, Hex);
display d3(Saida, HexS);

endmodule 