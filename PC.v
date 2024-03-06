`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/22 23:38:42
// Design Name: 
// Module Name: PC
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

module PC(
    input clk,
    input reset,
    input PChazard,
    input branchyn,
    input [31:0] PCin,
    output reg [31:0] PCnow1
);

  always @(posedge clk) begin
    if (reset == 1)
      PCnow1 <= 32'h00000000; 
    else if (PChazard == 1&&branchyn==0)
      PCnow1 <= PCnow1;
    else
     PCnow1 <= PCin;  
  end

endmodule

