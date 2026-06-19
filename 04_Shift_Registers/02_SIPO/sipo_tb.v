`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 08:12:01
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb(
    );
    reg clk;
    reg rst;
    reg din;
    wire [3:0] q;
    sipo uut(.din(din),.clk(clk),.rst(rst),.q(q));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        din = 0;
        #10 rst = 0;
        // Shift in 1 0 1 1
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        #20;
        $finish;
    end
    always @(posedge clk)
    begin
        $display("s_in=%b q=%b", din, q);
    end
endmodule
