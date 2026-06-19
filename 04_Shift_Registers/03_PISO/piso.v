`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 07:29:47
// Design Name: 
// Module Name: piso
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

module mux2to1(
    input i0,i1,s,
    output y
    );
    assign y = s ? i1 : i0 ;
endmodule

module d_ff(
    input d, clk,rst,
    output reg q
    );
    always@(posedge clk or posedge rst)begin
        if(rst) q <= 1'b0;
        else q <= d;
    end
endmodule

module piso(
    input clk,s,rst,
    input [3:0]din,
    output s_out,
    output [3:0]q
    );
    wire d0,d1,d2,d3;
    wire q0,q1,q2,q3;
    mux2to1 m1(.i0(din[0]),.i1(0),.s(s),.y(d0));
    mux2to1 m2(.i0(din[1]),.i1(q0),.s(s),.y(d1));
    mux2to1 m3(.i0(din[2]),.i1(q1),.s(s),.y(d2));
    mux2to1 m4(.i0(din[3]),.i1(q2),.s(s),.y(d3));
    d_ff ff0(.d(d0),.clk(clk),.rst(rst),.q(q0));
    d_ff ff1(.d(d1),.clk(clk),.rst(rst),.q(q1));
    d_ff ff2(.d(d2),.clk(clk),.rst(rst),.q(q2));
    d_ff ff3(.d(d3),.clk(clk),.rst(rst),.q(q3));
    assign s_out = q3;
    assign q = {q3,q2,q1,q0};
endmodule
