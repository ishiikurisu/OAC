module StopWatch_Interface(
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

initial 
	begin
		time_count=32'b0;
		reset_flag=1'b0;
	end

Stopwatch_divider_clk divider(
	.clk(iCLK_50),
	.new_freq(clk)
);


always @(posedge clk ) 
		if(reset_flag)
			time_count=32'b0;
		else
			time_count = time_count + 1'b1;


always @ ( posedge iCLK ) 
	if (wWriteEnable) 
		if (wAddress == STOPWATCH_ADDRESS) 
			reset_flag = 1'b1;
		else
			reset_flag = 1'b0;
	else
		reset_flag = 1'b0;
		

always @(*)
	if(wReadEnable)
			if (wAddress == STOPWATCH_ADDRESS)
				wReadData = time_count;
			else 
				wReadData = 32'hzzzzzzzz;	
	else 
		wReadData = 32'hzzzzzzzz;

endmodule




module Stopwatch_divider_clk(
	input clk,
	output new_freq
	);

reg [15:0] count;

always @(posedge clk )
begin
	if (count == 16'd25000)
		begin
			count <= 16'd0;
			new_freq <= ~new_freq;
		end
	else
		begin
			count <= count + 1'b1;
			new_freq <= new_freq;
		end
end

endmodule
