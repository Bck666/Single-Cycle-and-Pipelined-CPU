`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/25 16:06:39
// Design Name: 
// Module Name: Hazard
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
module Hazard(
  input [4:0]IDRs,
   input [4:0]IDRt, 
   input IDBranch,
   input [1:0]PCSrc,
   input EXBranch, 
   input [4:0]EXRt, 
   input EXMemRead, 
   
   output PChazard,
   output [1:0]IFIDhazard, 
   output [1:0]IDEXhazard
    );
      assign PChazard = (EXBranch ||IDBranch || (EXMemRead && EXRt == IDRs) || (EXMemRead && EXRt == IDRt)) ? 1 : 0; // Keep PC
  
      // Flush IF/ID or Keep IF/ID 
      assign IFIDhazard = ((EXMemRead && EXRt == IDRs) || (EXMemRead && EXRt == IDRt)) ? 2'b10 : (PCSrc!=2'b00 || EXBranch || IDBranch) ? 2'b00 : 2'b01;
  
      assign IDEXhazard = ((EXMemRead && EXRt == IDRs) || (EXMemRead && EXRt == IDRt)) ? 2'b00 : 2'b01; // Flush ID/EX
    
endmodule
