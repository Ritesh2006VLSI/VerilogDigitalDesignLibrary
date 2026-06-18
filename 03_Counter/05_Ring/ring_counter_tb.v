`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:24:02
// Design Name: 
// Module Name: ring_counter_tb
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


module ring_counter_tb(
    );
    reg clk;
    reg init;
    wire [3:0] q;
    ring_counter uut(
        .clk(clk),
        .init(init),
        .q(q)
    );
    always #5 clk = ~clk;
    initial
    begin
        clk = 0;
        init = 1;      // Load 0001
        #10 init = 0;  // Start shifting
        #100 $finish;
    end
    initial
    begin
        $display("Init\tQ");
        $monitor("%b\t%b", init, q);
    end
endmodule
