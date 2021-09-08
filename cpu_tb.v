`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/20 01:47:23
// Design Name: 
// Module Name: cpu_tb
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

module cpu_tb;

reg clk;
reg reset;
wire[31:0] inst;
wire[31:0] pc;

sccomp_dataflow uut(clk,reset,inst,pc);

integer file_output,file_output2;
integer counter=0;

initial begin
  //$readmemh("F:/vivado_project/MIPS_CPU/MIPS_CPU.srcs/sources_1/new/lout.txt",cpu_tb.uut.im.mem);
  file_output=$fopen("F:/vivado_project/MIPS_CPU/MIPS_CPU.srcs/sources_1/new/result.txt");
  clk=0;
  reset=1;
  #50;
  reset=0;
end

always begin
  #50;
  clk=~clk;
  //if (counter==1500) begin
    // $fclose(file_output);
  //end
  //else
  if (clk==1'b1) begin
       counter=counter+1;
       $fdisplay(file_output,"pc: %h",pc);  
       //$fdisplay(file_output,"NPC:%h",cpu_tb.uut.sccpu.D_NPC);
       $fdisplay(file_output,"instr: %h",inst);
       $fdisplay(file_output,"regfile0: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[0]);
       $fdisplay(file_output,"regfile1: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[1]);
       $fdisplay(file_output,"regfile2: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[2]);
       $fdisplay(file_output,"regfile3: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[3]);
       $fdisplay(file_output,"regfile4: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[4]);
       $fdisplay(file_output,"regfile5: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[5]);
       $fdisplay(file_output,"regfile6: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[6]);
       $fdisplay(file_output,"regfile7: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[7]);
       $fdisplay(file_output,"regfile8: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[8]);
       $fdisplay(file_output,"regfile9: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[9]);
       $fdisplay(file_output,"regfile10: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[10]);
       $fdisplay(file_output,"regfile11: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[11]);
       $fdisplay(file_output,"regfile12: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[12]);
       $fdisplay(file_output,"regfile13: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[13]);
       $fdisplay(file_output,"regfile14: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[14]);
       $fdisplay(file_output,"regfile15: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[15]);
       $fdisplay(file_output,"regfile16: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[16]);
       $fdisplay(file_output,"regfile17: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[17]);
       $fdisplay(file_output,"regfile18: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[18]);
       $fdisplay(file_output,"regfile19: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[19]);
       $fdisplay(file_output,"regfile20: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[20]);
       $fdisplay(file_output,"regfile21: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[21]);
       $fdisplay(file_output,"regfile22: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[22]);
       $fdisplay(file_output,"regfile23: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[23]);
       $fdisplay(file_output,"regfile24: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[24]);
       $fdisplay(file_output,"regfile25: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[25]);
       $fdisplay(file_output,"regfile26: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[26]);
       $fdisplay(file_output,"regfile27: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[27]);
       $fdisplay(file_output,"regfile28: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[28]);
       $fdisplay(file_output,"regfile29: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[29]);
       $fdisplay(file_output,"regfile30: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[30]);
       $fdisplay(file_output,"regfile31: %h",cpu_tb.uut.sccpu.cpu_ref.array_reg[31]);
     
      
      //$fdisplay(file_output,"INS:%b",cpu_tb.uut.sccpu.INS); 
      //$fdisplay(file_output,"RF_W:%b",cpu_tb.uut.sccpu.RF_W);/*
     // */
      //$fdisplay(file_output,"D_BING: %h",cpu_tb.uut.sccpu.D_BING);
     // $fdisplay(file_output,"D_PC: %h",cpu_tb.uut.sccpu.D_PC);
     // $fdisplay(file_output,"ALUC:%b",cpu_tb.uut.sccpu.ALUC);
     // $fdisplay(file_output,"D_ALU:%b",cpu_tb.uut.sccpu.D_ALU);

      /*
      $fdisplay(file_output,"Rsc:%b",cpu_tb.uut.sccpu.D_Rsc);
      $fdisplay(file_output,"Rtc:%b",cpu_tb.uut.sccpu.D_Rtc);
      $fdisplay(file_output,"Rdc:%b",cpu_tb.uut.sccpu.D_Rdc);*/
     // $fdisplay(file_output,"MUX1:%h",cpu_tb.uut.sccpu.D_Mux1);
      //$fdisplay(file_output,"MUX2:%b",cpu_tb.uut.sccpu.D_Mux2);
 
      
     // $fdisplay(file_output,"MUX3:%b",cpu_tb.uut.sccpu.D_Mux3);
     // $fdisplay(file_output,"MUX4:%b",cpu_tb.uut.sccpu.D_Mux4);
      
      /*
      $fdisplay(file_output,"MUX5:%b",cpu_tb.uut.sccpu.D_Mux5);*/
     // $fdisplay(file_output,"MUX6:%b",cpu_tb.uut.sccpu.D_Mux6);
     // $fdisplay(file_output,"MUX7:%b",cpu_tb.uut.sccpu.D_Mux8);
     // $fdisplay(file_output,"RF_W:%b",cpu_tb.uut.sccpu.RF_W);
      //$fdisplay(file_output,"M7:%b",cpu_tb.uut.sccpu.M7);
      
       
     // $fdisplay(file_output,"M2:%b",cpu_tb.uut.sccpu.M1);
      /*
      $fdisplay(file_output,"M3:%b",cpu_tb.uut.sccpu.M3);
      $fdisplay(file_output,"M4:%b",cpu_tb.uut.sccpu.M4);*/
      //$fdisplay(file_output,"M5:%b",cpu_tb.uut.sccpu.M5);
     // $fdisplay(file_output,"Z:%b",cpu_tb.uut.sccpu.cpu_alu.z);
     
     /*
      $fdisplay(file_output,"M6:%b",cpu_tb.uut.sccpu.M6);
      $fdisplay(file_output,"INS:%b",cpu_tb.uut.sccpu.INS);
      $fdisplay(file_output,"RF_W:%b",cpu_tb.uut.sccpu.RF_W);*/
     // $fdisplay(file_output,"Rdc:%b",cpu_tb.uut.sccpu.D_Rdc);
      //$fdisplay(file_output,"Mux7:%h",cpu_tb.uut.sccpu.D_Mux7);
      //$fdisplay(file_output,"M7:%b",cpu_tb.uut.sccpu.M7);
      
     // $fdisplay(file_output,"M8:%b",cpu_tb.uut.sccpu.M8);
      //$fdisplay(file_output,"EXT16:%b",cpu_tb.uut.sccpu.D_EXT16);
      
     // $fdisplay(file_output,"Rs:%b",cpu_tb.uut.sccpu.D_Rs);
     /*
      $fdisplay(file_output,"Rt:%b",cpu_tb.uut.sccpu.D_Rt);
      $fdisplay(file_output,"RF_CLK:%b",cpu_tb.uut.sccpu.RF_CLK);
      $fdisplay(file_output,"PC_CLK:%b",cpu_tb.uut.sccpu.PC_CLK);
      $fdisplay(file_output,"clk:%b",cpu_tb.uut.sccpu.cpu_ref.uvw1.clk);
      $fdisplay(file_output,"rst:%b",cpu_tb.uut.sccpu.cpu_ref.uvw1.rst);
      $fdisplay(file_output,"reset:%b",cpu_tb.uut.sccpu.reset); 
      $fdisplay(file_output,"d[1]:%b",cpu_tb.uut.sccpu.cpu_ref.uvw1.ena);
      $fdisplay(file_output,"PC_ENA:%b",cpu_tb.uut.sccpu.PC_ENA); 
      $fdisplay(file_output,"PC:%b",cpu_tb.uut.sccpu.D_PC); *//*
      $fdisplay(file_output,"Rsc:%b",cpu_tb.uut.sccpu.D_Rsc);
      $fdisplay(file_output,"Rdc:%b",cpu_tb.uut.sccpu.D_Rdc);
      $fdisplay(file_output,"Rtc:%b",cpu_tb.uut.sccpu.D_Rtc);
      $fdisplay(file_output,"D_Rt:%b",cpu_tb.uut.sccpu.D_Rt);
      $fdisplay(file_output,"S_EXT16:%b",cpu_tb.uut.sccpu.D_S_EXT16);
      $fdisplay(file_output,"rdata:%b",cpu_tb.uut.dm.rdata);
      $fdisplay(file_output,"wdata:%b",cpu_tb.uut.sccpu.wdata);
      $fdisplay(file_output,"addr:%b",cpu_tb.uut.dm.addr);
      $fdisplay(file_output,"cs:%b",cpu_tb.uut.dm.cs);
      $fdisplay(file_output,"r:%b",cpu_tb.uut.dm.r);
      $fdisplay(file_output,"w:%b",cpu_tb.uut.dm.w);
      $fdisplay(file_output,"mem[4]:%b",cpu_tb.uut.dm.mem[4]);
      $fdisplay(file_output,"mem[8]:%b",cpu_tb.uut.dm.mem[8]);*/
  end
end

endmodule
         


