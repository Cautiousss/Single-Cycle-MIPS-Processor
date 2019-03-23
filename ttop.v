`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 22:27:00
// Design Name: 
// Module Name: ttop
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


module ttop(
    input CLK100MHZ,
    input reset,
    input [3:1]SW,
    output [6:0] A2G,//Seven-segment display nixie tube
    output [7:0] AN,//enable
    output DP
    );
    
    wire[31:0]writedata,dataaddr,pc,instr,alua,alub;
    wire memwrite,myclk;
    reg [31:0]data4display;
    
    top t(myclk,reset,writedata,dataaddr,memwrite,pc,instr,alua,alub);
    clkdiv clk(CLK100MHZ,myclk);
    Hex7Seg h7s(data4display,CLK100MHZ,reset,A2G,AN,DP);
    
    always@(*)
    case(SW[3:1])
    3'b000:data4display=pc;
    3'b001:data4display=instr;
    3'b010:data4display=alua;
    3'b011:data4display=alub;
    3'b100:begin
    if(memwrite)
      data4display=writedata;
    else
      data4display=0;
    end
    3'b101:data4display=dataaddr;
    default:data4display=pc;
    endcase
    
endmodule
