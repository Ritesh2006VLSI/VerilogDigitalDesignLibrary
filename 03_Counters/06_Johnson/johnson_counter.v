`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:33:05
// Design Name: 
// Module Name: johnson_counter
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
    input clk,
    input clr,
    input d,
    output reg q
    );
    always @(posedge clk or posedge clr)
    begin
        if(clr)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module johnson_counter(
    input clk,rst,
    output [3:0]q
    );
    d_ff ff0(.clk(clk), .clr(rst), .d(~q[3]), .q(q[0]));
    d_ff ff1(.clk(clk), .clr(rst), .d(q[0]), .q(q[1]));
    d_ff ff2(.clk(clk), .clr(rst), .d(q[1]), .q(q[2]));
    d_ff ff3(.clk(clk), .clr(rst), .d(q[2]), .q(q[3]));
endmodule
