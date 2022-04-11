//////////////////////////////////////////////////////////////////
//                        TB_TailLights                         //
// Author: AokIvan(https://github.com/aokivan)                  //
//                                                              //
// Create Date: 2022/04/11                                      //
//                                                              //
//            You may find details at the link below            //
//                 https://blog.csdn.net/LWanTao                //
//////////////////////////////////////////////////////////////////
module TB_TailLights();
parameter DELY=50000000;
reg [2:0] command;reg clr,clk;wire [1:0] light;
wire clk_div;
TailLights i1(.command(command),.clk(clk),.clr(clr),.light(light));
Even_Divider i2(.clk(clk),.clr(clr),.clk_div(clk_div));
always begin #(DELY/2);clk<=~clk;end
initial begin
clk<=1;clr<=1;#(DELY);command<=3'd0;clr<=0;#DELY;//³õÊ¼»¯
command = 3'd1;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd2;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd3;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd4;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd1;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd2;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd3;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd4;#(DELY*4);
command = 3'd0;#(DELY*4);
command = 3'd0;#(DELY*4);
end
endmodule