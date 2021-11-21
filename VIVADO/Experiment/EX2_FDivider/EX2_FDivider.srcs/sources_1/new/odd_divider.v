module odd_divider#(parameter NUM_DIV = 5)
    (input clk,
    input rst_n,
    output clk_div
    );
    reg[2:0] cnt1;reg[2:0] cnt2;reg clk_div1, clk_div2;
always @(posedge clk or negedge rst_n)begin
    if(!rst_n) cnt1 <= 0;
    else if(cnt1 < NUM_DIV - 1) cnt1 <= cnt1 + 1'b1;
    else cnt1 <= 0;end
always @(posedge clk or negedge rst_n)begin
    if(!rst_n) clk_div1 <= 1'b0;
    else if(cnt1 < NUM_DIV / 2) clk_div1 <= 1'b1;
    else clk_div1 <= 1'b0;end       
always @(negedge clk or negedge rst_n)begin
    if(!rst_n) cnt2 <= 0;
    else if(cnt2 < NUM_DIV - 1) cnt2 <= cnt2 + 1'b1;
    else cnt2 <= 0;end
always @(negedge clk or negedge rst_n)begin
    if(!rst_n) clk_div2 <= 1'b0;
    else if(cnt2 < NUM_DIV / 2) clk_div2 <= 1'b1;
    else clk_div2 <= 1'b0;end     
    assign clk_div = clk_div1 | clk_div2;
endmodule