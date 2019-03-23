`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 17:05:28
// Design Name: 
// Module Name: maindec
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


//module maindec(
//    input [5:0]op,
//    output  memtoreg,memwrite,
//    output  branch,alusrc,
//    output  regdst,regwrite,
//    output  jump,
//    output  [1:0]aluop
//   );
 
//    reg [8:0]controls;
    
//    assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop}=controls;
    
//    always@(*)
//    begin
//      case(op)
//       6'b000000:controls<=9'b110000010;//RTYPE
//       6'b100011:controls<=9'b101001000;//LW
//       6'b101011:controls<=9'b001010000;//SW
//       6'b000100:controls<=9'b000100001;//BEQ
//       6'b001000:controls<=9'b101000000;//ADDI
//       6'b000010:controls<=9'b000000100;//J
//       default:controls<=9'bxxxxxxxxx;//illegal op
//       endcase
//     end
 
//endmodule

module maindec (
	input [31:0]instr,
	output branchEqual,
	output branchNotEqual,
	output branchLessThan,
	output branchGreaterThan,
    output jump,jumpr,
	output memtoreg,
	output memwrite,
	output regdst,
	output regwrite ,
	output alusrc
);

	wire [5:0]opcode;
	assign opcode = instr[31:26];

	wire [5:0] func;
	assign func = instr[5:0];

    //R-type
    wire is_sll = ((opcode == 6'h00) & (func == 6'h00));//sll
	wire is_srl = ((opcode == 6'h00) & (func == 6'h02));//sra
	wire is_jr  = ((opcode == 6'h00) & (func == 6'h08));//extended
    wire is_mult = ((opcode == 6'h00) & (func == 6'h18));//extended
	wire is_add = ((opcode == 6'h00) & (func == 6'h20));
	wire is_sub = ((opcode == 6'h00) & (func == 6'h22));
	wire is_and = ((opcode == 6'h00) & (func == 6'h24));
	wire is_or  = ((opcode == 6'h00) & (func == 6'h25));
	wire is_xor = ((opcode == 6'h00) & (func == 6'h26));
	wire is_nor = ((opcode == 6'h00) & (func == 6'h27));
	wire is_slt = ((opcode == 6'h00) & (func == 6'h2A));
	
    //I-type
	wire is_beq  = (opcode == 6'h04);
	wire is_bneq = (opcode == 6'h05);
	wire is_blt = (opcode == 6'h06);
	wire is_bgt = (opcode == 6'h07);
	wire is_addi = (opcode == 6'h08);
	wire is_slti = (opcode ==6'h0a);
	wire is_andi = (opcode == 6'h0c);
	wire is_ori = (opcode == 6'h0d);
	wire is_xori = (opcode == 6'h0e);
	wire is_lw = (opcode == 6'h23);
	wire is_sw = (opcode == 6'h2B);
	
	//J-type
	wire is_j    = (opcode == 6'h02);
	
	assign branchEqual     = is_beq;
	assign branchNotEqual  = is_bneq;
	assign branchLessThan  = is_blt;
	assign branchGreaterThan=is_bgt;

	assign jump       = is_j;
	assign jumpr   = is_jr;
	assign memtoreg = is_lw;
	assign memwrite  = is_sw;
	assign regdst    = is_add | is_sub | is_and | is_or | is_slt | is_nor | is_xor | is_sll | is_srl;//extend
	assign regwrite  = is_add | is_sub | is_and | is_or | is_slt | is_addi | is_lw | is_nor | is_xor | is_andi |is_ori | is_sll | is_srl;//extend
	assign alusrc    = is_addi | is_slti | is_andi | is_ori | is_xori | is_lw | is_sw;

endmodule
