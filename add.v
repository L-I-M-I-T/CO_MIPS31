`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:26:22
// Design Name: 
// Module Name: add
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


module add(
input [31:0] a,
input [31:0] b,
output [31:0] r,
output o
);
//无符号数加法器，用于计算地址
wire[32:0] c;
assign c={a[31],a}+{b[31],b};//使用双符号位方便判断溢出
assign r=a+b;
assign o=(c[32]==c[31])?0:1;//判断是否溢出

endmodule

