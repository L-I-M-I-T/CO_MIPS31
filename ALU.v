`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:16:39
// Design Name: 
// Module Name: ALU
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

/*
module alu(
input [31:0]a,        
input [31:0]b,       
input [3:0]aluc,  
output [31:0]r,
output z,
output c,
output n,
output o
);
 
reg signed [32:0] r1;
reg [32:0] r2;
wire signed [31:0] ta;
wire signed [31:0] tb;
//��Ϊ��ALU,r1�ݴ���������r2������������ж��Ƿ������ta��tb��a��bת��Ϊ�з��������ڽ����з���������
 
assign ta=a;
assign tb=b;

always@ (aluc,a,b) 
begin
  casez(aluc)
    4'b0000:begin r1=a+b;r2={ta[31],ta}+{tb[31],tb};end//ADDU�����������ʹ��˫����λ�����ж����
    4'b0010:begin r1=ta+tb;end//ADD
    4'b0001:begin r1=a-b;r2={ta[31],ta}-{tb[31],tb};end//SUBU�����������ʹ��˫����λ�����ж����
    4'b0011:begin r1=ta-tb;end//SUB
    4'b0100:begin r1=a&b;end//AND
    4'b0101:begin r1=a|b;end//OR
    4'b0110:begin r1=a^b;end//XOR
    4'b0111:begin r1=~(a|b);end//NOR
    4'b100?:begin r1={b[15:0],16'b0};end//LUI
    4'b1011:begin r1=(ta<tb)?1:0;end//SLT
    4'b1010:begin r1=(a<b)?1:0;end//SLTU
    4'b1100:begin if(a==0) {r1[31:0],r2[32]}={b,1'b0};else {r1[31:0],r2[32]}=tb>>>(a-1);end//SRA����������и���һλʵ�ּ�¼����Ƴ�ȥ��һλ
    4'b111?:begin r1=b<<a;end//SLL/SLR
    4'b1101:begin if(a==0) {r1[31:0],r2[32]}={b,1'b0};else {r1[31:0],r2[32]}=b>>(a-1);end//SRL����������и���һλʵ�ּ�¼����Ƴ�ȥ��һλ
    default:;
  endcase
end

assign r=(r1[31]==0)?r1:({r1[31],~r1[30:0]}+1);
assign c=(aluc==4'b0000|aluc==4'b0001|aluc==4'b1010|aluc==4'b1100|aluc==4'b1101|aluc==4'b1111|aluc==4'b1110)?r2[32]:1'b0;//�޷������ӷ����㷢��������޷�������������������޷������Ƚ�����a-b<0ʱ�ñ�־λΪ1����λ����ñ�־λΪ���һ�α��Ƴ���λ����ֵ��
assign z=(c==32'b0)?1:0;//z=1��ʾ������Ϊ0,z=0��ʾ��������Ϊ0�����������Ӱ��˱�־λ��
assign n=r[31];//�з��������㣬�������ͽ�����ö����Ʋ������ʽ��ʾ��n=1��ʾ���Ϊ������n=0��ʾ���Ϊ�������㡣�����������ս��r[31]Ϊ1��nΪ1��
assign o=(aluc==4'b0010|aluc==4'b0011)?(r2[32]^r2[31]):1'b0;//�����з��żӼ������㣬�����������������ö����Ʋ������ʽ��ʾ�������ʱ�ñ�־λo=1��

endmodule*/

module alu(
input [31:0]a,        
input [31:0]b,       
input [3:0]aluc,  
output [31:0]r,
output z,
output c,
output n,
output o
);
 
reg [32:0] r1;
//��Ϊ��ALU,r1�ݴ���������r2������������ж��Ƿ������ta��tb��a��bת��Ϊ�з��������ڽ����з���������
 
wire signed [31:0] ta;
wire signed [31:0] tb;
assign ta=a;
assign tb=b;

always@ (aluc or a or b) 
begin
  casez(aluc)
    4'b0000:begin r1=a+b;end//ADDU�����������ʹ��˫����λ�����ж����
    4'b0010:begin r1={a[31],a}+{b[31],b};end//ADD
    4'b0001:begin r1=a-b;end//SUBU�����������ʹ��˫����λ�����ж����
    4'b0011:begin r1={a[31],a}-{b[31],b};end//SUB
    4'b0100:begin r1=a&b;end//AND
    4'b0101:begin r1=a|b;end//OR
    4'b0110:begin r1=a^b;end//XOR
    4'b0111:begin r1=~(a|b);end//NOR
    4'b100?:begin r1={b[15:0],16'b0};end//LUI
    4'b1011:begin r1=(ta<tb)?1:0;end//SLT
    4'b1010:begin r1=(a<b)?1:0;end//SLTU
    4'b1100:begin if(a==0) {r1[31:0],r1[32]}={b,1'b0};else {r1[31:0],r1[32]}=tb>>>(ta-1);end//SRA����������и���һλʵ�ּ�¼����Ƴ�ȥ��һλ
    4'b111?:begin r1=b<<a;end//SLL/SLR
    4'b1101:begin if(a==0) {r1[31:0],r1[32]}={b,1'b0};else {r1[31:0],r1[32]}=b>>(a-1);end//SRL����������и���һλʵ�ּ�¼����Ƴ�ȥ��һλ
    default:;
  endcase
end

assign r=r1[31:0];
assign c=(aluc==4'b0000|aluc==4'b0001|aluc==4'b1010|aluc==4'b1100|aluc==4'b1101|aluc==4'b1111|aluc==4'b1110)?r1[32]:1'b0;//�޷������ӷ����㷢��������޷�������������������޷������Ƚ�����a-b<0ʱ�ñ�־λΪ1����λ����ñ�־λΪ���һ�α��Ƴ���λ����ֵ��
assign z=(r1==32'b0)?1:0;//z=1��ʾ������Ϊ0,z=0��ʾ��������Ϊ0�����������Ӱ��˱�־λ��
assign n=r[31];//�з��������㣬�������ͽ�����ö����Ʋ������ʽ��ʾ��n=1��ʾ���Ϊ������n=0��ʾ���Ϊ�������㡣�����������ս��r[31]Ϊ1��nΪ1��
assign o=(aluc==4'b0010|aluc==4'b0011)?(r1[32]^r1[31]):1'b0;//�����з��żӼ������㣬�����������������ö����Ʋ������ʽ��ʾ�������ʱ�ñ�־λo=1��

endmodule

