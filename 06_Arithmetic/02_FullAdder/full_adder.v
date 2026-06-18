`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 07:36:10
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module half_adder(
    input a,b,
    output sum,cout
);
    xor(sum , a , b);
    and(cout , a , b);
endmodule

module full_adder(
    input a,b,cin,
    output sum,cout
    );
    wire s1,c1,c2;
    half_adder h1(a , b, s1, c1);
    half_adder h2(s1, cin , sum , c2);
    or(cout , c1, c2);
endmodule
