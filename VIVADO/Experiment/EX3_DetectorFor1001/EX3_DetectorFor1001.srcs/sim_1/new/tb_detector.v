module tb_detector();
reg clk,clr,x;
wire bool;
detector i1(.clk(clk),.clr(clr),.x(x),.bool(bool));

always begin #20 clk=~clk;end

initial begin
clk=0;x=0;clr=1;
#90;clr=0;x=1;
#40;x=0;
#40;x=1;
#40;x=0;
#40;x=0;
#40;x=1;
#40;x=0;
#40;x=1;
#40;x=0;
#40;x=0;
#40;x=1;
end

endmodule
