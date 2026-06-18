`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 11:38:48
// Design Name: 
// Module Name: johnson_counter_tb
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


module johnson_counter_tb(

    );
    reg clk;
    reg rst;
    wire [3:0] q;
    johnson_counter uut(
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    always #5 clk = ~clk;
    initial
    begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #100 $finish;
    end
    initial
    begin
        $display("RST\tQ");
        $monitor("%b\t%b", rst, q);
    end
endmodule
