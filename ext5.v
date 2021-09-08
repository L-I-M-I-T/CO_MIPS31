`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:14:06
// Design Name: 
// Module Name: ext5
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


module ext5(input [4:0] a,output [31:0] b);
assign b = {{27{1'b0}},a};//将5位数据高位填0扩展成32位
endmodule
