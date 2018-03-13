
module Break_Interface(
    input         iCLK_50,
    input         iCLK,
    input         Reset,
    output        oBreak,
    //  Barramento de IO
    input         wReadEnable, wWriteEnable,
    input  [3:0]  wByteEnable,
    input  [31:0] wAddress, wWriteData,
    output [31:0] wReadData
);

assign wReadData=32'bzzzzzzzz;

always @ ( posedge iCLK ) begin
	if (wWriteEnable)
		if (wAddress == BREAK_ADDRESS)
			oBreak <= 1'b1;
		else
			oBreak <= 1'b0;
	else
		oBreak <= 1'b0;
end

endmodule
