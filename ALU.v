module ALU(
	input [32 -1:0] in1      , 
	input [32 -1:0] in2      ,
	input [5 -1:0] ALUCtl    ,
	input Sign               ,
	output reg [32 -1:0] out ,
	output zero
);
	// zero means whether the output is zero or not
	assign zero = (out == 0);
	
	wire ss;
	assign ss = {in1[31], in2[31]};
	
	wire lt_31;
	assign lt_31 = (in1[30:0] < in2[30:0]);
	
	// lt_signed means whether (in1 < in2)
	wire lt_signed;
	assign lt_signed = (in1[31] ^ in2[31])? 
		((ss == 2'b01)? 0: 1): lt_31;
	
	// Add your code below (for question 2)
	
	// different ALU operations
	always @(*)
		case (ALUCtl)
			5'b00000: out <= in1 & in2;
			5'b00001: out <= in1 | in2;
			5'b00010: out <= in1 + in2;
			5'b00110: out <= in1 - in2;
			5'b00111: out <= {31'h00000000, Sign? lt_signed: (in1 < in2)};
			5'b01100: out <= ~(in1 | in2);
			5'b01101: out <= in1 ^ in2;
			5'b10000: out <= (in2 << in1[4:0]);
			5'b11000: out <= (in2 >> in1[4:0]);
			5'b11001: out <= ({{32{in2[31]}}, in2} >> in1[4:0]);
			5'b11111: out<=in1*in2;//设置mul的ALU
			5'b10001: out<=in1==in2;//设置bne的ALU
			5'b00100: out<=in1|in2;//设置ori的ALU
			5'b10010: out<=in1>0;//设置blez的ALU
			5'b10011: out<=in1<=0;//设置bgtz的ALU
			5'b10100: out<=in1>=0;//设置bltz的ALU
			default: out <= 32'h00000000;
		endcase
	// Add your code above (for question 2)
	
endmodule