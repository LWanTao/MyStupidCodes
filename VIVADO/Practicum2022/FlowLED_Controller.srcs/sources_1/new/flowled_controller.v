//////////////////////////////////////////////////////////
//                 flowled_controller                   //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2022/04/11                              //
//                                                      //
// Project Requirements: Use FSM£¨Finite State Machine£©//
//                                                      //
//            You may find details at the link below    //
//                 https://blog.csdn.net/LWanTao        //
//////////////////////////////////////////////////////////
module flowled_controller#(parameter DELY=80)
(input clk,ENLED,clr,output reg [7:0] led);
reg [0:3] state,next_state;
reg bool=0;
parameter S0=4'd0,S1=4'd1,S2=4'd2,S3=4'd3,S4=4'd4,S5=4'd5,S6=4'd6,
          S7=4'd7,S8=4'd8,S9=4'd9,S10=4'd10,S11=4'd11,S12=4'd12;

always @(posedge clk,clr,ENLED)
begin
if(clr||ENLED) state<=S0;else state<=next_state;
end

always @(posedge clk)
begin
case(state)
S0:begin if(~bool)next_state<=S1;else next_state<=S9;end
S1:begin next_state<=S2;end
S2:begin next_state<=S3;end
S3:begin next_state<=S4;end
S4:begin next_state<=S5;end
S5:begin next_state<=S6;end
S6:begin next_state<=S7;end
S7:begin next_state<=S8;end
S8:begin bool<=1;next_state<=S0;end
S9:begin next_state<=S10;end
S10:begin next_state<=S11;end
S11:begin next_state<=S12;end
S12:begin bool<=0;next_state<=S0;end
default : next_state<=S0;
endcase
end

always @(posedge clk)
begin
if(~ENLED)
begin
case(state)//¼ÙÉè1ÎªÁÁ,0ÎªÃð
    S0:led <= 8'b00000000;
    S1:led <= 8'b10000000;
    S2:led <= 8'b11000000;
    S3:led <= 8'b11100000;
    S4:led <= 8'b11110000;
    S5:led <= 8'b11111000;
    S6:led <= 8'b11111100;
    S7:led <= 8'b11111110;
    S8:led <= 8'b11111111;
    S9:led <= 8'b10000001;
    S10:led <= 8'b11000011;
    S11:led <= 8'b11100111;
    S12:led <= 8'b11111111;
default:led <= 8'b00000000;    
endcase end end endmodule