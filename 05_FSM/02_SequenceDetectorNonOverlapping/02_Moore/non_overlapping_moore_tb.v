`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 21:09:58
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


module non_overlapping_moore_tb(

    );
    reg clk;
    reg rst;
    reg x;
    wire y;
    non_overlapping_moore dut (.clk(clk),.rst(rst),.x(x),.y(y));
    // Clock Generation
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        x   = 0;
        #10 rst = 0;
        // Input stream : 1011011
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        #20;
        $finish;
    end
    initial begin
        $monitor("rst=%b x=%b y=%b state=%b",
                  rst, x, y, dut.state);
    end
endmodule
