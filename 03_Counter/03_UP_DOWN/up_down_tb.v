`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:32:57
// Design Name: 
// Module Name: up_down_tb
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


module up_down_tb(
    );
    reg clk,rst,mode;
    wire [3:0] q;
    up_down uut(
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        mode = 1;
        #10 rst = 0;
        #80 mode = 0;   // switch to down count
        #80 $finish;
    end
    initial
        $monitor("Mode=%b q=%b (%d)", mode, q ,q);
endmodule
