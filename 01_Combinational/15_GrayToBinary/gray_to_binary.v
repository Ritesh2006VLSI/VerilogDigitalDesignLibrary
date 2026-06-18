`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:29:03
// Design Name: 
// Module Name: gray_to_binary
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


module gray_to_binary(
    input [3:0]gray,
    output [3:0]bin
    );
    assign bin[3] = gray[3];
    assign bin[2] = bin[3] ^ gray[2];
    assign bin[1] = bin[2] ^ gray[1];
    assign bin[0] = bin[1] ^ gray[0];
endmodule
