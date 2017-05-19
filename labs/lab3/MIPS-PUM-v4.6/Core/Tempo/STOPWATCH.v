module STOPWATCH(
    input         iCLK_50,
    input         Reset,
    //  Barramento de IO
    input         wReadEnable, wWriteEnable,
    input  [3:0]  wByteEnable,
    input  [31:0] wAddress, wWriteData,
    output [31:0] wReadData
);

reg [31:0] time_count;
reg [16:0] clock_count;

wire time_flag; 	//flag que eh ativada a cada 1ms
wire reset_flag;

always @(posedge iCLK_50) begin
	clock_count = clock_count + 1'b1;
	
	if(clock_count <= 50000) begin
		time_flag = 1'b1;
		clock_count = 16'b0;
	end
end 

always @(posedge iCLK_50 or posedge Reset) begin
	if(Reset | reset_flag) begin
		time_count = 32'b0;
	end else if(time_flag) begin
		time_count = time_count + 1'b1;
	end
end


always @ ( posedge iCLK_50 ) begin
	if (wWriteEnable) begin
		if (wAddress == STOPWATCH_ADDRESS) begin
			reset_flag = 1'b1;
		end
	end
end


always @(*)
	if(wReadEnable)
		begin
			wReadData = time_count;
		end
	else wReadData = 32'hzzzzzzzz;

endmodule
