`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/07 21:08:03
// Design Name: 
// Module Name: top
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


module top(
    input clk,reset,
    output [31:0]writedata,dataaddr,
    output memwrite,
    output [31:0]pc,instr,alua,alub//for display
    );
    
    wire [31:0]readdata;
    
    mips mips(clk,reset,pc,instr,memwrite,dataaddr,writedata,readdata,alua,alub);
    imem imem(pc[7:2],instr);
    dmem dmem(clk,memwrite,dataaddr,writedata,readdata);
    
endmodule
