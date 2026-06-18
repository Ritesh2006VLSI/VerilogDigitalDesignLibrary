`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:30:51
// Design Name: 
// Module Name: d_latch_theory
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


module d_latch_theory(
    input d,
    input en,
    output q,qbar
    );
    wire S,R;

    and(S,d,en);
    and(R,~d,en);

    nor(q,R,qbar);
    nor(qbar,S,q);
endmodule
