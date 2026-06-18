`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:29:24
// Design Name: 
// Module Name: gray_to_binary_tb
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


module gray_to_binary_tb(

    );
    reg [3:0] gray;
    wire [3:0] bin;
    gray_to_binary uut(
        .gray(gray),
        .bin(bin)
    );
    initial begin
        gray=4'b0000; #10;
        gray=4'b0001; #10;
        gray=4'b0011; #10;
        gray=4'b0010; #10;
        $finish;
    end
    initial
        $monitor("gray=%b bin=%b", gray, bin);
endmodule
