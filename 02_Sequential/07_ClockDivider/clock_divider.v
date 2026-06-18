`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 20:49:06
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

//divides clock frequency by 16
module clock_divider(
    input clk,rst,
    output clk_out
    );
    reg [3:0]count;
    always@(posedge clk or posedge rst)begin
        if(rst)
            count <= 4'b0000;
        else
            count <= count + 1;
    end
    assign clk_out = count[3];
endmodule
