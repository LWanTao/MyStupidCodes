module adder(sum,a0,a1,a2,a3);
input [0:7] a0,a1,a2,a3;
output reg [0:7] sum;
always @(a0,a1,a2,a3)
begin
sum <= (a0+a1)+(a2+a3);
end
endmodule
