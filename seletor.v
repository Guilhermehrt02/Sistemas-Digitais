module seletor(A, B, sel, Saida);

input wire [5:0] A, B;
input wire sel;
output reg [5:0] Saida;

always @ (*) begin

	if(sel)
		Saida <= B;
	else
		Saida <= A;
end

endmodule 