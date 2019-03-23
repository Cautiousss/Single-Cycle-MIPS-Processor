`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/07 20:49:27
// Design Name: 
// Module Name: alu
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


module alu(
    input [31:0]a,b,
    input [3:0]alucontrol,
    input [4:0]shamt,
    output reg[31:0]aluout,
    output zero,
    output SF//extended
    );
    
    wire [63:0]mult; 
    assign mult=a*b;
      
    always@(*)
    begin
      case(alucontrol)
      4'b0000:aluout<=a&b;//A AND B
      4'b0001:aluout<=a|b;//A OR B
      4'b0010:aluout<=a+b;//A+B
      4'b0011:aluout<=(a^b);//A xor B
      4'b0100:aluout<=a&(~b);
      4'b0101:aluout<=a|(~b);
      4'b0110:aluout<=a-b;
      4'b0111:aluout<=(a<b)?1:0;//SLT
      4'b1000:aluout<=~(a|b);//nor
      4'b1001:aluout<=mult[31:0];//multiple
      4'b1010:aluout<=(b<<shamt);//sll
      4'b1011:aluout<=(b>>shamt);//sra
    
      default:aluout<=0;
      endcase
    end

    assign zero=(aluout==0)?1:0;
    assign SF=aluout[31];
    
endmodule
