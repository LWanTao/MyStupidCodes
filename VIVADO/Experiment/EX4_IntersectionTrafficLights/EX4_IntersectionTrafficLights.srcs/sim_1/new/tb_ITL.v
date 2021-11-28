module tb_ITL();
reg clk,clr;
wire green1,yellow1,left1,red1,green2,yellow2,left2,red2;
wire [7:0] seg;
wire [3:0] sel;
wire [5:0] count;
ITL i1(.seg(seg),.sel(sel),.count(count),.clr(clr),.clk(clk),
.red1(red1),.red2(red2),.yellow1(yellow1),.yellow2(yellow2),
.green1(green1),.green2(green2),.left1(left1),.left2(left2));
always begin #25;clk=~clk;end
initial begin
clk=0;clr=1;#25;clr=0;
end
endmodule