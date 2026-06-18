`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 18:32:50
// Design Name: 
// Module Name: demux1to4
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


module demux1to4(
    input datain,
    input [1:0]select,
    output reg [3:0]y
    );
    always@(*)begin
        y = 4'd0;
        case(select)
            2'b00 : y[0] = datain ;
            2'b01 : y[1] = datain ;
            2'b10 : y[2] = datain ;
            2'b11 : y[3] = datain ;
        endcase
    end
endmodule
