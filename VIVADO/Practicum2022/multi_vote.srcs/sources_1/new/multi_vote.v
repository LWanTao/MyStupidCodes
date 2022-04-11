//////////////////////////////////////////////////////////////////
//                        multi_vote                            //
// Author: AokIvan(https://github.com/aokivan)                  //
//                                                              //
// Create Date: 2022/04/11                                      //
//                                                              //
// Project Requirements: The amount of voter could be customized//
//                                                              //
//            You may find details at the link below            //
//                 https://blog.csdn.net/LWanTao                //
//////////////////////////////////////////////////////////////////
module multi_vote #(parameter NUM = 9)
                    (input [NUM-1:0] a,
                     output reg [1:0] result
                     );
integer i,cnt1,cnt2;
always @(*)
    begin
    cnt1 = 0;cnt2 = 0;
    i = 0;
    while(i<NUM)
        begin
            if(a[i]) cnt1 = cnt1+1;
            else cnt2 = cnt2+1;
            i = i+1;
        end
    if(cnt1>cnt2) result = 2'b01;
    else result = 2'b00;
    end
endmodule