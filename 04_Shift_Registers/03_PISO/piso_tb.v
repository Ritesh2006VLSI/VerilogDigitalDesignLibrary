`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 07:57:35
// Design Name: 
// Module Name: piso_tb
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


module piso_tb(
    );
    reg clk;
    reg rst;
    reg s;
    reg [3:0] din;
    wire s_out;
    wire [3:0]q;
    piso uut (.clk(clk),.s(s),.rst(rst),.din(din),.s_out(s_out),.q(q));
    // Clock Generation
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        s = 0;
        din = 4'b0000;
        #10;
        rst = 0;
        // Load 1011
        din = 4'b1011;
        s = 0;
        #10;
        // Shift
        s = 1;
        #40;
        // Load 1100
        din = 4'b1100;
        s = 0;
        #10;
        // Shift
        s = 1;
        #40;
        $finish;
    end
    initial begin
        $monitor("s=%b q=%b s_out=%b",s,q,s_out);
    end
endmodule
