module TopDE (
	input iCLK_50, iCLK_28,
	input [3:0] iKEY,
	input [17:0] iSW,
	output [8:0] oLEDG,
	output [17:0] oLEDR,
	output [6:0] oHEX0_D, oHEX1_D, oHEX2_D, oHEX3_D, oHEX4_D, oHEX5_D, oHEX6_D, oHEX7_D,
	output oHEX0_DP, oHEX1_DP, oHEX2_DP, oHEX3_DP, oHEX4_DP, oHEX5_DP, oHEX6_DP, oHEX7_DP);

wire [31:0] idataa,idatab;
reg [31:0] oresult;
reg onan, ozero, ooverflow, ounderflow;
reg oCompResult;

initial
	begin
		oresult<=32'b0;
		onan<=1'b0;
		ozero<=1'b0;
		ooverflow<=1'b0;
		ounderflow<=1'b0;
		oCompResult<=1'b0;
	end
	
//assign idataa=32'hC8000000;
//assign idatab=32'h40000000;

assign idataa={{28{iSW[8]}},iSW[8:5]};
assign idatab={{28{iSW[12]}},iSW[12:9]};

assign oLEDR[0]=ozero;
assign oLEDR[1]=ooverflow;
assign oLEDR[2]=ounderflow;
assign oLEDR[3]=oCompResult;
assign oLEDR[4]=onan;

wire [4:0] ulactrl;
//assign ulactrl=5'b00000; // para análise dos requerimentos decada operação
assign ulactrl=iSW[4:0]; // Controle da operação pelas chaves

ALU  ula1 (.iCLK(iCLK_50), .iRST(~iKEY[0]), .iA(idataa), .iB(idatab), .iControlSignal(ulactrl), .iShamt(iSW[17:13]), 
.oZero(ozero), .oALUresult(oresult), .oOverflow(ooverflow));

Decoder7 d0 (oresult[3:0],oHEX0_D);
Decoder7 d1 (oresult[7:4],oHEX1_D);
Decoder7 d2 (oresult[11:8],oHEX2_D);
Decoder7 d3 (oresult[15:12],oHEX3_D);
Decoder7 d4 (oresult[19:16],oHEX4_D);
Decoder7 d5 (oresult[23:20],oHEX5_D);
Decoder7 d6 (oresult[27:24],oHEX6_D);
Decoder7 d7 (oresult[31:28],oHEX7_D);

assign oHEX0_DP=1'b1;
assign oHEX1_DP=1'b1;
assign oHEX2_DP=1'b1;
assign oHEX3_DP=1'b1;
assign oHEX4_DP=1'b1;
assign oHEX5_DP=1'b1;
assign oHEX6_DP=1'b1;
assign oHEX7_DP=1'b1;

endmodule
