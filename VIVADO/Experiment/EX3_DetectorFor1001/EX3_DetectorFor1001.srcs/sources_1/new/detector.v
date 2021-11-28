//////////////////////////////////////////////////////////////////////////////////////////////////////
//                                      Detector for "1001" Sequence                                //
// Author: AokIvan(https://github.com/aokivan)                                                      //
//                                                                                                  //
// Create Date: 2021/11/21                                                                          //
//                                                                                                  //
// Project Requirements: Can automatically detect "1001" sequence from random inputs.               //
//                                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////
module detector(input clk,clr,x,output reg bool);
reg[2:0] state,next_state;parameter S0=3'b000,S1=3'b001,S2=3'b011,S3=3'b010,S4=3'b110;
always @(posedge clk, posedge clr)
begin 
if(clr) state<=S0;else state<=next_state;
end
always @(state,x)
begin
case(state)
S0:begin if(x) next_state<=S1;else next_state<=S0;end
S1:begin if(x) next_state<=S1;else next_state<=S2;end
S2:begin if(x) next_state<=S1;else next_state<=S3;end
S3:begin if(x) next_state<=S4;else next_state<=S0;end
S4:begin if(x) next_state<=S1;else next_state<=S2;end
default : next_state<=S0; endcase end
always @*
begin  case(state) 
       S4: bool=1'b1;
       default bool=1'b0;
       endcase
end endmodule