`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 08:06:41
// Design Name: 
// Module Name: sipo
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

module sipo(
    input din,
    input clk,rst,
    output [3:0]q
    );
    wire q0,q1,q2,q3;
    d_ff d0(.d(din),.clk(clk),.rst(rst),.q(q0));
    d_ff d1(.d(q[0]),.clk(clk),.rst(rst),.q(q1));
    d_ff d2(.d(q[1]),.clk(clk),.rst(rst),.q(q2));
    d_ff d3(.d(q[2]),.clk(clk),.rst(rst),.q(q3));
    assign q ={q3,q2,q1,q0};
endmodule
