`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/23 11:23:27
// Design Name: 
// Module Name: IDEX
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


module IDEX(
    input clk,
    input reset,
    input [1:0]condition,
	input Branchin            ,
	input RegWritein          ,
	input MemReadin           ,
	input MemWritein          ,
	input [2 -1:0] MemtoRegin ,
	input ALUSrc1in           ,
	input ALUSrc2in           ,
	input ExtOpin             ,
	input LuOpin              ,
	input [4 -1:0] ALUOpin,
	input [5 -1:0] ALUCtlin ,
    input Signin,
    input [32 -1:0] Read_data1in     , 
   input [32 -1:0] Read_data2in,
    input [32 -1:0]Ext_outin,
    input [32 -1:0]LU_outin,
    input [4:0]IDwritRs,
    input [32 -1:0]PC,
    input [4:0]shamt,
    input  [4:0]Rs,
    input  [4:0]Rt,
    input [4:0]Rd,
    
        output  reg Branchout            ,
        output  reg RegWriteout          ,
        output reg MemReadout           ,
        output  reg MemWriteout          ,
        output  reg[2 -1:0] MemtoRegout ,
        output  reg ALUSrc1out           ,
        output  reg ALUSrc2out           ,
        output  reg ExtOpout             ,
        output  reg LuOpout              ,
        output  reg [4 -1:0] ALUOpout,
        output  reg [5 -1:0] ALUCtlout ,
        output  reg Signout,
        output  reg[32 -1:0] Read_data1out     , 
        output  reg[32 -1:0] Read_data2out,
        output  reg[32 -1:0]Ext_outout,
        output  reg[32 -1:0]LU_outout,
        output  reg[4:0]IDwritRsout,
        output reg[32 -1:0]PCout,
        output reg [4:0]shamtout,
        output  reg[4:0]Rsout,
        output  reg[4:0]Rtout,
        output reg[4:0]Rdout
    );
       always @(posedge clk) begin
          if(reset==1)begin
          Branchout<=0            ;
          RegWriteout<=0          ;
          MemReadout <=0          ;
          MemWriteout <=0         ;
          MemtoRegout<=0 ;
          ALUSrc1out<=0           ;
          ALUSrc2out<=0           ;
          ExtOpout<=0             ;
          LuOpout<=0              ;
          ALUOpout<=0;
          ALUCtlout<=0 ;
          Signout<=0;
          Read_data1out<=0     ; 
          Read_data2out<=0;
          Ext_outout<=0;
          LU_outout<=0;
          IDwritRsout<=0;
          PCout<=0;
          shamtout<=0;
          Rsout<=0;
          Rtout<=0;
          Rdout<=0;
        
        end
       else if (condition==0)begin
Branchout<=0            ;
RegWriteout<=0          ;
MemReadout <=0          ;
MemWriteout <=0         ;
MemtoRegout<=0 ;
ALUSrc1out<=0           ;
ALUSrc2out<=0           ;
ExtOpout<=0             ;
LuOpout<=0              ;
ALUOpout<=0;
ALUCtlout<=0 ;
Signout<=0;
Read_data1out<=0     ; 
Read_data2out<=0;
Ext_outout<=0;
LU_outout<=0;
IDwritRsout<=0;
PCout<=0;
shamtout<=0;
Rsout<=0;
Rtout<=0;
Rdout<=0;
end
else if (condition==1)begin
Branchout<=Branchin           ;
RegWriteout<=RegWritein         ;
MemReadout <=MemReadin    ;
MemWriteout <=MemWritein     ;
MemtoRegout<=MemtoRegin ;
ALUSrc1out<=ALUSrc1in      ;
ALUSrc2out<=ALUSrc2in     ;
ExtOpout<=ExtOpin      ;
LuOpout<=LuOpin     ;
ALUOpout<=ALUOpin;
ALUCtlout<=ALUCtlin ;
Signout<=Signin;
Read_data1out<=Read_data1in     ; 
Read_data2out<=Read_data2in;
Ext_outout<=Ext_outin;
LU_outout<=LU_outin;
IDwritRsout<=IDwritRs;
PCout<=PC;
shamtout<=shamt;
Rsout<=Rs;
Rtout<=Rt;
Rdout<=Rd;
end
else if (condition==2)begin
Branchout<=Branchout           ;
RegWriteout<=RegWriteout          ;
MemReadout <=MemReadout        ;
MemWriteout <=MemWriteout       ;
MemtoRegout<=MemtoRegout ;
ALUSrc1out<=ALUSrc1out       ;
ALUSrc2out<=ALUSrc2out      ;
ExtOpout<=ExtOpout       ;
LuOpout<=LuOpout        ;
ALUOpout<=ALUOpout;
ALUCtlout<=ALUCtlout ;
Signout<=Signout;
Read_data1out<=Read_data1out     ; 
Read_data2out<=Read_data2out;
Ext_outout<=Ext_outout;
LU_outout<=LU_outout;
IDwritRsout<=IDwritRsout;
PCout<=PCout;
shamtout<=shamtout;
Rsout<=Rsout;
Rtout<=Rtout;
Rdout<=Rdout;
end
end
endmodule
