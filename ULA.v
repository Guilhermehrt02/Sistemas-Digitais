module ULA(A, B, Op, Saida);

input [5:0] A, B;
input [1:0] Op;
output reg [5:0] Saida;

always@(*) begin

	case(Op)
		0: Saida = A;
		1: Saida = A + B;
		2: Saida = A - B;
		3: Saida = ~A;
	endcase
end 

endmodule 