`timescale 1ns / 1ps
module add_ahead_gene_vlg_tst();
parameter DELY=80;
reg [7:0] a;
reg [7:0] b;
reg cin;
wire cout;
wire [7:0] sum;
add_ahead_gene i1(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
initial begin
a = 8'd10; b = 8'd9; cin=1'b0;
#DELY cin = 1'b1;
#DELY b = 8'd19;
#DELY a = 8'd200;
#DELY b = 8'd60;
#DELY cin = 1'b0;
#DELY b = 8'd45;
#DELY a = 8'd30;
#DELY $stop;
$display("Running testbench");
end
endmodule
