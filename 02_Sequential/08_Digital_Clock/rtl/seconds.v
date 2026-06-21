`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:08:33
// Design Name: 
// Module Name: seconds
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


module seconds(
    input clk,
    input rst,
    input tick_1s,
    output reg [5:0]seconds,
    output reg tick_1m
    );
    always@(posedge clk)begin
        if(rst)begin 
            seconds<=0;
            tick_1m<=0;
            end
        else if (tick_1s) begin
                if (seconds == 6'd59) begin
                    seconds   <= 6'd0;
                    tick_1m <= 1'b1;
                end
                else begin
                    seconds   <= seconds + 1'b1;
                    tick_1m <= 1'b0;
                end
            end
        else begin
                seconds <= seconds;
                tick_1m <= 1'b0;
            end
        end
endmodule
