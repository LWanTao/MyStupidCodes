module tb_ls138();
reg a,b,c,S1,S2,S3,clr;wire d0,d1,d2,d3,d4,d5,d6,d7;
ls138 i1(.clr(clr),.a(a),.b(b),.c(c),.S1(S1),.S2(S2),.S3(S3),
.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7));
initial begin 
clr <= 0;
a<=0;b<=0;c<=0;
S1<=0;S2<=0;S3<=0;
#100;S1<=1;a<=0;b<=0;c<=0;
#50;a<=0;b<=0;c<=1;
#50;a<=0;b<=1;c<=0;
#50;a<=0;b<=1;c<=1;
#50;a<=1;b<=0;c<=0;
#50;a<=1;b<=0;c<=1;
#50;a<=1;b<=1;c<=0;
#50;a<=1;b<=1;c<=1;
#50;clr <= 1;
#50;clr <= 0;S1<=0;
end endmodule