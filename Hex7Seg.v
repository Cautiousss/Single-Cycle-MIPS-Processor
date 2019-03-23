`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 22:17:06
// Design Name: 
// Module Name: Hex7Seg
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


module Hex7Seg(
    input [31:0] x,
    input clk,
    input clr,
    output  [6:0] a2g,
    output reg [7:0] an,
    output  dp
    );
    
    wire [2:0] s;   //select a single led for display
    reg [3:0] digit;//4-bits
    reg [17:0] clkdiv;
    
    assign dp=1;

    assign s=clkdiv[17:15];
    
    //8-1 multiplexer
    always@(*)
    case(s)
      3'b000:digit=x[3:0];
      3'b001:digit=x[7:4];
      3'b010:digit=x[11:8];
      3'b011:digit=x[15:12];
      3'b100:digit=x[19:16];
      3'b101:digit=x[23:20];
      3'b110:digit=x[27:24];
      3'b111:digit=x[31:28];
      default:digit=x[3:0];
    endcase
    
    //select and lighten synchronously
    always@(*)
      begin
        an=8'b1111_1111;
        an[s]=0;
      end
      
      //clock divide
    always@(posedge clk,posedge clr)
      begin
      if(clr==1)
        clkdiv<=0;
      else
        clkdiv<=clkdiv+1;
      end
      
    //instantiate bcd7seg
    bcd7seg s7(digit,a2g);
    
endmodule

