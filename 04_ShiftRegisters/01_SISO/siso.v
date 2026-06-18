`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 07:33:22
// Design Name: 
// Module Name: siso
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

module dff(
    input clk,
    input rst,
    input d,
    output reg q
    );
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module siso(
    input din,
    input clk,rst,
    output dout
    );
    wire q0,q1,q2,q3;

    dff d0(
        .clk(clk),
        .rst(rst),
        .d(din),
        .q(q0)
    );

    dff d1(
        .clk(clk),
        .rst(rst),
        .d(q0),
        .q(q1)
    );

    dff d2(
        .clk(clk),
        .rst(rst),
        .d(q1),
        .q(q2)
    );

    dff d3(
        .clk(clk),
        .rst(rst),
        .d(q2),
        .q(q3)
    );

    assign dout = q3;
endmodule
