
module MEMWB(    
input clk,
input [1:0]condition,
input [1:0]EXMEM_MemToReg, 
input EXMEM_RegWr, 
input [31:0]EXMEM_PC_plus_4,
input [31:0]EXMEM_ReadData,
input [31:0]EXMEM_ALUOut,
input [4:0]EXMEM_RegWriteAddr,
                      
output reg [1:0]MEMWB_MemToReg,
output reg MEMWB_RegWr,
output reg [31:0]MEMWB_PC_plus_4,
output reg [31:0]MEMWB_ReadData,
output reg [31:0]MEMWB_ALUOut,
output reg [4:0]MEMWB_RegWriteAddr
             );
    


    always@(posedge clk) begin

        if(condition==0) begin            
            MEMWB_MemToReg <= 0; 
            MEMWB_RegWr <= 0;
            MEMWB_PC_plus_4  <= 0; 
            MEMWB_ReadData <= 0;
            MEMWB_ALUOut <= 0; 
            MEMWB_RegWriteAddr <= 0;           
        end

        else if(condition==1)begin
            MEMWB_MemToReg <= EXMEM_MemToReg; 
            MEMWB_RegWr <= EXMEM_RegWr;
            MEMWB_PC_plus_4  <= EXMEM_PC_plus_4; 
            MEMWB_ReadData <= EXMEM_ReadData;
            MEMWB_ALUOut <= EXMEM_ALUOut; 
            MEMWB_RegWriteAddr <= EXMEM_RegWriteAddr; 
        end if(condition==2)begin
                        MEMWB_MemToReg <= MEMWB_MemToReg; 
                        MEMWB_RegWr <=MEMWB_RegWr;
                        MEMWB_PC_plus_4  <= MEMWB_PC_plus_4; 
                        MEMWB_ReadData <= MEMWB_ReadData;
                        MEMWB_ALUOut <= MEMWB_ALUOut; 
                        MEMWB_RegWriteAddr <= MEMWB_RegWriteAddr; 
                    end
    end

endmodule