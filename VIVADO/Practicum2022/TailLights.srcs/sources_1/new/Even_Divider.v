//////////////////////////////////////////////////////////////////
//                        Even_Divider                          //
// Author: AokIvan(https://github.com/aokivan)                  //
//                                                              //
// Create Date: 2022/04/11                                      //
//                                                              //
// Project Requirements: The divider can be customized          //
//                                                              //
//            You may find details at the link below            //
//                 https://blog.csdn.net/LWanTao                //
//////////////////////////////////////////////////////////////////
module Even_Divider#(parameter NUM_DIV = 2)
   (input clk,
    input clr,
    output reg clk_div
   );    
    reg [3:0]cnt;
    
always @(posedge clk or posedge clr)
    if(clr) begin
        cnt     <= 4'd0;
        clk_div <= 1'b0;
    end
    else if(cnt < NUM_DIV / 2 - 1) begin    //对clk周期的计数并未达到所设置分频数的一半，故不翻转分频clk，保持原样
        cnt     <= cnt + 1'b1;
        clk_div    <= clk_div;  
    end
    else begin
        cnt     <= 4'd0;
        clk_div <= ~clk_div;                //因为cnt=NUM_DIV/2-1,即对clk周期的计数达到所设置分频数的一半，故翻转分频clk
    end
endmodule