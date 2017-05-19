//-----------------------------------------------------
// Design Name : lfsr
// File Name   : lfsr.v
// Function    : Linear feedback shift register
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module lfsr_word    (
out            ,  // Output of the counter
clk             ,  // clock input
);

//----------Output Ports--------------
output [32:0] out;
//------------Input Ports--------------
input clk;
//------------Internal Variables--------
reg [32:0] out;
wire        linear_feedback;

//-------------Code Starts Here-------

assign lf1 = out[31] ^ out[21];
assign lf2 = out[1] ^ lf1;
assign lf3 = out[0] ^ lf2;
assign linear_feedback = lf3 ^ 1'b1;

always @(posedge clk) begin
	out[32] = linear_feedback;
	out <= out >> 1'b1;
end 

endmodule // End Of Module counter