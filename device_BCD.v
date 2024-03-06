`timescale 1ns / 1ps
/* BCD 這是原來的module */

module BCD (
    input reset,
    input clk,
    input [31:0] WBwritadress,
    input [31:0] WBwritdata,
    input BCDWrite,
    input BCDRead,

    output reg [31:0] BCD_Read_data,
    output reg [11:0] digi
);
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            BCD_Read_data <= 32'h00000000;
        end
        else begin
            if(BCDWrite) begin
                case (WBwritadress)
                    32'h40000010: begin
                        digi <= WBwritdata[11:0];
                    end
                endcase
            end
            else if(BCDRead) begin
                case (WBwritadress)
                    32'h40000010: BCD_Read_data <= {20'h00000, digi};
                    default: BCD_Read_data <= 32'h00000000;
                endcase
            end
        end
    end
endmodule