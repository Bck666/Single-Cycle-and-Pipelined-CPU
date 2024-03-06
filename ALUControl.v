
module ALUControl(
	input  [5 -1:0] ALUOp      ,
	input  [6 -1:0] Funct      ,
	output reg [5 -1:0] ALUCtl ,
	output Sign
);
	
	// Add your code below (for question 2)
	// funct number for different operation
	parameter aluAND = 5'b00000;
	parameter aluOR  = 5'b00001;
	parameter aluADD = 5'b00010;
	parameter aluSUB = 5'b00110;
	parameter aluSLT = 5'b00111;
	parameter aluNOR = 5'b01100;
	parameter aluXOR = 5'b01101;
	parameter aluSLL = 5'b10000;
	parameter aluSRL = 5'b11000;
	parameter aluSRA = 5'b11001;
	parameter aluori = 5'b00100;//设置ori对应的ALU控制信号编码为5'b11111
	parameter alumul = 5'b11111;//设置mul对应的ALU控制信号编码为5'b11111
	parameter alubne = 5'b10001;//设置bne对应的ALU控制信号编码为5'b11111
	parameter alublez = 5'b10010;
	parameter alubgtz = 5'b10011;
	parameter alubltz = 5'b10100;
	// Sign means whether the ALU treats the input as a signed number or an unsigned number
	assign Sign = (ALUOp[3:0] == 4'b0010)? ~Funct[0]: ~ALUOp[4];
	
	// set aluFunct
	reg [4:0] aluFunct;
	always @(*)
		case (Funct)
			6'b00_0000: aluFunct <= aluSLL;
			6'b00_0010: aluFunct <= aluSRL;
			6'b00_0011: aluFunct <= aluSRA;
			6'b10_0000: aluFunct <= aluADD;
			6'b10_0001: aluFunct <= aluADD;
			6'b10_0010: aluFunct <= aluSUB;
			6'b10_0011: aluFunct <= aluSUB;
			6'b10_0100: aluFunct <= aluAND;
			6'b10_0101: aluFunct <= aluOR;
			6'b10_0110: aluFunct <= aluXOR;
			6'b10_0111: aluFunct <= aluNOR;
			6'b10_1010: aluFunct <= aluSLT;
			6'b10_1011: aluFunct <= aluSLT;
			default: aluFunct <= aluADD;
		endcase
	
	// set ALUCtrl
	always @(*)
		case (ALUOp[3:0])
			4'b0000: ALUCtl <= aluADD;
			4'b0001: ALUCtl <= aluSUB;
			4'b0100: ALUCtl <= aluAND;
			4'b0101: ALUCtl <= aluSLT;
			4'b0010: ALUCtl <= aluFunct;
			4'b0111: ALUCtl <= alumul;//判断是否是mul指令如果是，则将ALUCtl赋值为alumul
			4'b0110: ALUCtl <= alubne;//判断是否是bne指令如果是，则将ALUCtl赋值为alumul
			4'b0011: ALUCtl <= aluori;//判断是否是ori指令如果是，则将ALUCtl赋值为alumul
			4'b1000: ALUCtl <= alublez;
			4'b1001: ALUCtl <= alubgtz;
			4'b1010: ALUCtl <= alubltz;
			default: ALUCtl <= aluADD;
		endcase
	// Add your code above (for question 2)

endmodule
