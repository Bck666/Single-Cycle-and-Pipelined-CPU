
module Control(
	input  [6 -1:0] OpCode   ,
	input  [6 -1:0] Funct    ,
	output [2 -1:0] PCSrc    ,
	output Branch            ,
	output RegWrite          ,
	output [2 -1:0] RegDst   ,
	output MemRead           ,
	output MemWrite          ,
	output [2 -1:0] MemtoReg ,
	output ALUSrc1           ,
	output ALUSrc2           ,
	output ExtOp             ,
	output LuOp              ,
	output [5 -1:0] ALUOp
);
	
	// Add your code below (for question 2)

	// Your code below (for question 1)
assign  PCSrc=
(OpCode == 6'h02 ||  OpCode == 6'h03)? 2'b01:
(OpCode == 6'h00 && Funct==6'h08)? 2'b10:
2'b00;

assign  Branch=(OpCode == 6'h01||OpCode == 6'h06||OpCode == 6'h07||OpCode == 6'h04||OpCode == 6'h05)? 1:0;

assign RegWrite=(OpCode == 6'h2b || OpCode == 6'h01||OpCode == 6'h06||OpCode == 6'h07||OpCode == 6'h04||OpCode == 6'h05 || OpCode == 6'h02  || (OpCode == 6'h00 && Funct==6'h08))? 0:1;       
assign RegDst=(OpCode == 6'h0d ||OpCode == 6'h23 || OpCode == 6'h0f || OpCode == 6'h08 || OpCode == 6'h09 || OpCode == 6'h0c || OpCode == 6'h0a || OpCode == 6'h0b)? 2'b00:
(OpCode == 6'h03)? 2'b10:
2'b01;
assign  MemRead =(OpCode == 6'h23)?1:0;
assign  MemWrite =(OpCode == 6'h2b )?1:0;       
assign  MemtoReg =(OpCode == 6'h23 )?2'b01:
(OpCode == 6'h03)? 2'b10:
2'b00;

assign  ALUSrc1 =((OpCode == 6'h00) &&(Funct==6'h00 || Funct==6'h02 ||Funct==6'h03)) ?1:0;
assign  ALUSrc2 =(OpCode == 6'h00 ||OpCode == 6'h01||OpCode == 6'h06||OpCode == 6'h07||OpCode == 6'h04||OpCode == 6'h05||OpCode == 6'h1c)?0:1;//加入mul指令
assign  ExtOp=(OpCode == 6'h0c) ?0:1;
assign  LuOp=(OpCode == 6'h0f)?1:0;
	
	// Your code above (for question 1)

	// set ALUOp
	assign ALUOp[3:0] = 
		(OpCode == 6'h00)? 4'b0010: 
		(OpCode == 6'h04)? 4'b0001: 
		(OpCode == 6'h0c)? 4'b0100: 
		(OpCode == 6'h0a || OpCode == 6'h0b)? 4'b0101: 
		(OpCode == 6'h1c)?4'b0111://mul的ALUOp
		(OpCode == 6'h05)?4'b0110:
		(OpCode == 6'h0d)?4'b0011: 
		(OpCode == 6'h06)?4'b1000:
		(OpCode == 6'h07)?4'b1001:
		(OpCode == 6'h01)?4'b1010:
		4'b0000;
		
	assign ALUOp[4] = OpCode[0];

	// Add your code above (for question 2)
	
endmodule