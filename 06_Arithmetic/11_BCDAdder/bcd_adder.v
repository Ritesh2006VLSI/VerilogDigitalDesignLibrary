`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 21:10:54
// Design Name: 
// Module Name: bcd_adder
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

module fa(
    input a,b,cin,
    output sum,cout
    );
    assign sum = ( (a ^ b) ^ cin ) ;
    assign cout = (a & b)|((a ^ b) & cin) ;
endmodule

module rca4(
    input [3:0]a,b,
    input cin,
    output [3:0]sum,
    output cout
    );
    wire w,x,y;
    fa f1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(w));
    fa f2(.a(a[1]),.b(b[1]),.cin(w),.sum(sum[1]),.cout(x));
    fa f3(.a(a[2]),.b(b[2]),.cin(x),.sum(sum[2]),.cout(y));
    fa f4(.a(a[3]),.b(b[3]),.cin(y),.sum(sum[3]),.cout(cout));
endmodule

module bcd_adder(
    input [3:0]a,b,
    input cin,
    output [3:0]sum,
    output cout
    );
    wire [3:0] temp_sum;
    wire c_out;
    wire correction;
    wire [3:0] corrected_sum;
    wire dummy;
    rca4 adder1(.a(a),.b(b),.cin(cin),.sum(temp_sum),.cout(c_out));
    assign correction = c_out | (temp_sum[3] & temp_sum[2]) | (temp_sum[3] & temp_sum[1]);
    rca4 adder2(.a(temp_sum),.b({1'b0, correction, correction, 1'b0}),.cin(1'b0),.sum(corrected_sum),.cout(dummy));
    assign sum  = corrected_sum;
    assign cout = correction;
endmodule
