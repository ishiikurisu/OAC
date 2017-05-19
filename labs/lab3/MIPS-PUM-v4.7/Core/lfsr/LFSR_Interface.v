module LFSR_Interface(
	 input         iCLK_50,
    input         wReadEnable, 
    input  [31:0] wAddress,
    output [31:0] wReadData
);

wire [32:0] out;

lfsr_word lfsr(
	.out(out),
	.clk(iCLK_50)
);
	
always @(*)
	if(wReadEnable && wAddress == LFSR_ADDRESS) 
		wReadData = out[31:0];
	else	
		wReadData = 32'hzzzzzzzz;

		
endmodule
