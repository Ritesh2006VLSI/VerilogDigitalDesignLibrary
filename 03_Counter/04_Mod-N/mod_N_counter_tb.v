`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:49:57
// Design Name: 
// Module Name: mod_N_counter_tb
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


module mod_N_counter_tb(

    );
    reg clk,rst;
    wire [3:0] q;
    mod_N_counter #(12) uut(
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #150 $finish;
    end
    initial
        $monitor("q=%d  (%d)", q, q);
endmodule
