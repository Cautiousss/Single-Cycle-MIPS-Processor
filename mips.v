`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 21:26:54
// Design Name: 
// Module Name: mips
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


module mips(
    input clk,reset,
    output [31:0]pc,
    input [31:0]instr,
    output memwrite,
    output [31:0]aluout,writedata,
    input [31:0]readdata,
    output [31:0]srca,srcb
    );
    
    
    //wire memtoreg,alusrc,regdst,regwrite,jump,pcsrc,zero;
    //wire [2:0]alucontrol;
   
    //controller c(instr[31:26],instr[5:0],zero,memtoreg,memwrite,pcsrc,alusrc,regdst,regwrite,jump,alucontrol);
    //datapath dp(clk,reset,memtoreg,pcsrc,alusrc,regdst,regwrite,jump,alucontrol,zero,pc,instr,aluout,writedata,readdata);
    wire [3:0] alucontrol;
    wire       alusrc;
    wire       branchEqual;
    wire       branchNotEqual;
    wire       branchLessThan;
    wire       branchGreaterThan;
    wire       jump,jumpr;
    wire       memtoreg;
    wire       regdst;
    wire       regwrite;
    wire       pcsrc;
    wire       zero;
    wire       SF;
    
    controller c(instr,zero,SF,branchEqual,branchNotEqual,branchLessThan,branchGreaterThan,jump,jumpr,memtoreg,memwrite,regdst,regwrite,alucontrol,pcsrc,alusrc);
    datapath dp(clk,reset,memtoreg,pcsrc,alusrc,regdst,regwrite,jump,jumpr,alucontrol,zero,SF,pc,instr,aluout,writedata,readdata,srca,srcb); 
     
    
endmodule
