`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:24:11
// Design Name: 
// Module Name: binary_to_gray_tb
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


module binary_to_gray_tb(

    );
    reg [3:0] bin;
    wire [3:0] gray;
    binary_to_gray uut(
        .bin(bin),
        .gray(gray)
    );
    initial begin
        bin=4'b0000; #10;
        bin=4'b0001; #10;
        bin=4'b0010; #10;
        bin=4'b0011; #10;
        bin=4'b0100; #10;
        $finish;
    end
    initial
        $monitor("bin=%b gray=%b", bin, gray);
    endmodule
