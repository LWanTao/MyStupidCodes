//////////////////////////////////////////////////////////////////////////////
//                              Frequency Divider                           //
// Author: AokIvan(https://github.com/aokivan)                              //
//                                                                          //
// Create Date: 2021/11/18                                                  //
//                                                                          //
// Project Requirements: Crossover frequency number should be adjustable    //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
module FDivider#(parameter MOD=7) 
            (clkin,clkout,rst_n); //F(clkin)=50Mhz
input clkin,rst_n;
output clkout;

if(MOD%2==1) 
odd_divider #(.NUM_DIV (MOD)) 
u1(.clk (clkin),.clk_div (clkout),.rst_n (rst_n));
else if(MOD%2==0) 
even_divider #(.NUM_DIV (MOD)) 
u1(.clk (clkin),.clk_div (clkout),.rst_n (rst_n));

endmodule