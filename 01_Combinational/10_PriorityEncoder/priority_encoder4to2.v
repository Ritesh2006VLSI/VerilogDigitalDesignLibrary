`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2026 06:25:05
// Design Name: 
// Module Name: priority_encoder4to2
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


module priority_encoder4to2(
    input [3:0]I,
    output reg [1:0]Y
    );
    always @(*) begin
        casex(I)
            4'b1xxx: Y = 2'b11;
            4'b01xx: Y = 2'b10;
            4'b001x: Y = 2'b01;
            4'b0001: Y = 2'b00;
            default: Y = 2'b00;
        endcase
    end
endmodule
