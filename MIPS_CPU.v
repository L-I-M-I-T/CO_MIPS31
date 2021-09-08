`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 21:02:26
// Design Name: 
// Module Name: MIPS_CPU
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


module cpu(
input clk,
input reset,
input [31:0]instruction,
input [31:0]rdata,
output [31:0]pc,
output [31:0]addr,
output [31:0]wdata,
output IM_R,
output DM_CS,
output DM_R,
output DM_W
);

wire PC_CLK,PC_ENA,M1,M2,M3,M5,M7,M8,RF_W,RF_CLK,B1,B2;
wire [1:0] M4;
wire [1:0] M6;
wire [3:0] ALUC;
wire z,c,n,o,a;
wire [31:0] INS;
wire [31:0] D_ALU;
wire [31:0] D_PC;
wire [31:0] D_NPC;
wire [31:0] D_RF;
wire [31:0] D_Rs;
wire [31:0] D_Rt;
wire [31:0] D_IM;
wire [31:0] D_DM;
wire [31:0] D_Mux1;
wire [31:0] D_Mux2;
wire [31:0] D_Mux3;
wire [31:0] D_Mux4;
wire [31:0] D_Mux5;
wire [4:0] D_Mux6;
wire [31:0] D_Mux7;
wire [31:0] D_Mux8;
wire [31:0] D_EXT5;
wire [31:0] D_EXT16;
wire [31:0] D_S_EXT16;
wire [31:0] D_EXT18;
wire [31:0] D_ADD;
wire [31:0] D_ADD8;
wire [31:0] D_ADD4;
wire [31:0] D_BING;
wire [4:0] D_Rsc;
wire [4:0] D_Rtc;
wire [4:0] D_Rdc;

assign PC_ENA = 1;
assign pc=D_PC;
assign addr=D_ALU;
assign wdata=D_Rt;

instruction_decoder cpu_ins(instruction,INS);
micro_operation_producer cpu_opcode(clk,z,instruction,INS,PC_CLK,IM_R,M1,M2,M3,M4,M6,M7,M8,ALUC,RF_W,RF_CLK,DM_W,DM_R,DM_CS,D_Rsc,D_Rtc,D_Rdc,B1,B2);
pcreg2 pc_out(PC_CLK,reset,PC_ENA,D_Mux1,D_PC);
alu cpu_alu(D_Mux3,D_Mux4,ALUC[3:0],D_ALU,z,c,n,o);
regfile cpu_ref(RF_CLK,reset,RF_W,D_Rtc,D_Rsc,D_Mux6,D_Mux7,D_Rt,D_Rs);
mux_1_2 cpu_mux1(D_Mux8,D_Mux5,M1,D_Mux1);
mux_1_2 cpu_mux2(rdata,D_ALU,M2,D_Mux2);
mux_1_2 cpu_mux3(D_EXT5,D_Rs,M3,D_Mux3);
mux_2_4 cpu_mux4(D_Rt,D_S_EXT16,D_EXT16,M4,D_Mux4);
selector sel(B1,B2,cpu_alu.z,M5);
mux_1_2 cpu_mux5(D_NPC,D_ADD,M5,D_Mux5);
mux_2_4 cpu_mux6(D_Rtc,D_Rdc,5'b11111,M6,D_Mux6);
mux_1_2 cpu_mux7(D_Mux2,D_ADD8,M7,D_Mux7);
mux_1_2 cpu_mux8(D_BING,D_Rs,M8,D_Mux8);
ext5 cpu_ext5(instruction[10:6],D_EXT5);
ext16 cpu_ext16(instruction[15:0],D_EXT16);
s_ext16 cpu_s_ext16(instruction[15:0],D_S_EXT16);
ext18 cpu_ext18(instruction[15:0],D_EXT18);
add cpu_add(D_EXT18,D_NPC,D_ADD,ao);
add8 cpu_add8(D_PC,D_ADD8);
add4 cpu_npc(D_PC,D_NPC);
bing cpu_bing(D_PC[31:28],instruction[25:0],D_BING);

endmodule


module selector(
input b1,
input b2,
input z,
output o
);

assign o=(b1&(~b2)&z)|((~b1)&b2&(~z));

endmodule
