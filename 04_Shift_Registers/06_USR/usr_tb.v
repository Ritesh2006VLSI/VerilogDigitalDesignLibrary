`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 09:03:43
// Design Name: 
// Module Name: usr_tb
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


module usr_tb(
    );
    reg clk;
    reg rst;
    reg [1:0] sel;
    reg [3:0] din;
    reg sr_in;
    reg sl_in;
    wire [3:0] q;
    usr uut(.clk(clk),.rst(rst),.sel(sel),.din(din),.sr_in(sr_in),.sl_in(sl_in),.q(q));
    always #5 clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
        sel = 2'b00;
        din = 4'b0000;
        sr_in = 0;
        sl_in = 0;
        #10 rst = 0;
        sel = 2'b11;
        din = 4'b1011;
        #10;
        sel = 2'b00;
        #10;
        sel = 2'b01;
        sr_in = 1;
        #30;
        sel = 2'b11;
        din = 4'b1100;
        #10;
        sel = 2'b10;
        sl_in = 1;
        #30;
        $finish;
    end
    always @(posedge clk)
    begin
        #1;
        $display("sel=%b din=%b sr_in=%b sl_in=%b q=%b", sel,din,sr_in,sl_in,q);
    end
endmodule
