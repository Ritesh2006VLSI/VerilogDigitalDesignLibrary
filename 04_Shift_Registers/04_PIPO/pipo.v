`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 08:26:53
// Design Name: 
// Module Name: pipo
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
    input d, clk, rst,
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

module pipo(
    input clk,rst,
    input [3:0]din,
    output [3:0]q
    );
    d_ff ff0(.d(din[0]),.clk(clk),.rst(rst),.q(q[0]));
    d_ff ff1(.d(din[1]),.clk(clk),.rst(rst),.q(q[1]));
    d_ff ff2(.d(din[2]),.clk(clk),.rst(rst),.q(q[2]));
    d_ff ff3(.d(din[3]),.clk(clk),.rst(rst),.q(q[3]));
endmodule
