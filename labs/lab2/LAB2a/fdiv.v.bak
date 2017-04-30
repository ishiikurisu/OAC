module fdiv (
input clkin,
output reg clkout
);

integer cont;

initial
   cont=0;
  
always @(posedge clkin)
  begin
	if (cont==25000000)
		begin
			cont<=0;
			clkout<=~clkout;
		end
		else
		begin
			cont<=cont+1;
			clkout<=clkout;
		end
   end
endmodule