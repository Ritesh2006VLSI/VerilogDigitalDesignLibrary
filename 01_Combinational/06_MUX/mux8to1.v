`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 17:10:08
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input i0,i1,i2,i3,i4,i5,i6,i7,
    input [2:0]select,
    output reg y
    );
    always@(*)begin
        case(select)
            3'd0 : y = i0 ;
            3'd1 : y = i1 ;
            3'd2 : y = i2 ;
            3'd3 : y = i3 ;
            3'd4 : y = i4 ;
            3'd5 : y = i5 ;
            3'd6 : y = i6 ;
            3'd7 : y = i7 ;
        endcase
    end
endmodule
