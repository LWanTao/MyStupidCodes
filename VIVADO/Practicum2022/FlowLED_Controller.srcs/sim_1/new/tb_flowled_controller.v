//////////////////////////////////////////////////////////
//               tb_flowled_controller                  //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2022/04/11                              //
//                                                      //
//            You may find details at the link below    //
//                 https://blog.csdn.net/LWanTao        //
//////////////////////////////////////////////////////////
module tb_flowled_controller();
parameter DELY=80;
reg clk,clr,ENLED;wire [7:0] led;
flowled_controller i1(.clk(clk),.ENLED(ENLED),.clr(clr),.led(led));
always begin #DELY clk=~clk;end
initial begin
clk=1;ENLED=1;clr=1;
#(DELY);clr=0;
#(DELY);ENLED=0;
end
endmodule