`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 20:52:43
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb(
    );
    reg clk;
    reg rst;
    wire clk_out;
    clock_divider uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #200 $finish;
    end
    initial begin
        $monitor("rst=%b clk=%b clk_out=%b",rst, clk, clk_out);
    end
endmodule
