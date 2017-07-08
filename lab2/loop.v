`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:48 03/24/2017 
// Design Name: 
// Module Name:    loop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module loop_sub(
input [3:0]NUM,
input[3:0]SW,
output reg[3:0]an,
output reg[6:0]a_to_g
    );

always @(*)
an = ~ SW;

always @(*) 
case(NUM)
0:a_to_g=7'b0000001;
1:a_to_g=7'b1001111;
2:a_to_g=7'b0010010;
3:a_to_g=7'b0000110;
4:a_to_g=7'b1001100;
5:a_to_g=7'b0100100;
6:a_to_g=7'b0100000;
7:a_to_g=7'b0001111;
8:a_to_g=7'b0000000;
9:a_to_g=7'b0000100;
'hA: a_to_g=7'b0001000;
'hB: a_to_g=7'b1100000;
'hC: a_to_g=7'b0110001;
'hD: a_to_g=7'b1000010;
'hE: a_to_g=7'b0110000;
'hF: a_to_g=7'b0111000;
default: a_to_g=7'b0000001; 
endcase
 
endmodule



module loop_top(
 input clk,
 input clr,
 input[3:0]SW,
 output[3:0]an,
 output[6:0]a_to_g
  );
reg[28:0] clk_cnt;                        //clock count
reg [3:0] NUM;                         //number printed on the segment LEDs

always @(posedge clk or posedge clr)       //deal the clock and clear events
begin
 if(clr)
 clk_cnt = 0;                      //if clear button pressed,clear the clock count
 else 
   begin
    clk_cnt = clk_cnt + 1;               //if clock flip, count clock 
    if(clk_cnt[28:25]>15)               //if count was full, back to zero
    clk_cnt = 0; 
   end
 end
 
always @(*) 
NUM = clk_cnt[28:25];          //take the higher four bits as number for printing

loop_sub A1( .NUM(NUM),
                  .SW(SW),
                  .an(an),
                  .a_to_g(a_to_g));     //call the sub display module

                                            
endmodule