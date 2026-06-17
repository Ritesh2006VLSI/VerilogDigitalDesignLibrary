`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2026 09:55:42
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(

    );
    reg [3:0] a,b;
    wire [7:0] p;

    multiplier uut(
        a,
        b,
        p
    );

    initial begin
        $monitor("a=%d b=%d p=%d",a,b,p);

        a=4'd3;  b=4'd2;   #10;
        a=4'd5;  b=4'd4;   #10;
        a=4'd7;  b=4'd3;   #10;
        a=4'd15; b=4'd15;  #10;

        $finish;
    end
endmodule
