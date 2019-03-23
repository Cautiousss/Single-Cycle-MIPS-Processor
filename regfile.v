`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 16:33:54
// Design Name: 
// Module Name: regfile
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Two read ports and one write port
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module regfile(
    input clk,//clock
    input we3,//write enable
    input [4:0]ra1,ra2,wa3,//read/write address
    input [31:0]wd3,//write data
    output [31:0]rd1,rd2//read data
    );
    
    reg [31:0] rf [31:0];//register file
    
    always@(posedge clk)
    begin
      if(we3)
        rf[wa3]<=wd3;
    end
    
    assign rd1=(ra1!=0)?rf[ra1]:0;
    assign rd2=(ra2!=0)?rf[ra2]:0;
    
endmodule
