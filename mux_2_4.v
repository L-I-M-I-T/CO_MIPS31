`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 19:35:55
// Design Name: 
// Module Name: mux_2_4
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


module mux_2_4(
input [31:0] a,
input [31:0] b,
input [31:0] c,
input [1:0] m,
output reg [31:0] e
);

always @(m or a or b or c)
begin
  case (m)//2-4Â·Ñ¡ÔñÆ÷
    2'b00:e<=a;
    2'b01:e<=b;
    2'b10:e<=c;
  endcase
end

endmodule
