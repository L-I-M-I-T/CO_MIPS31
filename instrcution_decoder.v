`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 10:11:25
// Design Name: 
// Module Name: instrcution_decoder
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


module instruction_decoder( input [31:0] instruction_code,output reg[31:0] instruction_type);
//指令译码器，输入为接收到的指令，输出为对应的指令类型
wire [11:0] temp;
assign temp = {instruction_code[31:26],instruction_code[5:0]};
//32~26为op，5~0为func，通过这两者判断指令类型，使用32位寄存器，表示是置1的位对应的指令类型

always @ (temp) begin
casez(temp)
   12'b000000100000:instruction_type=1<<0;//ADD
   12'b000000100001:instruction_type=1<<1;//ADDU
   12'b000000100010:instruction_type=1<<2;//SUB
   12'b000000100011:instruction_type=1<<3;//SUBU
   12'b000000100100:instruction_type=1<<4;//AND
   12'b000000100101:instruction_type=1<<5;//OR
   12'b000000100110:instruction_type=1<<6;//XOR
   12'b000000100111:instruction_type=1<<7;//NOR
   12'b000000101010:instruction_type=1<<8;//SLT
   12'b000000101011:instruction_type=1<<9;//SLTU
   12'b000000000000:instruction_type=1<<10;//SLL
   12'b000000000010:instruction_type=1<<11;//SRL
   12'b000000000011:instruction_type=1<<12;//SRA
   12'b000000000100:instruction_type=1<<13;//SLLV
   12'b000000000110:instruction_type=1<<14;//SRLV
   12'b000000000111:instruction_type=1<<15;//SRAV
   12'b000000001000:instruction_type=1<<16;//JR
   12'b001000??????:instruction_type=1<<17;//ADDI
   12'b001001??????:instruction_type=1<<18;//ADDIU
   12'b001100??????:instruction_type=1<<19;//ANDI
   12'b001101??????:instruction_type=1<<20;//ORI
   12'b001110??????:instruction_type=1<<21;//XORI
   12'b001111??????:instruction_type=1<<22;//LUI
   12'b100011??????:instruction_type=1<<23;//LW
   12'b101011??????:instruction_type=1<<24;//SW
   12'b000100??????:instruction_type=1<<25;//BEQ
   12'b000101??????:instruction_type=1<<26;//BNE
   12'b001010??????:instruction_type=1<<27;//SLTI
   12'b001011??????:instruction_type=1<<28;//SLTIU
   12'b000010??????:instruction_type=1<<29;//JL
   12'b000011??????:instruction_type=1<<30;//JAL
   default:;
   endcase
end

endmodule
