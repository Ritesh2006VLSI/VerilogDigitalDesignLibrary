`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:08:10
// Design Name: 
// Module Name: jk_ff
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


module jk_ff(
    input j,k,
    input clk,
    output reg q,
    output qbar
    );
    assign qbar = ~q ;
    always@(posedge clk)begin
        case({j,k})
            2'b00 : q <= q ;
            2'b01 : q <= 0 ;
            2'b10 : q <= 1 ;
            2'b11 : q <= ~q ;
        endcase
    end
endmodule
