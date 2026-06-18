`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 11:16:32
// Design Name: 
// Module Name: logic_gates
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


module logic_gates(
    input a,
    input b,
    output out_and,
    output out_or,
    output out_xor,
    output out_not
    );
    assign out_and = a & b ;
    assign out_or = a | b ;
    assign out_xor = a ^ b ;
    assign out_not = ~ a ;
endmodule
