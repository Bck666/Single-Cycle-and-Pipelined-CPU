
module DataMemory(
	input  reset    , 
	input  clk      ,  
	input  MemRead  ,
	input  MemWrite ,
	input  [32 -1:0] Address    ,
	input  [32 -1:0] Write_data ,
	output [32 -1:0] Read_data
);
	
	// RAM size is 256 words, each word is 32 bits, valid address is 8 bits
	parameter RAM_SIZE      = 2048;
	parameter RAM_SIZE_BIT  = 8;
	
	// RAM_data is an array of 256 32-bit registers
	reg [31:0] Data_word [RAM_SIZE - 1: 0];
initial
            begin
                Data_word[0] <= 32'h00000006;
    
                Data_word[1] <= 32'h00000000;
                Data_word[2] <= 32'h00000009;
                Data_word[3] <= 32'h00000003;
                Data_word[4] <= 32'h00000006; 
                Data_word[5] <= 32'hffffffff;
                Data_word[6] <= 32'hffffffff;
    
                Data_word[33] <= 32'h00000009;
                Data_word[34] <= 32'h00000000;
                Data_word[35] <= 32'hffffffff;
                Data_word[36] <= 32'h00000003;
                Data_word[37] <= 32'h00000004;
                Data_word[38] <= 32'h00000001;
    
                Data_word[65] <= 32'h00000003;
                Data_word[66] <= 32'hffffffff;
                Data_word[67] <= 32'h00000000;
                Data_word[68] <= 32'h00000002;
                Data_word[69] <= 32'hffffffff;
                Data_word[70] <= 32'h00000005;
    
                Data_word[97] <= 32'h00000006;
                Data_word[98] <= 32'h00000003;
                Data_word[99] <= 32'h00000002;
                Data_word[100] <= 32'h00000000;
                Data_word[101] <= 32'h00000006;
                Data_word[102] <= 32'hffffffff;
    
                Data_word[129] <= 32'hffffffff;
                Data_word[130] <= 32'h00000004;
                Data_word[131] <= 32'hffffffff;
                Data_word[132] <= 32'h00000006;
                Data_word[133] <= 32'h00000000;
                Data_word[134] <= 32'h00000002;
    
                Data_word[161] <= 32'hffffffff;
                Data_word[162] <= 32'h00000001;
                Data_word[163] <= 32'h00000005;
                Data_word[164] <= 32'hffffffff;
                Data_word[165] <= 32'h00000002;
                Data_word[166] <= 32'h00000000;
    
                Data_word[1024] <= 32'h00000000;
                Data_word[1025] <= 32'h00000000;
                Data_word[1026] <= 32'h00000000;
                Data_word[1027] <= 32'h00000000;
                Data_word[1028] <= 32'h00000000;
                Data_word[1029] <= 32'h00000000;
            end
	// read data from RAM_data as Read_data
	assign Read_data = MemRead? Data_word[Address[RAM_SIZE_BIT + 1:2]]: 32'h00000000;
	
	// write Write_data to RAM_data at clock posedge
	integer i;
	always @(posedge reset or posedge clk)
		if (reset) begin
					for (i = 0; i < RAM_SIZE; i = i + 1)
                      Data_word[i] = 32'h00000000;
                      
		              Data_word[0] <= 32'h00000006;
           
                       Data_word[1] <= 32'h00000000;
                       Data_word[2] <= 32'h00000009;
                       Data_word[3] <= 32'h00000003;
                       Data_word[4] <= 32'h00000006; 
                       Data_word[5] <= 32'hffffffff;
                       Data_word[6] <= 32'hffffffff;
           
                       Data_word[33] <= 32'h00000009;
                       Data_word[34] <= 32'h00000000;
                       Data_word[35] <= 32'hffffffff;
                       Data_word[36] <= 32'h00000003;
                       Data_word[37] <= 32'h00000004;
                       Data_word[38] <= 32'h00000001;
           
                       Data_word[65] <= 32'h00000003;
                       Data_word[66] <= 32'hffffffff;
                       Data_word[67] <= 32'h00000000;
                       Data_word[68] <= 32'h00000002;
                       Data_word[69] <= 32'hffffffff;
                       Data_word[70] <= 32'h00000005;
           
                       Data_word[97] <= 32'h00000006;
                       Data_word[98] <= 32'h00000003;
                       Data_word[99] <= 32'h00000002;
                       Data_word[100] <= 32'h00000000;
                       Data_word[101] <= 32'h00000006;
                       Data_word[102] <= 32'hffffffff;
           
                       Data_word[129] <= 32'hffffffff;
                       Data_word[130] <= 32'h00000004;
                       Data_word[131] <= 32'hffffffff;
                       Data_word[132] <= 32'h00000006;
                       Data_word[133] <= 32'h00000000;
                       Data_word[134] <= 32'h00000002;
           
                       Data_word[161] <= 32'hffffffff;
                       Data_word[162] <= 32'h00000001;
                       Data_word[163] <= 32'h00000005;
                       Data_word[164] <= 32'hffffffff;
                       Data_word[165] <= 32'h00000002;
                       Data_word[166] <= 32'h00000000;
           
                       Data_word[1024] <= 32'h00000000;
                       Data_word[1025] <= 32'h00000000;
                       Data_word[1026] <= 32'h00000000;
                       Data_word[1027] <= 32'h00000000;
                       Data_word[1028] <= 32'h00000000;
                       Data_word[1029] <= 32'h00000000;

		end
		else if (MemWrite)
			Data_word[Address[14 + 1:2]] <= Write_data;
			
endmodule