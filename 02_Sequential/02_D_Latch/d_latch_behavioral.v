`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:30:51
// Design Name: 
// Module Name: d_latch_behavioral
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


module d_latch_behavioral(
    input d,
    input en,
    output reg q,
    output qbar
    );
    assign qbar = ~q ;
    always@(d | en)begin
        case(en)
            1'b0 : q = q ;
            1'b1 : q = d ;
        endcase
    end
endmodule
