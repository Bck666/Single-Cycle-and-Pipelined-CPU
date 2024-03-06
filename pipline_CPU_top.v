module top(
    input sys_clk,
    input reset,
    output [11:0] digi
);
	wire        MemRead             ; 
	wire        MemWrite            ;
	wire [31:0] MemBus_Address      ;
	wire [31:0] MemBus_Write_Data   ;
	wire [31:0] BCD_Read_data       ;
	wire clk;

    clock_10M xclock_10M(
        .clk(sys_clk),
        .reset(reset),
        .clk_10M(clk)
    );
    
	pipelinecpu pipelinecpu1(  
		.reset              (reset              ), 
		.clk                (clk                ), 
		.digi               (digi               )
	);
endmodule