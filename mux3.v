`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/22 12:58:17
// Design Name: 
// Module Name: mux3#(parameter WIDTH=32)
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


module mux3#(parameter WIDTH=32)(
    input [WIDTH-1:0]data0,
    input [WIDTH-1:0]data1,
    input [WIDTH-1:0]data2,
    input [1:0]SW,
    output reg[WIDTH-1:0]out
    );
    
    always@(*)
    begin
    case(SW)
    2'b00:out=data0;
    2'b01:out=data1;
    2'b10:out=data2;
    default:out=data0;    
    endcase
    end
    
endmodule
