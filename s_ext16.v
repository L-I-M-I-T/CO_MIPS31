`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:17:43
// Design Name: 
// Module Name: s_ext16
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


module s_ext16(input [15:0] a,output [31:0] b);
assign b = {{16{a[15]}},a};//将16位数据高位填符号位扩展成32位
endmodule
