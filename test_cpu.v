`timescale 1ns / 1ps
module test_cpu();
	reg reset   ;
	reg  sys_clk     ;


	
	pipelinecpu cpu1(  
		.reset              (reset              ), 
		.clk                ( sys_clk                )

	);

	
	initial begin
		reset   = 0;
		 sys_clk     = 1;
		#100 reset = 1;
		#100 reset = 0;
	end
	
	always #50 sys_clk = ~ sys_clk;
		
endmodule
