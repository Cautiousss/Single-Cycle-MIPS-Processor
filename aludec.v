`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 16:55:21
// Design Name: 
// Module Name: aludec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module aludec(
    input  [31:0] instr,
    output reg[3:0]alucontrol
    );

	always @(*) begin
		casex ({instr[31:26], instr[5:0]})
			12'b0001???????? : alucontrol = 4'b0110;//beq,bne,blt,bgt
			12'b001010?????? : alucontrol = 4'b0111;//slti
			12'b001000?????? : alucontrol = 4'b0010;//addi
			12'b001100?????? : alucontrol = 4'b0000;//andi(extended)
			12'b001101?????? : alucontrol = 4'b0001;//ori(extended)
			12'b100011?????? : alucontrol = 4'b0010;//lw
			12'b101011?????? : alucontrol = 4'b0010;//sw
			12'b001110?????? : alucontrol = 4'b0011;//xori(extended)
			//R-type
			12'b??????100100 : alucontrol = 4'b0000;//and
			12'b??????100101 : alucontrol = 4'b0001;//or
			12'b??????100000 : alucontrol = 4'b0010;//add
			12'b??????100110 : alucontrol = 4'b0011;//xor(extended)
			12'b??????100010 : alucontrol = 4'b0110;//sub
			12'b??????101010 : alucontrol = 4'b0111;//slt
			12'b??????100111 : alucontrol = 4'b1000;//nor(extended)
			12'b??????011000 : alucontrol = 4'b1001;//mult(extended)
			12'b??????000000 : alucontrol = 4'b1010;//sll(extended)
			12'b??????000010 : alucontrol = 4'b1011;//srl(extended)
			
			default          : alucontrol = 4'bxxxx;//???
		endcase
	end
	
endmodule
