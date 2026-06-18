`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:54:28
// Design Name: 
// Module Name: sr_ff
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


module sr_ff(
    input s,r,
    input clk,
    output reg q
    );
    always@(posedge clk)begin
        case({s,r})
            2'b00 : q <= q ;
            2'b01 : q <= 0 ;
            2'b10 : q <= 1 ;
            2'b11 : q <= 1'bx ;
        endcase
    end
endmodule
