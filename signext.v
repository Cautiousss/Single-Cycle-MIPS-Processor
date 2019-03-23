`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 16:43:15
// Design Name: 
// Module Name: signext
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


module signext#(parameter WIDTH=16)(
    input [31:0]instr,
    output reg[31:0]y
    );    
    
    always@(*)
    begin
    case(instr[31:26])
    //Unsigned extension
    6'b001101:y={{(32-WIDTH){1'b0}},instr[WIDTH-1:0]};//ori
    6'b001100:y={{(32-WIDTH){1'b0}},instr[WIDTH-1:0]};//andi
    6'b001110:y={{(32-WIDTH){1'b0}},instr[WIDTH-1:0]};//xori
    
    //signed extension
    default: y={{(32-WIDTH){instr[WIDTH-1]}},instr[WIDTH-1:0]};
    endcase
    end
    
endmodule
