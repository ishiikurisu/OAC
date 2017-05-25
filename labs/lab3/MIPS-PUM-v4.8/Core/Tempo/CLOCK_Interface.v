module CLOCK_Interface(
	input iCLK_50,
	input iCLK_50_4,
	output oCLK_100, oCLK_200,
	output reg CLK,
	output CLK_X,
	output Reset,
	output reg CLKSelectFast, CLKSelectAuto,
	input [3:0] iKEY,
	input [7:0] fdiv,
	input Timmer,
	input iBreak
);


// Reset Síncrono com Clock
always @(posedge CLK)
	Reset <= ~iKEY[0];


/* Clock signals */
reg CLKManual, CLKAutoSlow, CLKAutoFast;
wire CLK_CTRL, CLK_LOCK;
reg [7:0] CLKCount2; // contador do CLK fast
reg [25:0] CLKCount; // contador do CLK slow

/* Clock inicializacao */
initial
begin
	CLK <= 1'b0;
	CLKManual	<= 1'b0;
	CLKAutoSlow	<= 1'b0;
	CLKAutoFast	<= 1'b0;
	CLKSelectAuto<= 1'b0;
	CLKSelectFast<= 1'b0;
	CLKCount2<=8'b0;
	CLKCount<=26'b0;
end

wire wClk, wClk1, wClk2, wClk3,wLock;
PLL PLL1 (.areset(1'b0),.inclk0(iCLK_50_4),.c0(wClk1),.c1(wClk2),.c2(wClk3),.locked(wLock));
assign oCLK_100=wClk1; // 100MHz
assign oCLK_200=wClk3; // 200MHz

assign wClk=wClk1;// Escolher manualmente  Clk1=100MHz   Clk2=150MHz  Clk3=200MHz

/* Escolher uma das duas linhas abaixo para definir a frequencia max do clock */
//PLL_teste pllx (.areset(~DLY_RST),.inclk0(wClk),.c0(CLK_X),.locked(CLK_LOCK)); // PLL para de testes, editar com o Megawizard
reg ck1,ck2;
initial begin ck1=0; ck2=0; end

always @(posedge oCLK_200)
	ck1    <=  ~ck1; //100
always @(posedge ck1)
	ck2    <=  ~ck2; //50

//assign CLK_X=wClk; assign CLK_LOCK=wLock;//||CLK_CLOCK;
assign CLK_X=ck1; assign CLK_LOCK=wLock;//||CLK_CLOCK;

/* Timmer de 10 segundos */
//mono Timmer10 (.clock50(iCLK_50_4),.clock(CLK_X && CLK_LOCK), .ctrl(~Timmer), .clock_ctrl(CLK_CTRL), .rst(Reset)); // gera o clock controlado
mono Timmer10 (.clock50(ck2),.clock(ck1), .ctrl(~Timmer), .clock_ctrl(CLK_CTRL), .rst(Reset)); // gera o clock controlado

/* Clocks escolha */
always @(posedge CLK_CTRL)
begin
	CLK <= CLKSelectAuto?(CLKSelectFast?CLKAutoFast:CLKAutoSlow):CLKManual;
end

always @(posedge iKEY[3])    //Clock Manual
	CLKManual <= ~CLKManual;

always @(posedge iKEY[2] or posedge iBreak) begin
	if (iBreak)
		CLKSelectAuto <= 1'b0;
	else
		CLKSelectAuto <= ~CLKSelectAuto; // Automatico/Manual
end

always @(posedge iKEY[1])
	CLKSelectFast <= ~CLKSelectFast;  //Slow/Fast

wire [7:0] divisor;
assign divisor=fdiv-8'd1;


always @(posedge CLK_CTRL)   // Divisores do clock
begin
	//if (CLKCount == {10'b0, divisor, 8'b0}) //Clock Slow - quem fez isso?
	 if (CLKCount == {divisor, 18'b0}) //Clock Slow
		begin
			CLKAutoSlow <= ~CLKAutoSlow;
			CLKCount <= 26'b0;
		end
	else
		CLKCount <= CLKCount + 1'b1;

	if (CLKCount2 == divisor) //Clock Fast
		begin
			CLKAutoFast <= ~CLKAutoFast;
			CLKCount2 <= 8'b0;
		end
	else
		CLKCount2 <= CLKCount2 + 1'b1;

end




endmodule
