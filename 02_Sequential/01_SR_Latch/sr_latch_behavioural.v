`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:05:25
// Design Name: 
// Module Name: sr_latch_behavioural
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


module sr_latch_behavioural(
    input s,r,
    output reg q,
    output qbar
    );
    assign qbar = ~q ;
    always@(s | r)begin
        case({s,r})
            2'b00 : q = q ;
            2'b01 : q = 0 ;
            2'b10 : q = 1 ;
            2'b11 : q = 1'bx ;
        endcase
    end
endmodule
