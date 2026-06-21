
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:49:36
// Design Name: 
// Module Name: tb_digital_clock
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


`timescale 1ns/1ps

module tb_digital_clock;
    reg clk;
    reg rst;
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;
    // Instantiate DUT
    digital_clock dut (
        .clk(clk),
        .rst(rst),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    );
    // Clock generation (10 ns period)
    always #5 clk = ~clk;
    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        // Hold reset
        #20;
        rst = 0;
        // Run simulation long enough
        #20000;
        $finish;
    end
    // Monitor time
    initial begin
        $monitor("TIME=%0t | %02d:%02d:%02d",
                  $time, hours, minutes, seconds);
    end
endmodule

