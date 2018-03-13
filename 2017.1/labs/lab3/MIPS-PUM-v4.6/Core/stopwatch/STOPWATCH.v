module STOPWATCH(
    input         iCLK_50, iCLK,
    //  Barramento de IO
    input         wReadEnable, wWriteEnable,
    input  [3:0]  wByteEnable,
    input  [31:0] wAddress, wWriteData,
    output [31:0] wReadData
);

reg [31:0] time_count;

wire clk;
wire reset_flag;

Stopwatch_divider_clk divider(
	.clk(iCLK_50),
	.new_freq(clk)
);


always @(posedge clk ) begin
	time_count = time_count + 1'b1;
end


always @ ( posedge iCLK ) begin
	if (wWriteEnable) begin
		if (wAddress == STOPWATCH_ADDRESS) begin
			reset_flag = 1'b1;
		end
	end
end


always @(*)
	if(wReadEnable)
		begin
			if (wAddress == STOPWATCH_ADDRESS) begin
				wReadData = time_count;
			end else wReadData = 32'hzzzzzzzz;	
		end
	else wReadData = 32'hzzzzzzzz;

endmodule
