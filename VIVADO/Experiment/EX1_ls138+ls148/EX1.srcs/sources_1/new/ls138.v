//////////////////////////////////////////////////////////
//                      74LS138                         //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2021/11/16                              //
//                                                      //
// Project Requirements: Use if-else or case struct.    //
//                                                      //
//////////////////////////////////////////////////////////
module ls138(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7,S1,S2,S3);
input a,b,c,S1,S2,S3;
output reg d0,d1,d2,d3,d4,d5,d6,d7;
always @(S1,S2,S3,a,b,c)
begin
    if(S1 && (!(S2 + S3)))
    begin
    case({a,b,c})
    3'b000: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b01111111;
    3'b001: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b10111111;
    3'b010: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11011111;
    3'b011: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11101111;
    3'b100: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11110111;
    3'b101: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11111011;
    3'b110: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11111101;
    3'b111: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11111110;       
    default: {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11111111;
    endcase
    end
    else begin {d0,d1,d2,d3,d4,d5,d6,d7}=8'b11111111;end
end
endmodule
