`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/22 23:52:22
// Design Name: 
// Module Name: pipelinecpu
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


module pipelinecpu(
clk, reset,digi
    );
    input clk;
    input reset;
    wire [31:0] BCD_Read_data;
    output wire [11:0] digi;
    wire  [31 :0] PCin;
    wire [31 :0] PCnow;
    wire [31 :0] PCplus4;
    assign PCplus4 = PCnow + 32'd4;
    wire [31 :0] IFinstruction;
    wire PChazard;
    wire [2 -1:0] IFIDconditon;
    
    wire [31 :0]IDinstruction;
    wire [31 :0]IDPC;    
    wire [2 -1:0] IDRegDst    ;
    wire [2 -1:0] IDPCSrc     ;
    wire          IDBranch    ;
    wire          IDMemRead   ;
    wire          IDMemWrite  ;
    wire [2 -1:0] IDMemtoReg  ;
    wire          IDALUSrc1   ;
    wire          IDALUSrc2   ;
    wire [5 -1:0] IDALUOp     ;
    wire          IDExtOp     ;
    wire          IDLuOp      ;
    wire          IDRegWrite  ;
    wire [32 -1:0] Jump_target;
    wire [32 -1:0] Branch_target;
    
    wire [2 -1:0] EXPCSrc     ;
    wire EXBranch             ;
    wire EXRegWrite           ;
    wire [2 -1:0] EXRegDst    ;
    wire EXMemRead            ;
    wire EXMemWrite           ;
    wire [2 -1:0] EXMemtoReg  ;
    wire EXALUSrc1            ;
    wire EXALUSrc2            ;
    wire EXExtOp              ;
    wire EXLuOp               ;
    wire [5 -1:0] EXALUOp ;
    wire [5 -1:0] EXALUCtl ;
    wire EXSign ;
    wire [32 -1:0] EXRead_data1      ;
    wire [32 -1:0] EXRead_data2 ;
    wire [32 -1:0] EXExt_out ;
    wire [32 -1:0] EXLU_out ;
    wire [4:0] EXIDwritRs;
    wire [31:0]EXPC;
    wire [32 -1:0]EXALUresult;
    wire [32 -1:0]EXALU1 ;
    wire [32 -1:0]EXALU2 ;
    wire EXzero;
    wire [4:0]EXRt;
    wire [4:0]EXRd;
    wire [4:0]EXRs;
    wire [32 -1:0] IDExt_out;
    wire [32 -1:0] IDLU_out;

	// ALU Control
    wire [5 -1:0] IDALUCtl;
    wire          IDSign  ; 
	// Register File
    wire [32 -1:0] Databus1;
    wire [32 -1:0] Databus2; 
    wire [32 -1:0] Databus3;
    wire [5  -1:0] Write_register;
    wire [1:0]IDEXcondition;
    //EX
    wire [1:0]EXMEMcondition;
    assign EXMEMcondition=2'b01;
    wire [1:0]MEMmemtoreg;
    wire MEMmemwrite;
    wire MEMmenread;
    wire MEMregwrite;
    wire [31:0]MEMALUresult;
    wire [31:0]MEMReaddata2;
    wire [4:0]MEMRegwriteaddress;
    wire [31:0]MEMPC;
    
    //MEM
    wire Memory_Read;
    wire Memory_Write;
    wire [32 -1:0]MemBus_Address;
    wire [32 -1:0]MemBus_Write_Data;
    wire [32 -1:0]MemBus_Read_Data;
    wire [32 -1:0]Memory_Read_Data;
    
    //WB
    wire [1:0]MEMWBcondition;
    assign MEMWBcondition=2'b01;
    wire [1:0]WBMemToReg;
    wire WBRegWr;
    wire [31:0]WBPC;
    wire [31:0]WBReadData;
    wire [31:0]WBALUOut;
    wire [4:0]WBRegWriteAddr;
    wire [31:0]WBRegWriteData ;
    
    
    
    
    
    //IF
    wire branchyn;
    assign branchyn=(EXBranch & EXzero);
    PC PC1(clk,reset,PChazard,branchyn,PCin,PCnow); 
    assign Jump_target = {IDPC[31:28], IDinstruction[25:0], 2'b00};
    assign Branch_target = branchyn? EXPC + {EXLU_out[29:0], 2'b00}: PCplus4;
	assign PCin = (IDPCSrc == 2'b00)? Branch_target: (IDPCSrc == 2'b01)? Jump_target: Databus1;
    InstructionMemory instruction_memory1(
            .Address        (PCnow             ), 
            .Instruction    (IFinstruction    )
        );
    IFID IFID1(clk,reset,IFinstruction,PCplus4,IFIDconditon,IDinstruction,IDPC);
    //Hazard
    Hazard Hazard1(IDinstruction[25:21],IDinstruction[20:16],IDBranch,IDPCSrc,EXBranch,EXRt,EXMemRead,
    PChazard,IFIDconditon,IDEXcondition);
    //ID
    Control control1(
           .OpCode     (IDinstruction[31:26] ), 
           .Funct      (IDinstruction[5 : 0] ),
           .PCSrc      (IDPCSrc              ), 
           .Branch     (IDBranch             ), 
           .RegWrite   (IDRegWrite           ), 
           .RegDst     (IDRegDst             ), 
           .MemRead    (IDMemRead            ),    
           .MemWrite   (IDMemWrite           ), 
           .MemtoReg   (IDMemtoReg           ),
           .ALUSrc1    (IDALUSrc1            ), 
           .ALUSrc2    (IDALUSrc2            ), 
           .ExtOp      (IDExtOp              ), 
           .LuOp       (IDLuOp               ),    
           .ALUOp      (IDALUOp              )
       );
	ALUControl alu_control1(
           .ALUOp  (IDALUOp              ), 
           .Funct  (IDinstruction[5:0]   ), 
           .ALUCtl (IDALUCtl             ), 
           .Sign   (IDSign               )
       );

	RegisterFile register_file1(
           .reset          (reset              ), 
           .clk            (clk                ),
           .RegWrite       (WBRegWr      ), 
           .Read_register1 (IDinstruction[25:21] ), 
           .Read_register2 (IDinstruction[20:16] ), 
           .Write_register (WBRegWriteAddr    ),
           .Write_data     (WBRegWriteData ), 
           .Read_data1     (Databus1           ), 
           .Read_data2     (Databus2           )
       );
    wire [4:0]IDshamt;
    wire [4:0]EXshamt;
    assign IDshamt=IDinstruction[10:6];
    assign IDExt_out = { IDExtOp? {16{IDinstruction[15]}}: 16'h0000, IDinstruction[15:0]};       

    assign IDLU_out = IDLuOp? {IDinstruction[15:0], 16'h0000}: IDExt_out;
    assign Write_register = (IDRegDst == 2'b00)? IDinstruction[20:16]: (IDRegDst == 2'b01)? IDinstruction[15:11]: 5'b11111;
    IDEX IDEX1(
    clk,reset,IDEXcondition,IDBranch,IDRegWrite,IDMemRead,IDMemWrite,IDMemtoReg,
    IDALUSrc1,IDALUSrc2,IDExtOp ,IDLuOp,IDALUOp,IDALUCtl,IDSign,Databus1,Databus2,
    IDExt_out,IDLU_out,Write_register, IDPC,IDshamt,IDinstruction[25:21],IDinstruction[20:16],IDinstruction[15:11],
    EXBranch,EXRegWrite,EXMemRead,
    EXMemWrite,EXMemtoReg, EXALUSrc1,EXALUSrc2,EXExtOp,EXLuOp,EXALUOp,EXALUCtl,     
    EXSign ,EXRead_data1,EXRead_data2,EXExt_out ,EXLU_out ,EXIDwritRs,EXPC,EXshamt,EXRs,EXRt,EXRd
    );

    


//forwarding
 wire [1:0]Forward_A; 
   wire [1:0]Forward_B;
   wire [31:0]EXALUAData; 
   wire [31:0]EXALUBData;
 forwarding forwarding1(.EXRs(EXRs), .EXRt(EXRt), .MEMRegWr(MEMregwrite), .MEMRegWriteAddr(MEMRegwriteaddress), 
                                .WBRegWr(WBRegWr), .WBRegWriteAddr(WBRegWriteAddr), .ForwardA(Forward_A), .ForwardB(Forward_B));

   assign EXALUAData = (Forward_A == 2'b10) ? WBRegWriteData : (Forward_A == 2'b01) ?MEMALUresult : EXRead_data1;
   assign EXALUBData = (Forward_B == 2'b10) ? WBRegWriteData : (Forward_B == 2'b01) ? MEMALUresult : EXRead_data2;
//EX


assign EXALU1 = EXALUSrc1? {27'h00000, EXshamt}: EXALUAData;
assign EXALU2 = EXALUSrc2? EXLU_out: EXALUBData;

ALU ALU1(
EXALU1 , 
EXALU2 ,
EXALUCtl,
EXSign,
EXALUresult,
EXzero
);
EXMEM EXMEM1(clk,reset,EXMEMcondition,EXMemtoReg,EXMemWrite ,EXMemRead,EXRegWrite ,EXALUresult, EXALUBData,EXIDwritRs,EXPC,
MEMmemtoreg, MEMmemwrite,MEMmenread,MEMregwrite,MEMALUresult, MEMReaddata2,MEMRegwriteaddress,MEMPC);
//MEM

    assign Memory_Read          = MEMmenread ;
	assign Memory_Write         = MEMmemwrite&&MEMALUresult!=32'h40000010;
	assign MemBus_Address       = MEMALUresult ;
	assign MemBus_Write_Data    = MEMReaddata2;
	assign MemBus_Read_Data     = Memory_Read_Data;
DataMemory data_memory1(
            .reset      (reset              ), 
            .clk        (clk                ), 
            .Address    (MemBus_Address     ), 
            .Write_data (MemBus_Write_Data  ), 
            .Read_data  (Memory_Read_Data   ), 
            .MemRead    (Memory_Read        ), 
            .MemWrite   (Memory_Write       )
        );

 MEMWB  MEMWB1(clk,MEMWBcondition,MEMmemtoreg,MEMregwrite,MEMPC,MemBus_Read_Data,MEMALUresult,MEMRegwriteaddress,
 WBMemToReg,WBRegWr,WBPC,WBReadData,WBALUOut,WBRegWriteAddr
 );

 BCD BCD1(reset, clk,MemBus_Address,MemBus_Write_Data, MEMmemwrite,Memory_Read,BCD_Read_data,digi);
     assign WBRegWriteData = (WBMemToReg == 2'b00) ? WBALUOut : (WBMemToReg == 2'b01) ?WBReadData : WBPC;

endmodule
