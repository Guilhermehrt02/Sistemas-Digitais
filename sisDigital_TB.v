`timescale 1ns/1ps 
module sisDigital_TB;

reg [3:0] Dados;
reg clk, rst, Instrucao;
wire [6:0] HexA, HexB, HexS;
wire Fim;
wire [2:0] estado;

//module sisDigital(Dados, Instrucao, clk, rst, Fim, HexA, HexB, HexS);
sisDigital DUT(Dados, Instrucao, clk, rst, Fim, HexA, HexB, HexS, estado);

initial begin
	$display ("Inicio da Simulacao:");
	clk = 1'b0;
	rst = 1'b0;
	Dados = 4'd5;
	Instrucao = 1'b0;
	#22  //espera de tempo com reset 

	rst = 1;//desligar o reset
	
	#22 //tempo para salvar o dado no proximo clock
	Dados = 4'd2;
	
	//segundo teste instrucao=1
	#66
	Dados = 4'd3;
	rst = 0;
	
	#20
	rst = 1;
	#20
	Dados = 4'd2;
	Instrucao = ~Instrucao;
	
	//terceiro teste fora intervalo
   #80
	Dados = 4'd7;
	rst = 0;
	
	#20
	rst = 1;
	#20
	Dados = 4'd2;
	
	#80 $finish;
end
	
always 
	#10 	clk = ~clk;

endmodule 