module registro(Dados, clk, rst, En, Saida); 

input wire [5:0] Dados;
input wire clk, rst, En;
output reg [5:0] Saida;

always @ (posedge clk or negedge rst)
	if(!rst) 
		Saida <= 0;
	else 
		if (En)			
				Saida <= Dados;
			
endmodule 