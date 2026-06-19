`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 08:59:40
// Design Name: 
// Module Name: usr
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

module mux4to1(
    input i0,i1,i2,i3,
    input [1:0] sel,
    output y
    );
    assign y = (sel == 2'b00) ? i0 : (sel == 2'b01) ? i1 : (sel == 2'b10) ? i2 : i3;
endmodule


module d_ff(
    input d,
    input clk,
    input rst,
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


module usr(
    input clk,
    input rst,
    input [1:0] sel,
    input [3:0] din,
    input sr_in,
    input sl_in,
    output [3:0] q
);
    wire q0,q1,q2,q3;
    wire d0,d1,d2,d3;
    mux4to1 m0(.i0(q0),.i1(q1),.i2(sl_in),.i3(din[0]),.sel(sel),.y(d0));
    mux4to1 m1(.i0(q1),.i1(q2),.i2(q0),.i3(din[1]),.sel(sel),.y(d1));
    mux4to1 m2(.i0(q2),.i1(q3),.i2(q1),.i3(din[2]),.sel(sel),.y(d2));
    mux4to1 m3(.i0(q3),.i1(sr_in),.i2(q2),.i3(din[3]),.sel(sel),.y(d3));
    d_ff ff0(.d(d0), .clk(clk), .rst(rst), .q(q0));
    d_ff ff1(.d(d1), .clk(clk), .rst(rst), .q(q1));
    d_ff ff2(.d(d2), .clk(clk), .rst(rst), .q(q2));
    d_ff ff3(.d(d3), .clk(clk), .rst(rst), .q(q3));
    assign q = {q3,q2,q1,q0};
endmodule
