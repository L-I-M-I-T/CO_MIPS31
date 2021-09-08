`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:16:39
// Design Name: 
// Module Name: ALU
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

/*
module alu(
input [31:0]a,        
input [31:0]b,       
input [3:0]aluc,  
output [31:0]r,
output z,
output c,
output n,
output o
);
 
reg signed [32:0] r1;
reg [32:0] r2;
wire signed [31:0] ta;
wire signed [31:0] tb;
//行为级ALU,r1暂存运算结果，r2辅助运算便于判断是否溢出，ta和tb将a、b转化为有符号数便于进行有符号数运算
 
assign ta=a;
assign tb=b;

always@ (aluc,a,b) 
begin
  casez(aluc)
    4'b0000:begin r1=a+b;r2={ta[31],ta}+{tb[31],tb};end//ADDU，运算过程中使用双符号位便于判断溢出
    4'b0010:begin r1=ta+tb;end//ADD
    4'b0001:begin r1=a-b;r2={ta[31],ta}-{tb[31],tb};end//SUBU，运算过程中使用双符号位便于判断溢出
    4'b0011:begin r1=ta-tb;end//SUB
    4'b0100:begin r1=a&b;end//AND
    4'b0101:begin r1=a|b;end//OR
    4'b0110:begin r1=a^b;end//XOR
    4'b0111:begin r1=~(a|b);end//NOR
    4'b100?:begin r1={b[15:0],16'b0};end//LUI
    4'b1011:begin r1=(ta<tb)?1:0;end//SLT
    4'b1010:begin r1=(a<b)?1:0;end//SLTU
    4'b1100:begin if(a==0) {r1[31:0],r2[32]}={b,1'b0};else {r1[31:0],r2[32]}=tb>>>(a-1);end//SRA，运算过程中附加一位实现记录最后移出去的一位
    4'b111?:begin r1=b<<a;end//SLL/SLR
    4'b1101:begin if(a==0) {r1[31:0],r2[32]}={b,1'b0};else {r1[31:0],r2[32]}=b>>(a-1);end//SRL，运算过程中附加一位实现记录最后移出去的一位
    default:;
  endcase
end

assign r=(r1[31]==0)?r1:({r1[31],~r1[30:0]}+1);
assign c=(aluc==4'b0000|aluc==4'b0001|aluc==4'b1010|aluc==4'b1100|aluc==4'b1101|aluc==4'b1111|aluc==4'b1110)?r2[32]:1'b0;//无符号数加法运算发生上溢或无符号数减法发生下溢或无符号数比较运算a-b<0时该标志位为1。移位运算该标志位为最后一次被移出的位的数值。
assign z=(c==32'b0)?1:0;//z=1表示运算结果为0,z=0表示运算结果不为0，所有运算均影响此标志位。
assign n=r[31];//有符号数运算，操作数和结果均用二进制补码的形式表示，n=1表示结果为负数，n=0表示结果为正数或零。其他运算最终结果r[31]为1则n为1。
assign o=(aluc==4'b0010|aluc==4'b0011)?(r2[32]^r2[31]):1'b0;//对于有符号加减法运算，操作数和运算结果均用二进制补码的形式表示，有溢出时该标志位o=1。

endmodule*/

module alu(
input [31:0]a,        
input [31:0]b,       
input [3:0]aluc,  
output [31:0]r,
output z,
output c,
output n,
output o
);
 
reg [32:0] r1;
//行为级ALU,r1暂存运算结果，r2辅助运算便于判断是否溢出，ta和tb将a、b转化为有符号数便于进行有符号数运算
 
wire signed [31:0] ta;
wire signed [31:0] tb;
assign ta=a;
assign tb=b;

always@ (aluc or a or b) 
begin
  casez(aluc)
    4'b0000:begin r1=a+b;end//ADDU，运算过程中使用双符号位便于判断溢出
    4'b0010:begin r1={a[31],a}+{b[31],b};end//ADD
    4'b0001:begin r1=a-b;end//SUBU，运算过程中使用双符号位便于判断溢出
    4'b0011:begin r1={a[31],a}-{b[31],b};end//SUB
    4'b0100:begin r1=a&b;end//AND
    4'b0101:begin r1=a|b;end//OR
    4'b0110:begin r1=a^b;end//XOR
    4'b0111:begin r1=~(a|b);end//NOR
    4'b100?:begin r1={b[15:0],16'b0};end//LUI
    4'b1011:begin r1=(ta<tb)?1:0;end//SLT
    4'b1010:begin r1=(a<b)?1:0;end//SLTU
    4'b1100:begin if(a==0) {r1[31:0],r1[32]}={b,1'b0};else {r1[31:0],r1[32]}=tb>>>(ta-1);end//SRA，运算过程中附加一位实现记录最后移出去的一位
    4'b111?:begin r1=b<<a;end//SLL/SLR
    4'b1101:begin if(a==0) {r1[31:0],r1[32]}={b,1'b0};else {r1[31:0],r1[32]}=b>>(a-1);end//SRL，运算过程中附加一位实现记录最后移出去的一位
    default:;
  endcase
end

assign r=r1[31:0];
assign c=(aluc==4'b0000|aluc==4'b0001|aluc==4'b1010|aluc==4'b1100|aluc==4'b1101|aluc==4'b1111|aluc==4'b1110)?r1[32]:1'b0;//无符号数加法运算发生上溢或无符号数减法发生下溢或无符号数比较运算a-b<0时该标志位为1。移位运算该标志位为最后一次被移出的位的数值。
assign z=(r1==32'b0)?1:0;//z=1表示运算结果为0,z=0表示运算结果不为0，所有运算均影响此标志位。
assign n=r[31];//有符号数运算，操作数和结果均用二进制补码的形式表示，n=1表示结果为负数，n=0表示结果为正数或零。其他运算最终结果r[31]为1则n为1。
assign o=(aluc==4'b0010|aluc==4'b0011)?(r1[32]^r1[31]):1'b0;//对于有符号加减法运算，操作数和运算结果均用二进制补码的形式表示，有溢出时该标志位o=1。

endmodule

