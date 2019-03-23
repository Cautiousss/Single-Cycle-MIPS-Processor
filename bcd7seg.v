`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/20 22:23:42
// Design Name: 
// Module Name: bcd7seg
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


module bcd7seg(
    input wire [3:0]A,
    output wire [6:0]a
    );
    reg [6:0] a_r;   //{g,f,e,d,c,b,a}µÄ¸³ÖµË³Ðò
    assign a =~a_r;
    
    always @(A  )
    begin
        a_r = 7'b1111111;
        case (A )
                4'b0000: a_r = 7'b0111111; // 0
                4'b0001: a_r = 7'b0000110; // 1
                4'b0010: a_r = 7'b1011011; // 2
                4'b0011: a_r = 7'b1001111; // 3
                4'b0100: a_r = 7'b1100110; // 4
                4'b0101: a_r = 7'b1101101; // 5
                4'b0110: a_r = 7'b1111101; // 6
                4'b0111: a_r = 7'b0000111; // 7
                4'b1000: a_r = 7'b1111111; // 8
                4'b1001: a_r = 7'b1101111; // 9
                4'b1010: a_r = 7'b1110111; // A
                4'b1011: a_r = 7'b1111100; // b
                4'b1100: a_r = 7'b0111001; // c
                4'b1101: a_r = 7'b1011110; // d
                4'b1110: a_r = 7'b1111001; // E
                4'b1111: a_r = 7'b1110001; // F
                default: a_r = 7'b0000000;
            endcase
    end
endmodule


