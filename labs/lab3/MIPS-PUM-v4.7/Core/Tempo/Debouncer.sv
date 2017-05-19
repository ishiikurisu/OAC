module Debouncer
(
	input wire iClock,
	input wire iBouncy,
	output logic oPulse,
	output logic oState
);

logic [1:0] FF = '0;

always @(posedge iClock)
	FF <= { FF[0], iBouncy };
	
logic [18:0] Counter = '0;
wire [18:0] NextCounter;
wire CarryOut;

assign { CarryOut, NextCounter } = Counter + 1;

always @(posedge iClock)
	if (^FF)
		Counter <= '0;
	else if (!CarryOut)
		Counter <= NextCounter;
		
logic State = '0;
		
always @(posedge iClock)
	if (CarryOut)
		State <= FF[1];
		
assign oState = State;
assign oPulse = State != FF[1] && CarryOut && !State;

endmodule
