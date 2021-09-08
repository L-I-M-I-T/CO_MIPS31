`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:19:21
// Design Name: 
// Module Name: ext18
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


module ext18(input [15:0] a,output [31:0] b);
assign b = {{14{a[15]}},a<<2};//将18位数据高位填符号位扩展成32位
endmodule
