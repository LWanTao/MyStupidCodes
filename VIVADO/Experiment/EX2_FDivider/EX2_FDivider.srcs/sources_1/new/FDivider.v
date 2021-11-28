//////////////////////////////////////////////////////////////////////////////
//                              Frequency Divider                           //
// Author: AokIvan(https://github.com/aokivan)                              //
//                                                                          //
// Create Date: 2021/11/18                                                  //
//                                                                          //
// Project Requirements: Crossover frequency number should be adjustable    //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
module FDivider#(parameter subMOD=6,MOD=1) 
//subMOD为源clk周期数，MOD为分频输出clk期望周期数，
//故特定后者为10的即为小数，后者为1的即为偶数或奇数。
            (clkin,clkout,rst_n); //因为clkin每20ns翻转一次，则周期为40ns，故F(clkin)=25Mhz
input clkin,rst_n;
output clkout;
//原理为：判断输入的分子与分母，选择性地进行模块例化
if((MOD==1)&&(subMOD%2==1)) //若分频输出clk期望周期数为1且除以2余1，则绑定奇数分频器
odd_divider #(.NUM_DIV (subMOD/MOD)) 
u1(.clk (clkin),.clk_div (clkout),.rst_n (rst_n));
else if((MOD==1)&&(subMOD%2==0)) //若分频输出clk期望周期数为1且除以2余0，则绑定偶数分频器
even_divider #(.NUM_DIV (subMOD/MOD)) 
u1(.clk (clkin),.clk_div (clkout),.rst_n (rst_n));
else if(MOD==10)//若分频输出clk期望周期数为10，则绑定小数分频器
decimals_divider #(.SOURCE_NUM (subMOD),.DEST_NUM (MOD)) 
u1(.clkin (clkin),.clkout (clkout),.rstn (rst_n));
endmodule