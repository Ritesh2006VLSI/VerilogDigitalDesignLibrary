`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 19:01:19
// Design Name: 
// Module Name: decoder3to8
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


module decoder3to8(
    input [2:0]D,
    output reg [7:0]Y
    );
    always@(*)begin
        case(D)
            3'd0 : Y = 8'b00000001 ;
            3'd1 : Y = 8'b00000010 ;
            3'd2 : Y = 8'b00000100 ;
            3'd3 : Y = 8'b00001000 ;
            3'd4 : Y = 8'b00010000 ;
            3'd5 : Y = 8'b00100000 ;
            3'd6 : Y = 8'b01000000 ;
            3'd7 : Y = 8'b10000000 ;
        endcase
    end
endmodule
