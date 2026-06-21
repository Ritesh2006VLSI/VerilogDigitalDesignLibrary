`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:18:50
// Design Name: 
// Module Name: hours
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


module hours(
    input clk,
    input rst,
    input tick_1h,
    output reg [4:0]hours
    );
    always @(posedge clk) begin
        if (rst) begin
            hours <= 5'd0;
        end
        else if (tick_1h) begin
            if (hours == 5'd23)
                hours <= 5'd0;
            else
                hours <= hours + 1'b1;
        end
    end
endmodule
