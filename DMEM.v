`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/20 00:52:30
// Design Name: 
// Module Name: DMEM
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


module DMEM(
input clk,
input [10:0] addr,
input cs, r, w,
input [31:0] rdata,
output [31:0] wdata
);
reg [31:0] mem [0:2047];

always @(posedge clk) begin
    if (cs&w)
		mem[addr]=rdata;
end

assign wdata = r?mem[addr]:32'hzzzzzzzz;

endmodule
