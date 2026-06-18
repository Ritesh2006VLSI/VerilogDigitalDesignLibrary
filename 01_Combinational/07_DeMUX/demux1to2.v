`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 18:32:50
// Design Name: 
// Module Name: demux1to2
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


module demux1to2(
    input datain,
    input select,
    output y0,y1
    );
    assign y0 = (~select) & datain ;
    assign y1 = select & datain ;
endmodule
