`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 17:00:45
// Design Name: 
// Module Name: 4to1mux
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


module mux4to1(
    input i0,i1,i2,i3,
    input [1:0]select,
    output reg y
    );
    always@(*)begin
        case(select)
            2'b00 : y = i0 ;
            2'b01 : y = i1 ;
            2'b10 : y = i2 ;
            2'b11 : y = i3 ;
        endcase
    end
endmodule
