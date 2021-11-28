//////////////////////////////////////////////////////////
//                      74LS148                         //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2021/11/16                              //
//                                                      //
// Project Requirements: Use if-else or case struct.    //
//                                                      //
//////////////////////////////////////////////////////////
module ls148(a0,a1,a2,a3,a4,a5,a6,a7,S,y0,y1,y2,ys,yex,clr);
input a0,a1,a2,a3,a4,a5,a6,a7,S,clr;
output reg y0,y1,y2,ys,yex;
always @(a0,a1,a2,a3,a4,a5,a6,a7,S,clr)
begin
if(S||clr) begin y0<=1;y1<=1;y2<=1;ys<=1;yex<=1; end
else begin
casex({a7,a6,a5,a4,a3,a2,a1,a0})
8'b11111111: begin y0<=1;y1<=1;y2<=1;ys<=0;yex<=1;end
8'b0xxxxxxx: begin y0<=0;y1<=0;y2<=0;ys<=1;yex<=0;end
8'b10xxxxxx: begin y0<=1;y1<=0;y2<=0;ys<=1;yex<=0;end
8'b110xxxxx: begin y0<=0;y1<=1;y2<=0;ys<=1;yex<=0;end
8'b1110xxxx: begin y0<=1;y1<=1;y2<=0;ys<=1;yex<=0;end
8'b11110xxx: begin y0<=0;y1<=0;y2<=1;ys<=1;yex<=0;end
8'b111110xx: begin y0<=1;y1<=0;y2<=1;ys<=1;yex<=0;end
8'b1111110x: begin y0<=0;y1<=1;y2<=1;ys<=1;yex<=0;end
8'b11111110: begin y0<=1;y1<=1;y2<=1;ys<=1;yex<=0;end
endcase 
end end
endmodule