`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:22:04
// Design Name: 
// Module Name: t_ff_tb
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


module t_ff_tb(

    );
    reg t, clk;
    wire q, qbar;

    t_ff uut(
        .t(t),
        .clk(clk),
        .q(q)
    );

    always #5 clk = ~clk;

    initial
    begin
        $monitor("clk=%b t=%b q=%b qbar=%b",
                  clk, t, q, ~q);

        clk = 0;
        uut.q = 0;
        t = 0; #10;  // hold
        t = 1; #40;  // toggle
        t = 0; #10;  // hold
        t = 1; #20;  // toggle

        $finish;
    end
endmodule
