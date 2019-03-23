`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 21:18:52
// Design Name: 
// Module Name: controller
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


//module controller(
//    input [5:0]op,funct,
//    input zero,
//    output memtoreg,memwrite,
//    output pcsrc,alusrc,
//    output regdst,regwrite,
//    output jump,
//    output [2:0]alucontrol
//    );
    
//    wire [1:0]aluop;
//    wire branch;
    
//    maindec md(op,memtoreg,memwrite,branch,alusrc,regdst,regwrite,jump,aluop);
//    aludec ad(funct,aluop,alucontrol);
    
//    assign pcsrc=branch&zero;

module controller(
    input[31:0]instr,
    input zero,SF,
    output branchEqual,
    output branchNotEqual,//extended
	output branchLessThan,//extended
	output branchGreaterThan,//extended
    output jump,jumpr,
    output memtoreg,memwrite,
    output regdst,regwrite,
	output [3:0]alucontrol,
	output pcsrc,alusrc
);

   maindec md(instr,branchEqual,branchNotEqual,branchLessThan,branchGreaterThan,jump,jumpr,memtoreg,memwrite,regdst,regwrite,alusrc);
   aludec ad(instr,alucontrol);
   
   assign pcsrc=(branchEqual&zero)|(branchNotEqual&~zero)|(branchLessThan&SF)|(branchGreaterThan&~SF);
   
endmodule
