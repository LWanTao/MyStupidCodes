//////////////////////////////////////////////////////////
//                         SEG                          //
// Author: AokIvan(https://github.com/aokivan)          //
//                                                      //
// Create Date: 2021/11/21                              //
//                                                      //
//        You may find details at the link below        //
//             https://blog.csdn.net/LWanTao            //
//////////////////////////////////////////////////////////module SEG(clk,clr,din,seg,sel);
input clk;input clr;input [5:0] din;output reg[3:0] sel; //位选
output reg[7:0] seg; //段选
reg [7:0] seg_data; //该变量存储两个数码管分别显示的数值
reg selcnt; //位选计数器
reg [3:0] disp_data; //该变量存储单个数码管显示数值
reg [3:0] shiwei;reg [3:0] gewei;//存储个位与十位的BCD码
reg [5:0] fdin;//din的中继器（戏称：传话人）
always @(din) begin fdin <= din;end//将fdin与din绑定在一起，代替din输入倒计时
always@ (negedge clk or posedge clr)//该语句块将输入倒计时从二进制转为BCD码
begin if (clr) begin shiwei  <= 0;gewei   <= 0;end
      else if(~clk) begin shiwei  <= fdin/10  ;gewei   <= fdin%10  ;end end
always@ (posedge clk or posedge clr)//输出
begin if (clr) seg_data <= 0;
      else if(clk) seg_data <={shiwei,gewei};end
always@(posedge clk or posedge  clr)//数码管位选计数器
begin if (clr) selcnt <= 1'd0;
      else if (clk) selcnt <= ~selcnt;end
always@(*)//数码管位选显示
begin
 if(clr) disp_data <= 4'd0;
 else  begin case(selcnt) //数码管位选计数器&单个数码管显示数据切换
        1'd0    :  begin   sel = 4'h7;  disp_data = seg_data[7:4]; end
        1'd1    :  begin   sel = 4'hb;  disp_data = seg_data[3:0] ; end  
        default :  disp_data = 4'd0;endcase end end
always@(*)begin   //数码管段选显示,即：将显示数值转化为数码管能读懂的编码
    if(clr) seg <= 8'hff;else begin case(disp_data)
            4'd0		:	seg	 = 	8'hc0;	
			4'd1		:	seg	 = 	8'hf9;
			4'd2		:	seg	 = 	8'ha4;
			4'd3		:	seg	 = 	8'hb0;
			4'd4		:	seg	 = 	8'h99;
			4'd5		:	seg	 = 	8'h92;
			4'd6		:	seg	 = 	8'h82;
			4'd7		:	seg	 = 	8'hf8;
			4'd8		:	seg	 = 	8'h80;
			4'd9		:	seg	 = 	8'h90;
            default : seg = 8'hff; endcase end end endmodule