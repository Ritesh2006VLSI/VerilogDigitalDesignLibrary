`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:34:45
// Design Name: 
// Module Name: bcd_to_excess3
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


module bcd_to_excess3(
    input [3:0]bcd,
    output [3:0]excess3
    );
    assign excess3 = bcd + 4'd3;
endmodule
