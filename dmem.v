`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 21:11:58
// Design Name: 
// Module Name: dmem
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


module dmem(
    input clk,we,//write enable
    input [31:0]a,wd,//adress write data
    output [31:0]rd//read data
    );
    
    reg [31:0]RAM[63:0];
    
    initial RAM[0]=0;
    
    assign rd=RAM[a[31:2]];
    
    always@(posedge clk)
    begin
      if(we)
        RAM[a[31:2]]<=wd;
    end
    
endmodule
