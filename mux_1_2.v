`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 19:35:20
// Design Name: 
// Module Name: mux_1_2
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


module mux_1_2(
input [31:0] a,
input [31:0] b,
input m,
output [31:0] c
);

assign c=(m==1)?b:a;//1-2Â·Ñ¡ÔñÆ÷

endmodule