`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 18:32:50
// Design Name: 
// Module Name: demux1to8
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


module demux1to8(
    input datain,
    input [2:0]select,
    output reg [7:0]y
    );
    always@(*)begin
        y = 4'd0;
        case(select)
            3'd0 : y[0] = datain ;
            3'd1 : y[1] = datain ;
            3'd2 : y[2] = datain ;
            3'd3 : y[3] = datain ;
            3'd4 : y[4] = datain ;
            3'd5 : y[5] = datain ;
            3'd6 : y[6] = datain ;
            3'd7 : y[7] = datain ;
        endcase
    end
endmodule
