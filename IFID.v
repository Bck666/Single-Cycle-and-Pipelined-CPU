`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/23 00:34:56
// Design Name: 
// Module Name: IFID
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


module IFID(
clk,reset,instructionin,PCplus4in,condition,instructionout,PCplus4out
    );
    input clk;
    input reset;
    input [31:0]instructionin;
    input [31:0]PCplus4in;
    input [1:0]condition;
    output reg[31:0]instructionout;
    output reg[31:0]PCplus4out;
always@(posedge clk) begin
if(reset==1)begin
instructionout<= 32'h00000000;
PCplus4out<= 32'h00000000;
 end 
 else if (condition==0) begin
instructionout<= 32'h00000000;
PCplus4out<= 32'h00000000;
end
else if (condition==1) begin
instructionout<=instructionin;
PCplus4out<=PCplus4in;
end 
else if (condition==2) begin
instructionout<=instructionout;
PCplus4out<=PCplus4out;
end

end
endmodule
