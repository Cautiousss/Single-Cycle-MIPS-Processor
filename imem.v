`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 21:11:58
// Design Name: 
// Module Name: imem
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


module imem(
    input [5:0]a,
    output reg[31:0]rd
    );
      always@(a)
    begin
        case(a)
        //testcase
        00: rd = 32'h20020005;
        01: rd = 32'h2003000c;
        02: rd = 32'h2067fff7;
        03: rd = 32'h00e22025;
        04: rd = 32'h00642824;
        05: rd = 32'h00a42820;
        06: rd = 32'h10a7000a;
        07: rd = 32'h0064202a;
        08: rd = 32'h10800001;
        09: rd = 32'h20050000;
        10: rd = 32'h00e2202a;
        11: rd = 32'h00853820;
        12: rd = 32'h00e23822;
        13: rd = 32'hac670044;
        14: rd = 32'h8c020050;
        15: rd = 32'h08000011;
        16: rd = 32'h20020001;
        17: rd = 32'hac020054;
			18 : rd = 32'h00000000;
			19 : rd = 32'h00000000;
			20 : rd = 32'h00000000;
			21 : rd = 32'h00000000;
			22 : rd = 32'h00000000;
			23 : rd = 32'h00000000;
			24 : rd = 32'h00000000;
			25 : rd = 32'h00000000;
			26 : rd = 32'h00000000;
			27 : rd = 32'h00000000;
			28 : rd = 32'h00000000;
			29 : rd = 32'h00000000;
			30 : rd = 32'h00000000;
			31 : rd = 32'h00000000;
			32 : rd = 32'h00000000;
			33 : rd = 32'h00000000;
			34 : rd = 32'h00000000;
			35 : rd = 32'h00000000;
			36 : rd = 32'h00000000;
			37 : rd = 32'h00000000;
			38 : rd = 32'h00000000;
			39 : rd = 32'h00000000;
			40 : rd = 32'h00000000;
			41 : rd = 32'h00000000;
			42 : rd = 32'h00000000;
			43 : rd = 32'h00000000;
			44 : rd = 32'h00000000;
			45 : rd = 32'h00000000;
			46 : rd = 32'h00000000;
			47 : rd = 32'h00000000;
			48 : rd = 32'h00000000;
			49 : rd = 32'h00000000;
			50 : rd = 32'h00000000;
			51 : rd = 32'h00000000;
			52 : rd = 32'h00000000;
			53 : rd = 32'h00000000;
			54 : rd = 32'h00000000;
			55 : rd = 32'h00000000;
			56 : rd = 32'h00000000;
			57 : rd = 32'h00000000;
			58 : rd = 32'h00000000;
			59 : rd = 32'h00000000;
			60 : rd = 32'h00000000;
			61 : rd = 32'h00000000;
			62 : rd = 32'h00000000;
			63 : rd = 32'h00000000;
		endcase
	end
	
    //reg [31:0]RAM[63:0];
    
    //initial
      //$readmemh("D:\Vivado\MIPS\MIPS.srcs\sources_1\new\memfile.txt",RAM);
      
    //assign rd=RAM[a];//word aligned
 
endmodule
