module add_ahead_gene #(parameter SIZE = 8)
			(input[SIZE-1:0] a,b,
			 input cin,
			 output[SIZE-1:0] sum,
			 output cout);
wire[SIZE-1:0] G,P,C;
assign C[0]=cin;
assign cout=C[SIZE-1];

generate
genvar i;
for(i=0;i<SIZE;i=i+1)
begin : adder_sum
assign G[i] = a[i] & b[i];
assign P[i] = a[i] | b[i];
assign sum[i] = G[i]^P[i]^C[i];
end

for(i=1;i<SIZE;i=i+1)
begin : adder_carry
assign C[i] = G[i-1]|(P[i-1]&C[i-1]);
end
endgenerate
endmodule
