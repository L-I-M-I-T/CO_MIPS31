`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:17:04
// Design Name: 
// Module Name: ext16
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


module ext16(input [15:0] a,output [31:0] b);
assign b = {{16{1'b0}},a};//将16位数据高位填0扩展成32位
endmodule
