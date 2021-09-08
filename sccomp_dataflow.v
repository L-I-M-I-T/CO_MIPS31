`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/20 01:34:36
// Design Name: 
// Module Name: sccomp_dataflow
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


module sccomp_dataflow(
input clk_in,
input reset,
output [31:0] inst,
output [31:0] pc
);

wire [31:0] addr;
wire [31:0] wdata;
wire [31:0] rdata;
wire [31:0] ip_in;

assign  ip_in=pc-32'h00400000;
cpu sccpu(clk_in,reset,inst,rdata,pc,addr,wdata,IM_R,DM_CS,DM_R,DM_W);
imem im(ip_in[12:2],inst);
//IMEM im(clk_in,pc[12:2],IM_R,inst);
DMEM dm(clk_in,addr-32'h10010000,DM_CS,DM_R,DM_W,wdata,rdata);

endmodule
