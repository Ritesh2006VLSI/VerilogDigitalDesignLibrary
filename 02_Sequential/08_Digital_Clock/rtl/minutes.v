`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:15:38
// Design Name: 
// Module Name: minutes
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


module minutes(
    input clk,
    input rst,
    input tick_1m,
    output reg [5:0]minutes,
    output reg tick_1h
    );
    always@(posedge clk)begin
        if(rst)begin 
            minutes<=0;
            tick_1h<=0;
            end
        else if (tick_1m) begin
                if (minutes == 6'd59) begin
                    minutes   <= 6'd0;
                    tick_1h <= 1'b1;
                end
                else begin
                    minutes   <= minutes + 1'b1;
                    tick_1h <= 1'b0;
                end
            end
        else begin
                minutes <= minutes;
                tick_1h <= 1'b0;
            end
        end
endmodule
