module controle(Instrucao, clk, rst, EnA, EnB, Sel, Op, OpReg, Fim, estado);

input wire Instrucao, clk, rst;
output reg [1:0] Op, OpReg;
output reg EnA, EnB, Sel, Fim;
output wire [2:0] estado;
reg [2:0] E;

//declaração dos estados
parameter[2:0] S0 = 0;
parameter[2:0] S1 = 1;
parameter[2:0] S2 = 2;
parameter[2:0] S3 = 3;
parameter[2:0] S4 = 4;
parameter[2:0] S5 = 5;
parameter[2:0] S6 = 6;

assign estado = E;

//bloco para gerenciar os estados
always @(posedge clk or negedge rst)
	if (!rst) 
		E <= S0;
	else 
		case (E)
			S0: E<=S1;
			S1: if(!Instrucao) 
					E<=S2;
				 else
					E<=S4;
			S2: E<=S3;
			S3: E<=S0;
			S4: E<=S5;
			S5: E<=S6;
			S6: E<=S0;
		endcase

	
//bloco para gerenciar as saidas	
always@ (E)
	case (E)
//habilitação do A

		S0:     
			begin
				EnA <= 1; 	
				EnB <= 0;
				Sel <= 0;
				Op <= 2'b00;
				OpReg <= 2'b00;
				Fim<=0;
			end
			
//habilitação do B

		S1:     
			begin
				EnA <= 0; 	
				EnB <= 1;
				Sel <= 0;
				Op <= 2'b00;
				OpReg <= 2'b00;
				Fim<=0;
			end
			
//Instrução = 0

		S2:     
			begin
				EnA <= 0; 	
				EnB <= 0;
				//A-B
				Sel <= 0;
				Op <= 2'b10;
				OpReg <= 2'b01;
				Fim<=0;

			end
		S3:     
			begin
				EnA <= 0; 	
				EnB <= 0;
				//A+(A-B)
				Sel <= 1;
				Op <= 2'b01;
				OpReg <= 2'b01;
				Fim<=1;
			end
			
//Instrução = 1	
		
		S4:     
			begin
				EnA <= 0; 	
				EnB <= 0;
				//A+B
				Sel <= 0;
				Op <= 2'b01;
				OpReg <= 2'b01;
				Fim<=0;
			end
		S5:     
			begin
				EnA <= 0; 	
				EnB <= 0;
				//A+(A+B)
				Sel <= 1;
				Op <= 2'b01;
				OpReg <= 2'b01;
				Fim<=0;
			end
		S6:     
			begin
				EnA <= 0; 	
				EnB <= 0;
				//(A+(A+(A+B)))/2
				Sel <= 1;
				Op <= 2'b01;
				OpReg <= 2'b10;
				Fim<=1;
			end
	endcase
endmodule 