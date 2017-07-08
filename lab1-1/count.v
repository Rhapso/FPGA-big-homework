`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:44 03/24/2017 
// Design Name: 
// Module Name:    count 
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
module count_sub(
input wire [3:0] num,
output reg [6:0] a_to_g );

always @(*)
case(num)
0: a_to_g=7'b0000001;
1: a_to_g=7'b1001111;
2: a_to_g=7'b0010010;
3: a_to_g=7'b0000110;
4: a_to_g=7'b1001100;
5: a_to_g=7'b0100100;
6: a_to_g=7'b0100000; 
7: a_to_g=7'b0001111;
8: a_to_g=7'b0000000;
9: a_to_g=7'b0000100;
'hA: a_to_g=7'b0001000;
'hB: a_to_g=7'b1100000;
'hC: a_to_g=7'b0110001;
'hD: a_to_g=7'b1000010;
'hE: a_to_g=7'b0110000;
'hF: a_to_g=7'b0111000;
default: a_to_g=7'b0000001;
endcase
endmodule

module count_top(
 input wire[3:0]sw,
 output wire[6:0]a_to_g,
 output wire[3:0]an );

assign an=4'b0000;

count_sub  A1(.num(sw),
             .a_to_g (a_to_g)
			  );
endmodule