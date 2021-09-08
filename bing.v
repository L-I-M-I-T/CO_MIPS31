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

assign c = {a, b,2'b00};//用于将PC的31~28位和左移两位后的instruct_index合并成32位地址

endmodule