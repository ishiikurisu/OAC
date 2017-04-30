/* TopDE.v */

/****************************************
*    UnB - OAC - Prof. Marcus Lamar      *
*    Laboratório 2  Parte B  - DE-2 70   *
*    Exemplo 1                           *
*************************************** */

// Este exemplo visa apresentar as facilidades de IO
// da plataforma de desenvolvimento Altera - DE2 70


module TopDE (
	input iCLK_50,
	input [17:0] iSW, 
	input [3:0] iKEY,
	output [17:0] oLEDR, 
	output [8:0] oLEDG,
	output [6:0] oHEX0_D, oHEX1_D, oHEX2_D, oHEX3_D,oHEX4_D,oHEX5_D,oHEX6_D,oHEX7_D,
	output oHEX0_DP, oHEX1_DP, oHEX2_DP, oHEX3_DP, oHEX4_DP, oHEX5_DP, oHEX6_DP, oHEX7_DP );

	assign oLEDR = iSW;
	assign oLEDG[0] = iKEY[0];
	assign oLEDG[1] = ~iKEY[0];
	assign oLEDG[2] = iKEY[1];
	assign oLEDG[3] = ~iKEY[1];
	assign oLEDG[4] = iKEY[2];
	assign oLEDG[5] = ~iKEY[2];

	assign oHEX0_DP=1'b1;
	assign oHEX1_DP=1'b1;
	assign oHEX2_DP=1'b1;
	assign oHEX3_DP=1'b1;
	assign oHEX4_DP=1'b1;
	assign oHEX5_DP=1'b1;
	assign oHEX6_DP=1'b1;
	assign oHEX7_DP=1'b1;
	
	
	xor x1 (oLEDG[6],iSW[17],iSW[16]); // Exemplo de uso de porta lógica
	assign oLEDG[7]=iSW[17]^iSW[16];

	
	wire clk1;
	
	fdiv f1 (.clkin(iCLK_50),.clkout(clk1));

	assign oLEDG[8]=clk1;
	
	reg [3:0] num;
	
	initial
		num=0;
		
	always @(posedge clk1)
		num<=num+4'd1;
	
	decoder7 u7 (.In({3'b000,clk1}),  .Out(oHEX7_D), .Clk(clk1));
	decoder7 u6 (.In(num),  .Out(oHEX6_D), .Clk(clk1));
	decoder7 u5 (.In(num+4'd1),  .Out(oHEX5_D), .Clk(clk1));
	decoder7 u4 (.In(num+4'd2),  .Out(oHEX4_D), .Clk(clk1));

	decoder7 u0 (.In(iSW[3:0]),  .Out(oHEX0_D), .Clk(clk1));
	decoder7 u1 (.In(iSW[7:4]),  .Out(oHEX1_D), .Clk(clk1));
	decoder7 u2 (.In(iSW[11:8]), .Out(oHEX2_D), .Clk(clk1));
	decoder7 u3 (.In(iSW[15:12]),.Out(oHEX3_D), .Clk(clk1));


endmodule
