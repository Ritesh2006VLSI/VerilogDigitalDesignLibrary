`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:11:23
// Design Name: 
// Module Name: ring_counter
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
    input pr,
    input clr,
    input d,
    output reg q
    );
    always @(posedge clk or posedge pr or posedge clr)
    begin
        if(pr)
            q <= 1'b1;
        else if(clr)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module ring_counter(
    input clk,init,
    output [3:0]q
    );
    d_ff ff0(.clk(clk),.pr(init), .clr(1'b0), .d(q[3]), .q(q[0]));
    d_ff ff1(.clk(clk),.pr(1'b0), .clr(init), .d(q[0]), .q(q[1]));
    d_ff ff2(.clk(clk),.pr(1'b0), .clr(init), .d(q[1]), .q(q[2]));
    d_ff ff3(.clk(clk),.pr(1'b0), .clr(init), .d(q[2]), .q(q[3]));
endmodule
