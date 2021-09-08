`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:58:57
// Design Name: 
// Module Name: pcreg
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


module pcreg(clk,rst,ena,data_in,data_out);
input clk,rst,ena;
input [31:0] data_in;
output [31:0] data_out;
wire [31:0] data_out;
wire [31:0] d_data_out;

D_FF1 uut0(clk,data_in[0],rst,ena,data_out[0],d_data_out[0]);//依次实例化32个D触发器，并行实现32位pc寄存器
D_FF1 uut1(clk,data_in[1],rst,ena,data_out[1],d_data_out[1]);
D_FF1 uut2(clk,data_in[2],rst,ena,data_out[2],d_data_out[2]);
D_FF1 uut3(clk,data_in[3],rst,ena,data_out[3],d_data_out[3]);
D_FF1 uut4(clk,data_in[4],rst,ena,data_out[4],d_data_out[4]);
D_FF1 uut5(clk,data_in[5],rst,ena,data_out[5],d_data_out[5]);
D_FF1 uut6(clk,data_in[6],rst,ena,data_out[6],d_data_out[6]);
D_FF1 uut7(clk,data_in[7],rst,ena,data_out[7],d_data_out[7]);
D_FF1 uut8(clk,data_in[8],rst,ena,data_out[8],d_data_out[8]);
D_FF1 uut9(clk,data_in[9],rst,ena,data_out[9],d_data_out[9]);
D_FF1 uut10(clk,data_in[10],rst,ena,data_out[10],d_data_out[10]);
D_FF1 uut11(clk,data_in[11],rst,ena,data_out[11],d_data_out[11]);
D_FF1 uut12(clk,data_in[12],rst,ena,data_out[12],d_data_out[12]);
D_FF1 uut13(clk,data_in[13],rst,ena,data_out[13],d_data_out[13]);
D_FF1 uut14(clk,data_in[14],rst,ena,data_out[14],d_data_out[14]);
D_FF1 uut15(clk,data_in[15],rst,ena,data_out[15],d_data_out[15]);
D_FF1 uut16(clk,data_in[16],rst,ena,data_out[16],d_data_out[16]);
D_FF1 uut17(clk,data_in[17],rst,ena,data_out[17],d_data_out[17]);
D_FF1 uut18(clk,data_in[18],rst,ena,data_out[18],d_data_out[18]);
D_FF1 uut19(clk,data_in[19],rst,ena,data_out[19],d_data_out[19]);
D_FF1 uut20(clk,data_in[20],rst,ena,data_out[20],d_data_out[20]);
D_FF1 uut21(clk,data_in[21],rst,ena,data_out[21],d_data_out[21]);
D_FF1 uut22(clk,data_in[22],rst,ena,data_out[22],d_data_out[22]);
D_FF1 uut23(clk,data_in[23],rst,ena,data_out[23],d_data_out[23]);
D_FF1 uut24(clk,data_in[24],rst,ena,data_out[24],d_data_out[24]);
D_FF1 uut25(clk,data_in[25],rst,ena,data_out[25],d_data_out[25]);
D_FF1 uut26(clk,data_in[26],rst,ena,data_out[26],d_data_out[26]);
D_FF1 uut27(clk,data_in[27],rst,ena,data_out[27],d_data_out[27]);
D_FF1 uut28(clk,data_in[28],rst,ena,data_out[28],d_data_out[28]);
D_FF1 uut29(clk,data_in[29],rst,ena,data_out[29],d_data_out[29]);
D_FF1 uut30(clk,data_in[30],rst,ena,data_out[30],d_data_out[30]);
D_FF1 uut31(clk,data_in[31],rst,ena,data_out[31],d_data_out[31]);


endmodule
    

module D_FF1(CLK,D,RST_n,ena,Q1,Q2);//单个D触发器
input CLK,D,RST_n,ena;
output Q1,Q2;
reg Q1,Q2;

always @(negedge CLK or posedge RST_n)
begin
  if ((RST_n==0)&&(ena==1)) begin
    if (D==1) begin
      Q1=1;
      Q2=0;
    end
    else begin
      Q1=0;
      Q2=1;
    end
  end
  else 
  if (RST_n==1) begin
    Q1=0;
    Q2=1;
  end
end

endmodule