`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 08:46:50
// Design Name: 
// Module Name: bidirectional_tb
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


module bidirectional_tb(
    );
    reg clk;
    reg rst;
    reg [1:0] sel;
    reg [3:0] din;
    wire [3:0] q;
    bidirectional_shift uut(.clk(clk),.rst(rst),.sel(sel),.din(din),.q(q));
    always #5 clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
        sel = 2'b00;
        din = 4'b0000;
        #10 rst = 0;
        sel = 2'b11;
        din = 4'b1011;
        #10;
        sel = 2'b00;
        #10;
        sel = 2'b01;
        #30;
        sel = 2'b11;
        din = 4'b1100;
        #10;
        sel = 2'b10;
        #30;
        $finish;
    end
    always @(posedge clk)
    begin
        #1;
        $display("sel=%b din=%b q=%b", sel, din, q);
    end
endmodule
