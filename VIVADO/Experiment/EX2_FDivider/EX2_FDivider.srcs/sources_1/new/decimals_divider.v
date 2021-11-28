module decimals_divider //小数分频的基本思想是，输出时钟在一段时间内的平均频率达到分频要求即可。但是考虑到相位抖动，还需要对分频系数变化的分频逻辑进行平均操作。
  #(parameter SOURCE_NUM = 76 ,parameter DEST_NUM = 10)//前者为源clk的周期数，后者为分频输出clk的期望周期数
   (input rstn ,input clkin,output clkout);
   parameter SOURCE_DIV = SOURCE_NUM/DEST_NUM; //取源clk周期相对于分频输出期望周期的最大整除数（求商数）
   parameter DEST_DIV   = SOURCE_DIV + 1;      //分频周期分别为(SOURCE_DIV+1)和(DEST_DIV+2)  
   parameter DIFF_ACC   = SOURCE_NUM - SOURCE_DIV*DEST_NUM;//求两个分频周期的次数差（求余数）
   reg [3:0] cnt_end_r ;  //可变分频周期
   reg [3:0] main_cnt ;   //主计数器
   reg clkout_r ; //时钟输出，高电平周期数为1
   assign clkout = clkout_r ;
   always @(posedge clkin or negedge rstn) begin
      if (!rstn) begin main_cnt    <= 'b0 ; clkout_r  <= 1'b0 ;end
      else if (main_cnt == cnt_end_r) begin main_cnt    <= 'b0 ; clkout_r  <= 1'b1 ;end
      else begin main_cnt <= main_cnt + 1'b1 ; clkout_r  <= 1'b0 ;end end
   wire diff_cnt_en = (main_cnt == cnt_end_r) ;    //差值累加器使能控制
   reg [4:0] diff_cnt_r ;   
   wire [4:0] diff_cnt = (diff_cnt_r >= DEST_NUM) ? (diff_cnt_r -10 + DIFF_ACC) : (diff_cnt_r + DIFF_ACC) ;  //差值累加器逻辑                             
   always @(posedge clkin or negedge rstn) begin
      if (!rstn) begin diff_cnt_r <= 0 ;end       
      else if (diff_cnt_en) begin diff_cnt_r <= diff_cnt ;end end   
   always @(posedge clkin or negedge rstn) begin    //分频周期变量的控制逻辑
      if (!rstn) begin cnt_end_r <= SOURCE_DIV-1 ;end   
      else if (diff_cnt >= 10) begin cnt_end_r <= DEST_DIV-1 ;end   //差值累加器溢出时，修改分频周期  
      else begin cnt_end_r <= SOURCE_DIV-1 ;end end 
endmodule