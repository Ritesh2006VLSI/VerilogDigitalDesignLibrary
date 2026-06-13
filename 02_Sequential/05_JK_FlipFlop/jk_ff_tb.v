`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:14:07
// Design Name: 
// Module Name: jk_ff_tb
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


module jk_ff_tb(

    );
    reg j, k, clk;
    wire q, qbar;

    jk_ff uut (
        .j(j),
        .k(k),
        .clk(clk),
        .q(q),
        .qbar(qbar)
    );

    always #5 clk = ~clk;

    initial
    begin
        $monitor("clk=%b j=%b k=%b q=%b qbar=%b",
                clk, j, k, q, qbar);

        clk = 0;

        j = 0; k = 0; #10;  // hold
        j = 1; k = 0; #10;  // set
        j = 0; k = 1; #10;  // reset
        j = 1; k = 1; #20;  // toggle twice
        j = 0; k = 0; #10;  // hold

        $finish;
    end
endmodule
