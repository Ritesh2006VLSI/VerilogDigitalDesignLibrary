`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:05:25
// Design Name: 
// Module Name: sr_latch_theory
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


module sr_latch_theory(
    input s,r,
    output q,
    output qbar
    );
    nor(q , r , qbar) ;
    nor(qbar , s , q) ;
endmodule
