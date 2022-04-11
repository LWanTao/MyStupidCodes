//////////////////////////////////////////////////////////
//                     tb_multi_vote                    //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2022/04/11                              //
//                                                      //
//            You may find details at the link below    //
//                 https://blog.csdn.net/LWanTao        //
//////////////////////////////////////////////////////////
module tb_multi_vote();
parameter DELY = 80;
parameter NUM = 9;

reg [NUM-1:0] a;wire [1:0] result;
multi_vote i1(.a(a),.result(result));
initial begin
a = 9'b000000000;
#DELY;a = 9'b110110110;
#DELY;a = 9'b100100100;
#DELY;a = 9'b000011111;
#DELY;a = 9'b111111111;
#DELY;a = 9'b000000011;
#DELY;a = 9'b000000000;
end
endmodule