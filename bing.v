`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 19:42:09
// Design Name: 
// Module Name: bing
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


module bing(
input [3:0] a,
input [25:0] b,
output [31:0] c
);

assign c = {a, b,2'b00};//���ڽ�PC��31~28λ��������λ���instruct_index�ϲ���32λ��ַ

endmodule