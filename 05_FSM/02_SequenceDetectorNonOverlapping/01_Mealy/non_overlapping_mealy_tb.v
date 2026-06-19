`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 10:38:23
// Design Name: 
// Module Name: non_overlapping_moore_tb
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


module non_overlapping_mealy_tb(

    );
    reg clk;
    reg rst;
    reg x;
    wire y;
    non_overlapping_mealy dut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );
    // Clock Generation
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        x   = 0;
        #10 rst = 0;
        // Input Stream : 1011011
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;   // Detect 1011
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;   // Detect 1011 again (overlap)
        #20;
        $finish;
    end
    initial begin
        $monitor("rst=%b x=%b y=%b",rst, x, y);
    end
endmodule
