module lfsr_interface(
	 input         iCLK_50,
    input         wReadEnable, 
    input  [31:0] wAddress,
    output [31:0] wReadData
);

wire [31:0] out;

lfsr_word lfsr(
	.out(out),
	.clk(iCLK_50)
);
	
always @(*)
	if(wReadEnable)
		if(wAddress == LFSR_ADDRESS) begin
			wReadData = out;
		end else	
			wReadData = 32'hzzzzzzzzz;

		
endmodule
