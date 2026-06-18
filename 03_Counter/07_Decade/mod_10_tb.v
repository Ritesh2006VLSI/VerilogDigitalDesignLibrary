`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:02:31
// Design Name: 
// Module Name: mod_10_tb
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


module mod_10_tb(
    );
    reg clk,rst;
    wire [3:0] q;
    mod_10 uut(
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #120 $finish;
    end
    initial
        $monitor("q=%b (%0d)", q, q);
endmodule
