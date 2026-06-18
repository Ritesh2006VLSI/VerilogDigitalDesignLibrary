`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 10:48:19
// Design Name: 
// Module Name: mod_N_counter
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


module mod_N_counter#(parameter N = 16)(
    input clk,rst,
    output reg [$clog2(N)-1:0]q
    );
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            q <= 0;
        else if(q == N-1)
            q <= 0;
        else
            q <= q + 1'b1;
    end
endmodule
