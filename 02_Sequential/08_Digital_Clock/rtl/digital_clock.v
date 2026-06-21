`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:24:19
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk,
    input rst,
    output [5:0]seconds,
    output [5:0]minutes,
    output [4:0]hours
    );
    wire tick_1s;
    wire tick_1m;
    wire tick_1h;
    clock_divider clkdivider(.clk(clk),.rst(rst),.tick_1s (tick_1s));
    seconds second(.clk(clk),.rst(rst),.tick_1s (tick_1s),.seconds(seconds),.tick_1m(tick_1m));
    minutes minute(.clk(clk),.rst(rst),.tick_1m(tick_1m),.minutes(minutes),.tick_1h(tick_1h));
    hours hour(.clk(clk),.rst(rst),.tick_1h(tick_1h),.hours(hours));
endmodule
