/*浜х敓10k鏃堕挓淇″彿鐢ㄤ簬璁℃暟*/
`timescale 1ns / 1ps
module clock_10M(
    clk, 
    reset, 
    clk_10M
);

input           clk;
input           reset;
output          clk_10M;

reg             clk_10M;

parameter   CNT = 16'd5000;
//10M
//parameter   CNT = 16'd5;

reg     [15:0]  count;

always @(posedge clk or posedge reset)
begin
    if(reset) begin
        clk_10M <= 1'b0;
        count <= 16'd0;
    end
    else begin
        count <= (count==CNT-16'd1) ? 16'd0 : count + 16'd1;
        clk_10M <= (count==16'd0) ? ~clk_10M : clk_10M;
    end
end

endmodule
