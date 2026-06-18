`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:35:18
// Design Name: 
// Module Name: bcd_to_excess3_tb
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


module bcd_to_excess3_tb(

    );
    reg [3:0] bcd;
    wire [3:0] excess3;
    bcd_to_excess3 uut(
        .bcd(bcd),
        .excess3(excess3)
    );
    initial begin
        bcd=4'd0; #10;
        bcd=4'd1; #10;
        bcd=4'd5; #10;
        bcd=4'd9; #10;
        $finish;
    end
    initial
        $monitor("BCD=%d Excess3=%b", bcd, excess3);
endmodule
