module deslocamento(Dados, clk, rst, OpReg, Saida);

input wire [5:0] Dados;
input wire clk, rst;
input wire [1:0] OpReg;
output reg [5:0] Saida;

always@(posedge clk or negedge rst) begin
	if (!rst) 
		Saida <= 5'b000000;
	else 
		case(OpReg)
			1: Saida = Dados;
			2: Saida = {1'b0,Dados[5:1]};
			3: Saida = {Dados[4:0],Dados[0]};
		endcase
end 

endmodule 