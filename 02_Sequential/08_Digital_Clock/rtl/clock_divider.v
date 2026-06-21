`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 18:57:46
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clk,
    input rst,
    output reg tick_1s
    );
    reg [25:0]count;
    always@(posedge clk)begin
        if(rst) begin 
                count<=26'b0; 
                tick_1s<=0; 
            end
        else if(count==26'd0) begin 
                count<=26'b0;
                tick_1s<=1'b1; 
            end
        else begin 
                count<=count+1'b1;   
                tick_1s<=1'b0; 
            end
        end
endmodule
