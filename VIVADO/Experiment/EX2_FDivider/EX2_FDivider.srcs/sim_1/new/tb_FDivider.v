module tb_FDivider();
reg clkin,rst_n;
wire clkout;
FDivider i1(.clkin(clkin),.clkout(clkout),.rst_n(rst_n));
always #20 clkin=~clkin;

initial begin
clkin = 0;rst_n = 0;
#50;rst_n = 1;
end

endmodule