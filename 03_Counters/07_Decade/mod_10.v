`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:55:02
// Design Name: 
// Module Name: mod_10
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

module d_ff(
    input d,clk,rst,
    output reg q
    );
    always@(posedge clk or posedge rst)begin
        if(rst) q <= 1'b0 ;
        else q <= d ;
    end
endmodule

module mod_10(
    input clk,rst,
    output [3:0]q
    );
    wire d0,d1,d2,d3;
    assign d0 = ~q[0];
    assign d1 = ~q[3] & (q[1] ^ q[0]);
    assign d2 = q[2] ^ (q[1] & q[0]);
    assign d3 = (q[3] & ~q[0]) | (q[2] & q[1] & q[0]);
    d_ff ff0(.clk(clk), .rst(rst), .d(d0), .q(q[0]));
    d_ff ff1(.clk(clk), .rst(rst), .d(d1), .q(q[1]));
    d_ff ff2(.clk(clk), .rst(rst), .d(d2), .q(q[2]));
    d_ff ff3(.clk(clk), .rst(rst), .d(d3), .q(q[3]));
endmodule
