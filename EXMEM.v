`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/23 17:14:08
// Design Name: 
// Module Name: EXMEM
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


module EXMEM(
input clk, 
input reset,
input [1:0]condition, 
input [1:0]memtoreg,
input memwrite,
input menread,
input regwrite,
input [31:0]ALUresult,
input [31:0]Readdata2,
input [4:0]Regwriteaddress,
input [31:0]PCin,

output reg [1:0]memtoregout,
output reg memwriteout,
output reg menreadout,
output reg regwriteout,
output reg [31:0]ALUresultout,
output reg [31:0]Readdata2out,
output reg [4:0]Regwriteaddressout,
output reg[31:0]PCout

    );
always @(posedge clk) begin
   if(reset==1)begin
memtoregout<=0; 
   memwriteout<=0;  
   menreadout <=0; 
   regwriteout <=0; 
   ALUresultout <=0; 
   Readdata2out <=0; 
   Regwriteaddressout<=0; 
   PCout<=0;
 end
else if(condition==0)begin
memtoregout<=0; 
memwriteout<=0;  
menreadout <=0; 
regwriteout <=0; 
ALUresultout <=0; 
Readdata2out <=0; 
Regwriteaddressout<=0; 
PCout<=0;
end
else if(condition==1)begin
memtoregout<=memtoreg; 
memwriteout<=memwrite;  
menreadout <=menread; 
regwriteout <=regwrite; 
ALUresultout <=ALUresult; 
Readdata2out <=Readdata2; 
Regwriteaddressout<=Regwriteaddress; 
PCout<=PCin;
end
else if (condition==2)begin
memtoregout<=memtoregout; 
memwriteout<=memwriteout;  
menreadout <=menreadout; 
regwriteout <=regwriteout; 
ALUresultout <=ALUresultout; 
Readdata2out <=Readdata2out; 
Regwriteaddressout<=Regwriteaddressout; 
PCout<=PCout;
end
end
        
        
endmodule
