`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2026 07:45:32
// Design Name: 
// Module Name: siso_tb
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


module siso_tb(

    );
    reg clk,rst,din;
    wire dout;

    siso uut(
    .din(din),
    .clk(clk),
    .rst(rst),
    .dout(dout)
    );

    always #5 clk = ~clk;

    initial
    begin
        clk = 0;
        rst = 1;
        din = 0;

        #10 rst = 0;

        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;

        #30 $finish;
    end

    initial
        $monitor("t=%0t din=%b dout=%b",$time,din,dout);
endmodule
