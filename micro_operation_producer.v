`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 10:37:35
// Design Name: 
// Module Name: micro_operation_producer
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


module micro_operation_producer(
input clk,
input z,
input [31:0] instruction_code,
input [31:0] instruction_type,
output PC_CLK,    
output IM_R,     
output M1,       
output M2,        
output M3,        
output [1:0]M4,            
output [1:0]M6,  
output M7,
output M8,      
output [3:0]ALUC,
output RF_W,     
output RF_CLK,   
output DM_W,   
output DM_R,     
output DM_CS,
output [4:0]Rsc,
output [4:0]Rtc,
output [4:0]Rdc,
output B1,
output B2
);
//微操作序列产生部件，根据指令类型，通过组合逻辑电路生成控制信号

assign PC_CLK=clk;
assign IM_R=1;//IM_R=1
assign M1=~(instruction_type[16]|instruction_type[29]|instruction_type[30]);//M1=~(jr+j+jal)
assign M2=~instruction_type[23];//M2=~lw
assign M3=~(instruction_type[10]|instruction_type[11]|instruction_type[12]);//M3=~(sll+srl+sra)
assign M4[0]=instruction_type[17]|instruction_type[18]|instruction_type[27]|instruction_type[28]|instruction_type[23]|instruction_type[24];//M4_1=addiu+addi+slti+sltiu+lw+sw
assign M4[1]=instruction_type[19]|instruction_type[20]|instruction_type[21]|instruction_type[22];//M4_2=ori+xori+andi+lui
assign M6[0]=~(instruction_type[17]|instruction_type[18]|instruction_type[19]|instruction_type[20]|instruction_type[21]|instruction_type[22]|instruction_type[23]|instruction_type[27]|instruction_type[28]|instruction_type[30]);//M6_1=~addi+addiu+andi+ori+xori+lw+slti+sltiu+lui
assign M6[1]=instruction_type[30];//M6_2=jal
assign M7=instruction_type[30];//M7=jal
assign M8=instruction_type[16];//M8=jr
assign RF_W=~(instruction_type[16]|instruction_type[24]|instruction_type[25]|instruction_type[26]|instruction_type[29]);//RF_W=~(jr+sw+beq+bne+j)
assign RF_CLK=clk;//(~(instruction_type[16]|instruction_type[24]|instruction_type[25]|instruction_type[26]|instruction_type[29]))&clk;//RF_CLK=~(jr+sw+beq+bne+j)clk
assign ALUC[0]=instruction_type[2]|instruction_type[3]|instruction_type[5]|instruction_type[7]|instruction_type[8]|instruction_type[11]|instruction_type[14]|instruction_type[20]|instruction_type[25]|instruction_type[26]|instruction_type[27];//A0=sub+subu+or+nor+slt+srl+srlv+ori+beq+bne+slti
assign ALUC[1]=instruction_type[0]|instruction_type[2]|instruction_type[6]|instruction_type[7]|instruction_type[8]|instruction_type[9]|instruction_type[10]|instruction_type[13]|instruction_type[17]|instruction_type[21]|instruction_type[27]|instruction_type[28];//A1=add+sub+xor+nor+slt+sltu+sll+sllv+addi+slti+sltiu+xori+sll
assign ALUC[2]=instruction_type[4]|instruction_type[5]|instruction_type[6]|instruction_type[7]|instruction_type[10]|instruction_type[11]|instruction_type[12]|instruction_type[13]|instruction_type[14]|instruction_type[15]|instruction_type[19]|instruction_type[20]|instruction_type[21];//A2=and+or+xor+nor+sll+srl+sra+sllv+srlv+srav+andi+ori+xori
assign ALUC[3]=instruction_type[8]|instruction_type[9]|instruction_type[10]|instruction_type[11]|instruction_type[12]|instruction_type[13]|instruction_type[14]|instruction_type[15]|instruction_type[22]|instruction_type[27]|instruction_type[28];//A3=slt+sltu+sll+srl+sra+sllv+srlv+srav+slti+sltiu+lui
assign DM_W=instruction_type[24];//DM_w=sw
assign DM_R=instruction_type[23];//DM_r=lw
assign DM_CS=instruction_type[23]|instruction_type[24];//DM_cs=lw+sw
assign Rsc=instruction_code[25:21];
assign Rtc=instruction_code[20:16];
assign Rdc=(instruction_type[17]|instruction_type[18]|instruction_type[19]|instruction_type[20]|instruction_type[21]|instruction_type[22]|instruction_type[27]|instruction_type[28])?instruction_code[20:16]:instruction_code[15:11];
assign B1=instruction_type[25];
assign B2=instruction_type[26];
endmodule
