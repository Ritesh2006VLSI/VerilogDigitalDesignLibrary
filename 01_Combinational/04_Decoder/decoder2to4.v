`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 18:56:18
// Design Name: 
// Module Name: decoder2to4
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


module decoder2to4(
    input [1:0]D,
    output reg [3:0]Y
    );
    always@(*)begin
        case(D)
            2'd0 : Y = 4'b0001 ;
            2'd1 : Y = 4'b0010 ;
            2'd2 : Y = 4'b0100 ;
            2'd3 : Y = 4'b1000 ;
        endcase
    end
endmodule
