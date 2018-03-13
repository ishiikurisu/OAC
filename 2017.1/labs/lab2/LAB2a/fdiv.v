module fdiv (
input clkin,
output reg clkout
);

integer cont;   // 32 bits!

initial
   cont=32'd0;
  
always @(posedge clkin)
  begin
	if (cont==32'd12499999)
		begin
			cont<=32'd0;
			clkout<=~clkout;
		end
		else
		begin
			cont<=cont+32'd1;
			clkout<=clkout;
		end
   end
endmodule