`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/25 16:50:40
// Design Name: 
// Module Name: forwarding
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


module forwarding(
 input [4:0]EXRs,
   input [4:0]EXRt, 
   input MEMRegWr,
   input [4:0]MEMRegWriteAddr, 
   input WBRegWr,
   input [4:0]WBRegWriteAddr, 
   
   output [1:0]ForwardA,
   output [1:0]ForwardB
    );
     assign ForwardA = (MEMRegWr && (MEMRegWriteAddr != 5'd0) && (MEMRegWriteAddr == EXRs)) ? 2'b01 : 
       (WBRegWr && (WBRegWriteAddr != 5'd0)) && ((WBRegWriteAddr == EXRs) && (MEMRegWriteAddr != EXRs || ~MEMRegWr)) ? 2'b10 : 2'b00; 
   
       assign ForwardB = (MEMRegWr && (MEMRegWriteAddr != 5'd0) && (MEMRegWriteAddr == EXRt)) ? 2'b01 : 
       (WBRegWr && (WBRegWriteAddr != 5'd0)) && ((WBRegWriteAddr == EXRt) && (MEMRegWriteAddr != EXRt || ~MEMRegWr)) ? 2'b10 : 2'b00;
endmodule
