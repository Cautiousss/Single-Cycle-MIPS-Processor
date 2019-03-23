module display(
    input clk,
    input [3:0]sw,
    input [5:0] op,
    input [31:0] a,
	input [31:0] b,
	input [31:0] result,
	input [31:0]instr,
	output [6:0] led,
	output reg [7:0] en
    );
    
    reg [31:0]data;
    
    sevenSegmentDisplay alu_led(clk,data[31:28],data[27:24],data[23:20],data[19:16],data[15:12],data[11:8],data[7:4],data[3:0],led,en);
    
    always@(sw)
    begin
      case(sw)
      3'b100:data=instr;
      3'b000:data={25'b0000000000000000000000000,op};
      3'b001:data=a;
      3'b010:data=b;
      3'b010:data=result;
      default:data=0;
      endcase
    end
    
    endmodule