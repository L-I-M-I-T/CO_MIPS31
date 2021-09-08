`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 20:59:32
// Design Name: 
// Module Name: regfile
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


module regfile(clk,rst,we,raddr1,raddr2,waddr,wdata,rdata1,rdata2);
input clk,rst,we;
input [4:0] raddr1;
input [4:0] raddr2;
input [4:0] waddr;
input [31:0] wdata;
output [31:0] rdata1;
output [31:0] rdata2;
wire [31:0] d;
wire [31:0] array_reg[0:31];

decoder srt (waddr,we,d);
pcreg uvw0 (clk,rst,1'b0,wdata,array_reg[0]);//依次实例化寄存器中的各个寄存器，并行实现寄存器堆,特殊地有0寄存器不能被写入
pcreg uvw1 (clk,rst,d[1],wdata,array_reg[1]);
pcreg uvw2 (clk,rst,d[2],wdata,array_reg[2]);
pcreg uvw3 (clk,rst,d[3],wdata,array_reg[3]);
pcreg uvw4 (clk,rst,d[4],wdata,array_reg[4]);
pcreg uvw5 (clk,rst,d[5],wdata,array_reg[5]);
pcreg uvw6 (clk,rst,d[6],wdata,array_reg[6]);
pcreg uvw7 (clk,rst,d[7],wdata,array_reg[7]);
pcreg uvw8 (clk,rst,d[8],wdata,array_reg[8]);
pcreg uvw9 (clk,rst,d[9],wdata,array_reg[9]);
pcreg uvw10 (clk,rst,d[10],wdata,array_reg[10]);
pcreg uvw11 (clk,rst,d[11],wdata,array_reg[11]);
pcreg uvw12 (clk,rst,d[12],wdata,array_reg[12]);
pcreg uvw13 (clk,rst,d[13],wdata,array_reg[13]);
pcreg uvw14 (clk,rst,d[14],wdata,array_reg[14]);
pcreg uvw15 (clk,rst,d[15],wdata,array_reg[15]);
pcreg uvw16 (clk,rst,d[16],wdata,array_reg[16]);
pcreg uvw17 (clk,rst,d[17],wdata,array_reg[17]);
pcreg uvw18 (clk,rst,d[18],wdata,array_reg[18]);
pcreg uvw19 (clk,rst,d[19],wdata,array_reg[19]);
pcreg uvw20 (clk,rst,d[20],wdata,array_reg[20]);
pcreg uvw21 (clk,rst,d[21],wdata,array_reg[21]);
pcreg uvw22 (clk,rst,d[22],wdata,array_reg[22]);
pcreg uvw23 (clk,rst,d[23],wdata,array_reg[23]);
pcreg uvw24 (clk,rst,d[24],wdata,array_reg[24]);
pcreg uvw25 (clk,rst,d[25],wdata,array_reg[25]);
pcreg uvw26 (clk,rst,d[26],wdata,array_reg[26]);
pcreg uvw27 (clk,rst,d[27],wdata,array_reg[27]);
pcreg uvw28 (clk,rst,d[28],wdata,array_reg[28]);
pcreg uvw29 (clk,rst,d[29],wdata,array_reg[29]);
pcreg uvw30 (clk,rst,d[30],wdata,array_reg[30]);
pcreg uvw31 (clk,rst,d[31],wdata,array_reg[31]);

assign a0=array_reg[0];
assign a1=array_reg[1];
assign a2=array_reg[2];
assign a3=array_reg[3];
assign a4=array_reg[4];
assign a5=array_reg[5];
assign a6=array_reg[6];
assign a7=array_reg[7];
assign a8=array_reg[8];
assign a9=array_reg[9];
assign a10=array_reg[10];
assign a11=array_reg[11];
assign a12=array_reg[12];
assign a13=array_reg[13];
assign a14=array_reg[14];
assign a15=array_reg[15];
assign a16=array_reg[16];
assign a17=array_reg[17];
assign a18=array_reg[18];
assign a19=array_reg[19];
assign a20=array_reg[20];
assign a21=array_reg[21];
assign a22=array_reg[22];
assign a23=array_reg[23];
assign a24=array_reg[24];
assign a25=array_reg[25];
assign a26=array_reg[26];
assign a27=array_reg[27];
assign a28=array_reg[28];
assign a29=array_reg[29];
assign a30=array_reg[30];
assign a31=array_reg[31];

selector321 la1 (array_reg[0],array_reg[1],array_reg[2],array_reg[3],array_reg[4],array_reg[5],array_reg[6],array_reg[7],array_reg[8],array_reg[9],array_reg[10],array_reg[11],array_reg[12],array_reg[13],array_reg[14],array_reg[15],array_reg[16],array_reg[17],array_reg[18],array_reg[19],array_reg[20],array_reg[21],array_reg[22],array_reg[23],array_reg[24],array_reg[25],array_reg[26],array_reg[27],array_reg[28],array_reg[29],array_reg[30],array_reg[31],raddr1[4],raddr1[3],raddr1[2],raddr1[1],raddr1[0],rdata1,1);
selector321 la2 (array_reg[0],array_reg[1],array_reg[2],array_reg[3],array_reg[4],array_reg[5],array_reg[6],array_reg[7],array_reg[8],array_reg[9],array_reg[10],array_reg[11],array_reg[12],array_reg[13],array_reg[14],array_reg[15],array_reg[16],array_reg[17],array_reg[18],array_reg[19],array_reg[20],array_reg[21],array_reg[22],array_reg[23],array_reg[24],array_reg[25],array_reg[26],array_reg[27],array_reg[28],array_reg[29],array_reg[30],array_reg[31],raddr2[4],raddr2[3],raddr2[2],raddr2[1],raddr2[0],rdata2,1);

endmodule

module decoder(iData,iEna,oData);//译码器，确定地址所对应的是哪个寄存器
input [4:0] iData;
input iEna;
output [31:0] oData;

assign oData=(iEna==1)?(1<<iData):32'hzzzzzzzz;

endmodule

module selector321(iC0,iC1,iC2,iC3,iC4,iC5,iC6,iC7,iC8,iC9,iC10,iC11,iC12,iC13,iC14,iC15,iC16,iC17,iC18,iC19,iC20,iC21,iC22,iC23,iC24,iC25,iC26,iC27,iC28,iC29,iC30,iC31,iS4,iS3,iS2,iS1,iS0,oZ,ena);
input [31:0] iC0,iC1,iC2,iC3,iC4,iC5,iC6,iC7,iC8,iC9,iC10,iC11,iC12,iC13,iC14,iC15,iC16,iC17,iC18,iC19,iC20,iC21,iC22,iC23,iC24,iC25,iC26,iC27,iC28,iC29,iC30,iC31;
input iS4,iS3,iS2,iS1,iS0,ena;
output [31:0] oZ;
reg [31:0] oZ;
//存储所选择的寄存器中的内容

always@(ena or iS4 or iS3 or iS2 or iS1 or iS0 or iC0 or iC1 or iC2 or iC3 or iC4 or iC5 or iC6 or iC7 or iC8 or iC9 or iC10 or iC11 or iC12 or iC13 or iC14 or iC15 or iC16 or iC17 or iC18 or iC19 or iC20 or iC21 or iC22 or iC23 or iC24 or iC25 or iC26 or iC27 or iC28 or iC29 or iC30 or iC31 )
begin
  if (ena==1) begin 
    case ({iS4,iS3,iS2,iS1,iS0})
      5'b00000:oZ=iC0;
      5'b00001:oZ=iC1;
      5'b00010:oZ=iC2;
      5'b00011:oZ=iC3;
      5'b00100:oZ=iC4;
      5'b00101:oZ=iC5;
      5'b00110:oZ=iC6;
      5'b00111:oZ=iC7;
      5'b01000:oZ=iC8;
      5'b01001:oZ=iC9;
      5'b01010:oZ=iC10;
      5'b01011:oZ=iC11;
      5'b01100:oZ=iC12;
      5'b01101:oZ=iC13;
      5'b01110:oZ=iC14;
      5'b01111:oZ=iC15;
      5'b10000:oZ=iC16;
      5'b10001:oZ=iC17;
      5'b10010:oZ=iC18;
      5'b10011:oZ=iC19;
      5'b10100:oZ=iC20;
      5'b10101:oZ=iC21;
      5'b10110:oZ=iC22;
      5'b10111:oZ=iC23;
      5'b11000:oZ=iC24;
      5'b11001:oZ=iC25;
      5'b11010:oZ=iC26;
      5'b11011:oZ=iC27;
      5'b11100:oZ=iC28;
      5'b11101:oZ=iC29;
      5'b11110:oZ=iC30;
      5'b11111:oZ=iC31;
    endcase
  end
end

endmodule
