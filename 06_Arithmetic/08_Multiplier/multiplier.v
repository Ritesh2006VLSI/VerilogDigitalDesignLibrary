`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 08:32:13
// Design Name: 
// Module Name: multiplier
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
    output sum,carry
    );
    assign sum = a^b ;
    assign carry = a&b ;
endmodule

module full_adder(
    input a,b,cin,
    output sum,carry
    );
    wire s1,c1,c2;
    half_adder h1(a,b,s1,c1);
    half_adder h2(s1,cin,sum,c2);
    or(carry,c1,c2);
endmodule

module adder_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);

    wire c1,c2,c3,c4,c5,c6,c7;

    full_adder f1(a[0],b[0],cin,sum[0],c1);
    full_adder f2(a[1],b[1],c1 ,sum[1],c2);
    full_adder f3(a[2],b[2],c2 ,sum[2],c3);
    full_adder f4(a[3],b[3],c3 ,sum[3],c4);
    full_adder f5(a[4],b[4],c4 ,sum[4],c5);
    full_adder f6(a[5],b[5],c5 ,sum[5],c6);
    full_adder f7(a[6],b[6],c6 ,sum[6],c7);
    full_adder f8(a[7],b[7],c7 ,sum[7],cout);

endmodule

module multiplier(
    input [3:0]a,b,
    output [7:0]p
    );
    wire [7:0] pp0,pp1,pp2,pp3;
    wire [7:0] sum1,sum2;
    wire c1,c2,c3;

    assign pp0 = b[0] ? {4'b0000,a}        : 8'b00000000;
    assign pp1 = b[1] ? ({4'b0000,a} << 1) : 8'b00000000;
    assign pp2 = b[2] ? ({4'b0000,a} << 2) : 8'b00000000;
    assign pp3 = b[3] ? ({4'b0000,a} << 3) : 8'b00000000;

    adder_8bit a1(
        pp0,
        pp1,
        1'b0,
        sum1,
        c1
    );

    adder_8bit a2(
        sum1,
        pp2,
        1'b0,
        sum2,
        c2
    );

    adder_8bit a3(
        sum2,
        pp3,
        1'b0,
        p,
        c3
    );
endmodule
